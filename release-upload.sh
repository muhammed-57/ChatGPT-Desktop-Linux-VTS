#!/bin/bash
set -e
set -o pipefail

# ==========================================================
# ChatGPT Desktop (Vishwanath Tec Systems)
# Automatic Build + Release Manager
# ==========================================================

# --- CONFIGURATION ---
REPO="vtsadmin/ChatGPT-Desktop-Linux-VTS"
TITLE_BASE="ChatGPT Desktop (Vishwanath Tec Systems)"
VERSION_FILE=".version"
NOTES_FILE=".release_notes.txt"
BUILD_DIR="build"
PKG_DIR="packaging"
SRC_DIR="src"
SPEC_FILE="packaging/chatgpt-desktop.spec"
APP_NAME="ChatGPT_Desktop-x86_64.AppImage"

# --- COLOR OUTPUT ---
green(){ echo -e "\033[1;32m$1\033[0m"; }
red(){ echo -e "\033[1;31m$1\033[0m"; }
yellow(){ echo -e "\033[1;33m$1\033[0m"; }

# --- DETERMINE VERSION ---
if [ ! -f "$VERSION_FILE" ]; then
  echo "1.0.0" > "$VERSION_FILE"
fi
CURRENT_VERSION=$(cat "$VERSION_FILE")
TAG="v$CURRENT_VERSION"

# --- CREATE CHANGELOG ---
if git rev-parse --verify HEAD >/dev/null 2>&1; then
  git log -5 --pretty=format:"- %s (%h)" > "$NOTES_FILE"
else
  echo "- Initial release" > "$NOTES_FILE"
fi

# --- BUILD SECTION ---
if [[ "$1" == "--build" ]]; then
  yellow "🧩 Cleaning old builds..."
  rm -rf "$BUILD_DIR" "$PKG_DIR"
  mkdir -p "$BUILD_DIR" "$PKG_DIR"

  # Copy source
  cp -r "$SRC_DIR"/* "$BUILD_DIR/"

  yellow "🔧 Building AppImage..."
  pushd "$SRC_DIR" >/dev/null
  if [ -f "appimagetool-x86_64.AppImage" ]; then
    chmod +x appimagetool-x86_64.AppImage
    ARCH=x86_64 ./appimagetool-x86_64.AppImage ChatGPT.AppDir
    mv ChatGPT_Desktop-x86_64.AppImage ../$BUILD_DIR/
  else
    red "❌ appimagetool-x86_64.AppImage not found!"
    exit 1
  fi
  popd >/dev/null

  yellow "📦 Building DEB..."
  mkdir -p chatgpt-desktop-deb/usr/{local/bin,share/applications,share/icons}
  cp "$SRC_DIR/chatgpt-launcher" chatgpt-desktop-deb/usr/local/bin/
  cp "$SRC_DIR/chatgpt.desktop" chatgpt-desktop-deb/usr/share/applications/
  cp "$SRC_DIR/chatgpt-256.png" chatgpt-desktop-deb/usr/share/icons/chatgpt.png

  mkdir -p chatgpt-desktop-deb/DEBIAN
  cat > chatgpt-desktop-deb/DEBIAN/control <<EOF
Package: chatgpt-desktop
Version: $CURRENT_VERSION
Architecture: amd64
Maintainer: Vishwanath Tec Systems
Description: ChatGPT Desktop App for Linux (VTS)
EOF
  dpkg-deb --build chatgpt-desktop-deb "$PKG_DIR/chatgpt-desktop-${CURRENT_VERSION}.deb"
  rm -rf chatgpt-desktop-deb

  yellow "📦 Building RPM..."
  mkdir -p ~/rpmbuild/{SOURCES,SPECS}
  tar -czf ~/rpmbuild/SOURCES/chatgpt-desktop-${CURRENT_VERSION}.tar.gz -C "$SRC_DIR" chatgpt-launcher chatgpt.desktop chatgpt-256.png
  cat > ~/rpmbuild/SPECS/chatgpt-desktop.spec <<EOF
Name: chatgpt-desktop
Version: ${CURRENT_VERSION}
Release: 1%{?dist}
Summary: ChatGPT Desktop App (Vishwanath Tec Systems)
License: MIT
BuildArch: x86_64
Requires: /usr/bin/google-chrome

%description
ChatGPT Desktop for Linux with browser-based login and VTS design.

%install
mkdir -p %{buildroot}/usr/local/bin
mkdir -p %{buildroot}/usr/share/applications
mkdir -p %{buildroot}/usr/share/icons
install -m755 chatgpt-launcher %{buildroot}/usr/local/bin/chatgpt-launcher
install -m644 chatgpt.desktop %{buildroot}/usr/share/applications/chatgpt.desktop
install -m644 chatgpt-256.png %{buildroot}/usr/share/icons/chatgpt.png

%files
/usr/local/bin/chatgpt-launcher
/usr/share/applications/chatgpt.desktop
/usr/share/icons/chatgpt.png

%changelog
* $(date +"%a %b %d %Y") Vishwanath Tec Systems - ${CURRENT_VERSION}-1
- Automated build
EOF
  rpmbuild -ba ~/rpmbuild/SPECS/chatgpt-desktop.spec >/dev/null
  cp ~/rpmbuild/RPMS/x86_64/chatgpt-desktop-${CURRENT_VERSION}-1.x86_64.rpm "$PKG_DIR/"
  green "✅ Build complete!"
fi

# --- VERIFY FILES ---
APPIMAGE="$BUILD_DIR/$APP_NAME"
DEB=$(ls $PKG_DIR/chatgpt-desktop*.deb | head -n1)
RPM=$(ls $PKG_DIR/chatgpt-desktop*.rpm | head -n1)

for f in "$APPIMAGE" "$DEB" "$RPM"; do
  [ -f "$f" ] || { red "❌ Missing: $f"; exit 1; }
done

# --- RELEASE CREATION ---
TITLE="$TITLE_BASE v$CURRENT_VERSION"
yellow "🚀 Creating GitHub release: $TITLE"

gh release create "$TAG" \
  "$APPIMAGE" \
  "$DEB" \
  "$RPM" \
  --repo "$REPO" \
  --title "$TITLE" \
  --notes-file "$NOTES_FILE" \
  --latest

green "✅ Release $TAG published successfully!"

# --- VERSION BUMP ---
IFS='.' read -r major minor patch <<< "$CURRENT_VERSION"
patch=$((patch + 1))
NEXT_VERSION="${major}.${minor}.${patch}"
echo "$NEXT_VERSION" > "$VERSION_FILE"

green "🔼 Next version set to $NEXT_VERSION"

# --- FUTURE FEATURES (reserved hooks) ---
# 🚧 TODO: Auto-publish to AppImageHub
# 🚧 TODO: Generate AppStream XML metadata
# 🚧 TODO: Auto-trigger GitHub Pages site update
