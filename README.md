# 🎯 Flutter Vertical Carousel Assignment

A smooth, high-performance **vertical carousel** built using **Flutter** (no third-party UI packages), showcasing cards with dynamic backgrounds (solid colors, images, or videos)  that adapt per card. Includes entry animations for text and smooth video handling to ensure optimal FPS.

---

## 📦 Tech Stack

- **Flutter**
- **Dart**
- Official Flutter plugin: [`video_player`](https://pub.dev/packages/video_player)
- No third-party UI or animation libraries used.

---

## 🚀 Setup Instructions

1. Clone the repository:
   git clone https://github.com/yourusername/flutter-carousel-assignment.git
   cd flutter-carousel-assignment

2. Install dependencies:
   flutter pub get

3. Platform-specific setup:

   For iOS:
   - Open ios/Runner/Info.plist and add:
     <key>NSAppTransportSecurity</key>
     <dict>
         <key>NSAllowsArbitraryLoads</key>
         <true/>
     </dict>

   For Android:
   - No special setup needed.

4. Run the app:
   flutter run


🎨 Features Implemented
    ✅ Vertical PageView carousel with smooth scroll

    ✅ Cards support:

    🎥 Video backgrounds

    🖼️ Image backgrounds

    🎨 Solid color backgrounds

    ✅ CTAs (Call To Action buttons) that change theme per card

    ✅ Entry animations for title & subtitle on first view

    ✅ Video performance optimization:

    Lazy loading

    Auto-play only when visible

    Pause off-screen videos

    ✅ Modular and maintainable folder structure

    ✅ Responsive design across screen sizes


⚙️ Folder Structure

lib/
│
├── main.dart
├── models/
│   └── card_data.dart
├── widgets/
│   ├── carousel_card.dart
│   └── cta_button.dart
├── data/
│   └── mock_cards.dart
└── utils/
    └── theme_utils.dart

⚠️ Trade-offs & Challenges

* VideoPlayer plugin was used as it's officially supported by Flutter. All UI and animation logic avoids third-party libraries.

* Performance: Videos are heavy; handled lazy loading and rendering based on visibility to maintain smooth 60FPS scrolling.

* CTA Themes: Kept flexible by passing a theme object to each card; could be extended further using a state management solution like  Provider or Riverpod.

* Animations: Focused on simple, performant entry animations; avoided complex transitions to retain performance.

📸 Screenshots