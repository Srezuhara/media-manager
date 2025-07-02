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


*Dependencies used:

1)path_provider – to access app storage

2)permission_handler – to request permissions

3)open_filex – to open PDFs using default viewer

4)dart:io – for file management

⚠️ Limitations

-Only supports PDFs

-Tested only on Android

-Relies on valid public direct PDF URLs

-iOS support not configured


