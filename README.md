# Staggered Drawer Animation in Flutter

## Overview
This Flutter project demonstrates a beautifully animated staggered drawer menu. The menu items slide in sequentially with smooth transitions when the menu button is pressed. The animation is controlled using Flutter's `AnimationController`, `Tween`, and `SlideTransition` widgets.

## Features
- Staggered slide-in animation for menu items
- Animated rotation of the menu icon (hamburger to close)
- Gradient background for an elegant UI
- Responsive design that adapts to different screen sizes

## Screenshots
(Add screenshots or GIFs showcasing the animation here)

## Installation
1. Clone this repository:
   ```sh
   git clone https://github.com/yourusername/flutter-staggered-drawer.git
   ```
2. Navigate to the project directory:
   ```sh
   cd flutter-staggered-drawer
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## How It Works
- The `AnimationController` handles the entire animation lifecycle.
- The menu icon rotates using a `Tween<double>` animation.
- Each menu item slides in using `SlideTransition` with an offset animation.
- The animation sequence is managed using `CurvedAnimation` and `Interval` to create a staggered effect.

## Dependencies
This project uses Flutter's built-in material package and does not require any third-party dependencies.

## Customization
You can customize the animation duration, easing curves, menu items, and UI elements to match your application's theme.

## Author
Saim (saimriaz8)

## Video
https://github.com/user-attachments/assets/f3a359d5-55a5-4c7f-992e-cdd916a55262
