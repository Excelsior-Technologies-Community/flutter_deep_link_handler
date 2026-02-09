# FlutterDeepLinkHandler

A production-ready, scalable deep link handling architecture for Flutter using the modern app_links plugin.
Supports cold start, background, and foreground deep links with central routing, guards, and parameter parsing.

---

## ✨ Features
- ✅ Uses app_links (maintained & future-proof)
- ✅ Handles deep links when app is:
  * Closed (cold start)
  * In background
  * Already running
- ✅ Central route mapper (DeepLinkRoutes)
- ✅ Supports:
  - Query params → myapp://profile?id=10
  - Path params → myapp://product/99
- ✅ NavigatorKey based navigation (no context issues)
- ✅ Duplicate deep link protection
- ✅ Ready for:
  - Auth guards / middleware
  - Dynamic routes (/user/:id)
  - Conversion into a Flutter package
 
---
## ✨ Preview
![screen-20260209-1558262](https://github.com/user-attachments/assets/dbba70b9-7dde-4ed8-80c6-a1217f6b08eb)

---
## ✨ Installation
Add this to your package's pubspec.yaml file:
```
dependencies:
  flutter_deep_link_handler:
    path: ../flutter_deep_link_handler  # For local development
```
from git:
```
dependencies:
  flutter_deep_link_handler:
    git:
      url: https://github.com/yourusername/flutter_deep_link_handler.git  # Your github path
``` 
Then run:
```
flutter pub get
```
---

## 📦 Tech Stack
* Flutter (Material)
* app_links
* Navigator 1.0 with GlobalKey
* Clean, modular architecture
---

## 📁 Project Structure
```
lib/
├── main.dart
├── navigation/
│   └── app_navigator.dart
├── deeplink/
│   └── deep_link_routes.dart
├── widgets/
│   └── deep_link_handler.dart
└── screens/
    ├── home_screen.dart
    ├── profile_screen.dart
    └── product_screen.dart

```
---
## 🚀 Getting Started
#### 1️⃣ Add Dependency
In pubspec.yaml:
```
dependencies:
  flutter:
    sdk: flutter
  app_links: ^6.0.0

```
---
## 📱 Platform Setup
#### ✅ Android
Open:
```
android/app/src/main/AndroidManifest.xml

```
Inside your <activity> tag, add:
```
<intent-filter>
    <action android:name="android.intent.action.VIEW"/>
    <category android:name="android.intent.category.DEFAULT"/>
    <category android:name="android.intent.category.BROWSABLE"/>
    <data android:scheme="myapp"/>
</intent-filter>

```
Now Android will handle:
```
myapp://profile
myapp://profile?id=10
myapp://product/99

```
---
## 🧠 Architecture Overview
* 🔹 1. DeepLinkHandler (Listener Layer)
  - Listens to deep links via app_links
  - Handles:
  - Initial link (cold start)
  - Stream links (runtime)
  - Prevents duplicate navigation
  - Forwards URI to DeepLinkRoutes
    
* 🔹 2. DeepLinkRoutes (Routing Layer)
  - Acts like a router for deep links
  - Maps paths to handlers:
  - /profile
  - /product
  - Extracts:
   - Query params → ?id=10
   - Path params → /product/99
   - Calls AppNavigator for navigation
     
* 🔹 3. AppNavigator (Navigation Layer)
  - Uses GlobalKey<NavigatorState>
  - Allows navigation without BuildContext
  - Solves context timing issues in deep links
 ---
## 🧭 main.dart Setup
```
MaterialApp(
  navigatorKey: AppNavigator.key,
  debugShowCheckedModeBanner: false,
  home: const HomeScreen(),
  routes: {
    '/profile': (context) => const ProfileScreen(),
    '/product': (context) => const ProductScreen(),
  },
);

```
---
## 📜 License
MIT License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
---
