Flutter Media Manager App

A Flutter app that allows users to download, view and delete PDF files — all stored locally on the device.

---

## 🚀 Getting Started

### ✅ Prerequisites
- Flutter SDK installed
- VS Code or Android Studio
- Android emulator or real device

🛠 Setup Instructions

1. Clone the repo or extract the `.zip` file:
   ```bash
   https://github.com/Srezuhara/media-manager.git

2. Install dependencies:
flutter pub get
3.Run the app:
flutter run
If you're on Windows, make sure Developer Mode is enabled (run: start ms-settings:developers)


🔑 Key Features
✅ Download PDF files from a given URL

✅ Store files locally using path_provider

✅ List all downloaded PDFs with name, size, and timestamp

✅ Open files with native PDF viewer using open_filex

✅ Multi-select & delete selected files

✅ Real-time UI updates after each operation

🧱 Tech Stack
Flutter + Dart

path_provider – to access app storage

permission_handler – to request permissions

open_filex – to open PDFs using default viewer

dart:io – for file management
