# 🎵 Music Service Module

A clean, responsive Flutter app that allows users to browse and book music-related services like production, mixing, and vocals.

---

## 🎬 Demo Video

You can preview the app functionality in this demo:

📺 **[Watch Demo Video](https://drive.google.com/file/d/1g3kI82MAKBMKK7hQvIrrz0N1AvPCmJF9/view?usp=sharing)**

---

## 🧱 Folder Structure (MVVM + DI)

```
lib/
├── data/                    # Repository layer (e.g., Firestore access)
│   └── services_repository.dart
├── model/                   # Data classes (e.g., ServiceModel)
├── viewmodel/               # ViewModels using Provider (e.g., HomeViewModel)
├── presentation/            # All UI components
│   ├── screens/             # Home and detail screens
│   ├── components/          # Reusable UI widgets (e.g., ServiceCard, BottomNavBar)
├── di/                      # Dependency injection (GetIt setup)
├── utils/                   # Constants, helper functions
├── main.dart                # App entry point
```

We follow the **MVVM pattern** with **Provider for state management** and **GetIt for dependency injection**, ensuring scalable and testable code.

---

## ☁️ Firebase & Assets

- Firestore is used to load services dynamically (`collection: services`)
- Icons are stored locally as **SVGs** and rendered using `flutter_svg`
- Fallbacks are provided if icons are missing

Firestore Document Example:
```json
{
  "title": "Mixing & Mastering",
  "description": "Make your tracks radio-ready",
  "icon": "mix.svg"
}
```

---

## 🚀 Getting Started

1. Clone the repo:
```bash
git clone https://github.com/mantsha74/music_service_module.git
cd music_service_module
```

2. Install packages:
```bash
flutter pub get
```

3. Setup Firebase (Firestore + google-services.json)

4. Run the app:
```bash
flutter run
```

---



---

## 📦 Dependencies

- `provider`
- `get_it`
- `firebase_core`
- `cloud_firestore`
- `flutter_svg`

---

## ✨ Author

**Mantsha Khatoon**  
[GitHub](https://github.com/mantsha74)
