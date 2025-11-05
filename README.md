# ChatGPT Desktop — Vishwanath Tec Systems (VTS)

<p align="center">
  <img src="https://img.shields.io/github/v/release/vtsadmin/ChatGPT-Desktop-Linux-VTS?color=00ff7a&label=Latest%20Release" alt="Release Version">
  <img src="https://img.shields.io/github/downloads/vtsadmin/ChatGPT-Desktop-Linux-VTS/total?color=00a86f&label=Downloads" alt="Downloads">
  <img src="https://img.shields.io/github/license/vtsadmin/ChatGPT-Desktop-Linux-VTS?color=00c08b" alt="License">
  <img src="https://img.shields.io/badge/Platform-Linux%20x86__64-blue?logo=linux&logoColor=white" alt="Platform">
  <img src="https://img.shields.io/github/stars/vtsadmin/ChatGPT-Desktop-Linux-VTS?style=social" alt="GitHub Stars">
</p>

**ChatGPT Desktop** is a lightweight Linux desktop launcher that opens [ChatGPT](https://chat.openai.com) in a clean, native-like window using your existing browser (Chrome, Chromium, or Brave).  
It provides a **safe**, **no-API-key**, and **resource-efficient** experience — without Electron or sandboxed browsers.

---

## 🚀 Key Features

- 🖥️ Native app-like window (no tabs, no address bar)  
- 🔐 Uses your current browser session for secure login  
- ⚡ Lightweight — no Electron or extra dependencies  
- 📦 Distributed as `.deb`, `.rpm`, and AppImage for all Linux users  
- 💼 Officially built and maintained by **Vishwanath Tec Systems (VTS)**

---

## 🧭 Repository Layout

```
ChatGPT-Desktop-Linux-VTS
├── build
│   └── ChatGPT_Desktop-x86_64.AppImage
├── LICENSE
├── packaging
│   ├── chatgpt-desktop-1.0.0.deb
│   └── chatgpt-desktop-1.0-1.x86_64.rpm
├── README.md
├── release-upload.sh
└── src
    ├── appimagetool-x86_64.AppImage
    ├── chatgpt-128.png
    ├── chatgpt-256.png
    ├── chatgpt-32.png
    ├── chatgpt-512.png
    ├── chatgpt-64.png
    ├── ChatGPT.AppDir
    ├── chatgpt.desktop
    ├── chatgpt-launcher
    ├── chatgpt.png
    ├── chatgpt-vts-symbol.svg
    ├── install.sh
    └── packaging
```

---

## 🧩 Installation

### 🟢 Debian / Ubuntu (.deb)

```bash
sudo apt install ./chatgpt-desktop-deb.deb
# Then launch via: Super → "ChatGPT Desktop"
```

### 🔵 Fedora / RHEL (.rpm)

```bash
sudo dnf install ./chatgpt-desktop-1.0-1.x86_64.rpm
# Launch from Activities or Application Menu
```

### 🟣 Portable AppImage

```bash
chmod +x ChatGPT_Desktop-x86_64.AppImage
./ChatGPT_Desktop-x86_64.AppImage
```

---

## 🧱 Build Instructions (for Maintainers)

### Build `.deb`

```bash
mkdir -p chatgpt-desktop-deb/usr/{local/bin,share/icons,share/applications}

cp chatgpt-launcher chatgpt-desktop-deb/usr/local/bin/
cp chatgpt.desktop chatgpt-desktop-deb/usr/share/applications/
cp chatgpt-256.png chatgpt-desktop-deb/usr/share/icons/chatgpt.png

# Add DEBIAN/control file (see packaging/control template)
dpkg-deb --build chatgpt-desktop-deb
```

### Build `.rpm`

```bash
rpmbuild -ba packaging/chatgpt-desktop.spec
```

### Build AppImage

```bash
mkdir -p ChatGPT.AppDir/usr/{bin,share/icons}
cp chatgpt-launcher ChatGPT.AppDir/usr/bin/
cp chatgpt.desktop ChatGPT.AppDir/chatgpt.desktop
cp chatgpt-256.png ChatGPT.AppDir/usr/share/icons/chatgpt.png

appimagetool ChatGPT.AppDir
```

---

## 🎨 Branding & Design

**Icon:** `chatgpt-vts-symbol.svg`  
**Gradient:** `#00FF7A → #00A86F` (Electric Green)  
**Style:** Minimal, flat, and adaptive for GNOME / KDE / XFCE  
**Maintainer:** Vishwanath Tec Systems  

🪄 *Designed to feel native — built entirely with GTK WebKit2 and Python 3 (no Electron).*

---

## 📦 Downloads

| Format          | Description                                | File                                                                                                        |
| ---------------- | ------------------------------------------ | ----------------------------------------------------------------------------------------------------------- |
| 💿 **AppImage** | Portable, works on all Linux distributions | [ChatGPT_Desktop-x86_64.AppImage](https://github.com/vtsadmin/ChatGPT-Desktop-Linux-VTS/releases/latest)  |
| 🟢 **.deb**     | For Debian, Ubuntu, Linux Mint             | [chatgpt-desktop-deb.deb](https://github.com/vtsadmin/ChatGPT-Desktop-Linux-VTS/releases/latest)          |
| 🔵 **.rpm**     | For Fedora, CentOS, RHEL                   | [chatgpt-desktop-1.0-1.x86_64.rpm](https://github.com/vtsadmin/ChatGPT-Desktop-Linux-VTS/releases/latest) |

---

## 🧠 Tech Stack

- **Language:** Python 3 (GTK+3 / WebKit2)  
- **Packaging:** dpkg, rpmbuild, AppImageKit  
- **Build System:** Custom VTS Linux Release Script (`release-upload.sh`)  
- **Compatibility:** Ubuntu 20.04+, Fedora 36+, Debian 11+, RHEL 8+

---

## 📜 License (MIT)

```
Copyright (c) 2025 Vishwanath Tec Systems

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the “Software”), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND.
```

---

## 🔖 About Vishwanath Tec Systems

**Vishwanath Tec Systems (VTS)** creates open-source software and Linux automation tools built for privacy, simplicity, and performance.  
Explore more projects at [https://shrtx.in](https://shrtx.in).

---

## ⭐ Don’t forget to Star this repo!

If you find **ChatGPT Desktop** helpful, give it a ⭐ on GitHub —  
it helps more Linux users discover a clean, native ChatGPT experience! 💚


---

## 🧰 Support & Feedback

Found a bug or have an idea?  
→ [Open an issue](https://github.com/vtsadmin/ChatGPT-Desktop-Linux-VTS/issues)

Please include:
- OS & desktop environment
- Browser used (Chrome / Chromium / Brave)  
- Steps to reproduce

---

## 🌐 Project Links

- 🌍 **Official Site:** [https://shrtx.in](https://shrtx.in)  
- 🧑‍💻 **Author:** [Vishwanath Tec Systems](https://github.com/vtsadmin)  
- 📬 **Contact:** [support@shrtx.in](mailto:support@shrtx.in)  
- 🔖 **Latest Release:** [View on GitHub →](https://github.com/vtsadmin/ChatGPT-Desktop-Linux-VTS/releases/latest)

---

## 🧭 SEO Keywords

`ChatGPT Desktop for Linux`, `ChatGPT AppImage`, `ChatGPT Ubuntu`, `ChatGPT RPM`,  
`ChatGPT Launcher`, `Vishwanath Tec Systems`, `VTS ChatGPT App`,  
`Lightweight ChatGPT Client`, `ChatGPT without API key`, `Linux ChatGPT Desktop App`

---

## 🪄 Summary

**ChatGPT Desktop (VTS)** — a fast, native-feeling ChatGPT client for Linux that respects privacy, saves resources, and looks right at home on your desktop.
