## smooth_transition
A simple and customizable Flutter package for smooth page transition animations.Supports fade, slide,
and scale effects with minimal setup.

## Features
- 🚀 Easy to use with Navigator.push()
- 🎬 Built-in animations: Fade, Slide, Scale
- ⚡ Lightweight & customizable
- 🔧 Adjustable animation duration & curve

## Installation
Add dependency in your pubspec.yaml:

```dart
flutter:
    sdk: flutter
dependencies:
  smooth_transition: ^1.0.3
```
```dart
Then run:
flutter pub get
```

## 🚀 Usage

```dart
import 'package:smooth_transition/smooth_transition.dart';
```

## Example

```dart
Navigator.push(
  context,
  EasyPageTransition(
    page: const SecondPage(),
    type: PageTransitionType.slide,
    duration: const Duration(milliseconds: 400),
  ),
);
```

## Transition Types
A Flutter package for easy page transition animations.  
Supports multiple transition types:  
- fade  
- scale  
- rotate  
- slideLeft  
- slideRight  
- slideUp  
- slideDown

## 🛠️ Example App 
```dart
import 'package:flutter/material.dart';
import 'package:smooth_transition/smooth_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Page")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Second Page"),
          onPressed: () {
            Navigator.push(
              context,
              EasyPageTransition(
                page: const SecondPage(),
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 500),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
      body: const Center(
        child: Text("Hello from the second page!"),
      ),
    );
  }
}
```
 
## 📌 Roadmap
Add more transition types (flip, rotate, etc.)
Support for page pop transitions
Advanced customization options

## 🤝 Contributing
Contributions are welcome!
Please open an issue or submit a pull request.

## 📄 License
This project is licensed under the MIT License.

