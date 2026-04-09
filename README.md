# The Kinetic Gallery 

A modern, high-fidelity dating and social discovery application built with **Flutter**. The app features a sleek UI/UX, smooth navigation transitions, and a robust "Explore" ecosystem.

## 🚀 Overview

The Kinetic Gallery is designed to redefine digital connections through a "gallery" style experience. Users can swipe through profiles, explore trending vibes (interests), and engage in real-time conversations with matches.

## ✨ Key Features

* **Smart Discovery:** A gesture-based swiping interface with detailed user cards and interest chips.
* **Explore Hub:** A categorized discovery system (Coffee Date, Gamers, Sporty, etc.) to find people with specific shared interests.
* **Trending Vibes:** An interactive "Vibe" selector that filters the community based on current trends.
* **Unified Messaging:** A clean chat interface including "New Matches" reels and individual conversation views.
* **Premium Profiles:** Profile management with "Tinder Gold" integration UI, match percentage indicators, and media management.
* **Dynamic Settings:** Full control over discovery preferences including distance sliders, age ranges, and account security.

## 🛠️ Tech Stack

* **Framework:** [Flutter](https://flutter.dev)
* **Language:** Dart
* **Navigation:** Named Routing with `pushReplacement` for optimized memory management.
* **UI Components:** * SliverAppBars (Expanding headers)
    * Modal Bottom Sheets
    * Custom ClipRRect and BoxDecorations
    * Linear Gradients for high-end aesthetics



## 🏗️ Project Structure

```text
lib/
├── main.dart                 # App entry point & Routing
└── screens/
    ├── login_screen.dart     # Authentication UI
    ├── discover_screen.dart  # Main swiping interface
    ├── explore_screen.dart   # Interactive interest hub
    ├── chat_list_screen.dart # Messaging overview
    ├── chat_view_screen.dart # Individual chat UI
    ├── profile_screen.dart   # User profile & stats
    └── settings_screen.dart  # App preferences
```

## ⚙️ Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/kinetic-gallery.git
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run the application:**
    ```bash
    flutter run
    ```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
