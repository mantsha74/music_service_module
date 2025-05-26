#  Music Service Module

A clean, responsive Flutter app that allows users to browse and book music-related services like production, mixing, and vocals.

---

##  Demo Video

You can preview the app functionality in this demo:

 **[Watch Demo Video](https://drive.google.com/file/d/1g3kI82MAKBMKK7hQvIrrz0N1AvPCmJF9/view?usp=sharing)**

---

##  Folder Structure (MVVM + DI)


```
lib/
├── core/
│   ├── di/                      # Dependency injection setup (GetIt)
│   └── theme/                   # Material and text theme
├── data/
│   └── repository/              # Firestore repository
├── model/                       # Data models (e.g., ServiceModel)
├── presentation/
│   ├── navigation/              # Bottom navigation bar
│   ├── screens/
│   │   ├── home/                # Home screen + ViewModel
│   │   └── service_detail/      # Detail screen after tapping a service
│   └── widgets/                 # Reusable components like ServiceCard
├── utils/                       # Firebase options, constants
├── main.dart                    # App entry point
```


We follow the **MVVM pattern** with **Provider for state management** and **GetIt for dependency injection**, ensuring scalable and testable code.

---

##  Firebase & Assets

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

##  Getting Started

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

##  Dependencies

- `provider`
- `get_it`
- `firebase_core`
- `cloud_firestore`
- `flutter_svg`

---

##  Author

**Mantsha Khatoon**  
[GitHub](https://github.com/mantsha74)
