# ChatGPT Desktop — Vishwanath Tec Systems

**ChatGPT Desktop** is a lightweight Linux desktop launcher that opens ChatGPT in a clean, native-like window using the user’s installed browser (Chrome, Chromium, or Brave).  
It provides a **safe, no-API-key**, and **resource-light** experience without relying on Electron or extra dependencies.

---

## 🚀 Features

- Native app-like window (no tabs, no address bar).  
- Uses your existing browser session for secure authentication.  
- Low memory overhead — no Electron or sandboxed browser copies.  
- Provides `.deb`, `.rpm`, and AppImage builds for easy installation.  
- Branded and maintained by **Vishwanath Tec Systems (VTS)**.

---

## 📁 Repository Structure

```
chatgpt-desktop/
├─ chatgpt-launcher           # Main launcher script
├─ chatgpt.desktop            # Desktop entry for GNOME/KDE
├─ chatgpt.png                # 256x256 app icon
├─ chatgpt-vts-symbol.svg     # Master SVG icon (branding)
├─ install.sh                 # Installer script
└─ packaging/
   ├─ chatgpt-desktop-deb.deb
   ├─ chatgpt-desktop.rpm     # or .spec for rpmbuild
   └─ ChatGPT-Desktop.AppImage
```

---

## 🧩 Installation

### Debian / Ubuntu (.deb)

```bash
sudo apt install ./chatgpt-desktop-deb.deb
# Then launch: Press Super → "ChatGPT Desktop"
```

### Fedora / RHEL (.rpm)

```bash
sudo dnf install ./chatgpt-desktop.rpm
# Launch from Activities or Application Menu
```

### Portable AppImage

```bash
chmod +x ChatGPT-Desktop.AppImage
./ChatGPT-Desktop.AppImage
```

---

## 🧱 Build Instructions (for Maintainers)

### Build `.deb`

```bash
# From repo root
mkdir -p chatgpt-desktop-deb/usr/local/bin \
         chatgpt-desktop-deb/usr/share/icons \
         chatgpt-desktop-deb/usr/share/applications

cp chatgpt-launcher chatgpt-desktop-deb/usr/local/bin/
cp chatgpt.desktop chatgpt-desktop-deb/usr/share/applications/
cp chatgpt-256.png chatgpt-desktop-deb/usr/share/icons/chatgpt.png

# Add DEBIAN/control (see packaging/control template)
dpkg-deb --build chatgpt-desktop-deb
```

### Build `.rpm`

Use the included spec file:

```bash
rpmbuild -ba packaging/chatgpt-desktop.spec
```

### Build AppImage (recommended)

```bash
# Create AppDir structure
mkdir -p ChatGPT.AppDir/usr/bin ChatGPT.AppDir/usr/share/icons
cp chatgpt-launcher ChatGPT.AppDir/usr/bin/
cp chatgpt.desktop ChatGPT.AppDir/chatgpt.desktop
cp chatgpt-256.png ChatGPT.AppDir/usr/share/icons/chatgpt.png

# Build AppImage
appimagetool ChatGPT.AppDir
```

---

## 🎨 Branding

**Icon:** ChatGPT VTS Symbol  
**Gradient:** Electric-green `#00FF7A → #00A86F`, transparent background  
Optimized for **GNOME**, **KDE**, and **XFCE** environments.  
Vector master: `chatgpt-vts-symbol.svg`

---

## 📜 License (MIT)

```
Copyright (c) 2025 Vishwanath Tec Systems

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the “Software”), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND.
```

---

## 🛠️ Support

For bugs, issues, or feature requests:  
→ Open an issue on the project’s GitHub repository.

Please include:
- OS and desktop environment  
- Browser used (Chrome / Chromium / Brave)  
- Steps to reproduce

---

## 🌐 Links

**Website:** [https://avtechguides.com](https://avtechguides.com)  
**Author:** Vishwanath Tec Systems  
**Contact:** [support@avtechguides.com](mailto:support@avtechguides.com)  
**Version:** 1.0
