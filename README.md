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
  smooth_transition: ^1.0.6
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
  PageTransition(
    child: const SecondPage(),
    type: PageTransitionType.scaleFade,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeOutBack,
  ),
);

```

## 🎨 Transition Types
A Flutter package for easy page transition animations.
Supports multiple transition types:

fade – Fades the page in/out.
scale – Scales the page in/out.
rotate – Rotates the page during transition.
slideLeft – Slides the page from right to left.
slideRight – Slides the page from left to right.
slideUp – Slides the page from bottom to top.
slideDown – Slides the page from top to bottom.

## ✨ New Transitions (v1.0.4)
scaleFade – Combines scaling and fading for a pop-in effect.
rotateScale – Rotates and scales the page simultaneously.
slideLeftFade – Slides the page from right to left with fade.
elasticScale – Bouncy scale animation with spring effect.
flip – 3D card flip animation for page transitions.

## 🆕 Added in v1.0.6
zoomRotate – Rotates while zooming in/out (smooth cinematic effect).
blurFade – Fades in with a blurred background for a modern look.
slideZoom – Slides in while zooming (great for card/detail transitions).
fadeThrough – Material 3 style fade-through transition.
curve parameter – Customize the animation curve for any transition.

## 🛠️ Full Example App
```dart
import 'package:flutter/material.dart';
import 'package:smooth_transition/smooth_transition.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  PageTransitionType _selectedType = PageTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Smooth Transition Demo")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Select Transition Type:"),
            const SizedBox(height: 8),
            DropdownButton<PageTransitionType>(
              value: _selectedType,
              isExpanded: true,
              onChanged: (v) => setState(() => _selectedType = v!),
              items: PageTransitionType.values.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e.toString().split('.').last),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const SecondPage(),
                    type: _selectedType,
                    duration: const Duration(milliseconds: 450),
                  ),
                );
              },
              child: const Text("Go to Second Page"),
            ),
          ],
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
        child: Text("Hello from the second page 👋", style: TextStyle(fontSize: 22)),
      ),
    );
  }
}

```

## 📌 Roadmap
Add reverse transitions for Navigator.pop()
Add shared-axis and container transform styles
Provide animation preview widgets for playground demos

## 🤝 Contributing
Contributions are welcome!
Please open an issue or submit a pull request.

## 📄 License
This project is licensed under the MIT License.

