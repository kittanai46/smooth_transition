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
      title: 'Smooth Transition Example',
      theme: ThemeData(primarySwatch: Colors.blue),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const SecondPage(),
                    type: PageTransitionType.fade,
                  ),
                );
              },
              child: const Text("Fade Transition"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const SecondPage(),
                    type: PageTransitionType.scale,
                  ),
                );
              },
              child: const Text("Scale Transition"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const SecondPage(),
                    type: PageTransitionType.slideLeft,
                  ),
                );
              },
              child: const Text("Slide Left Transition"),
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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Go Back"),
        ),
      ),
    );
  }
}
