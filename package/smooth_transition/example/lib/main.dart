import 'package:flutter/material.dart';
import 'package:smooth_transition/smooth_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smooth Transition Demo',
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
  final _transitionList = PageTransitionType.values;
  final TextEditingController _durationController =
      TextEditingController(text: '450');

  void _goToSecondPage() {
    final durationMs = int.tryParse(_durationController.text) ?? 450;

    Navigator.push(
      context,
      PageTransition(
        child: const SecondPage(),
        type: _selectedType,
        duration: Duration(milliseconds: durationMs),
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smooth Transition Demo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Select Transition Type",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Dropdown for choosing transition type
            DropdownButton<PageTransitionType>(
              value: _selectedType,
              isExpanded: true,
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedType = value);
                }
              },
              items: _transitionList.map((type) {
                return DropdownMenuItem<PageTransitionType>(
                  value: type,
                  child: Text(type.toString().split('.').last),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Duration input
            TextField(
              controller: _durationController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Duration (milliseconds)',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            // Button to go to second page
            ElevatedButton(
              onPressed: _goToSecondPage,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              ),
              child: const Text(
                "Go to Second Page",
                style: TextStyle(fontSize: 16),
              ),
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
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Hello from the Second Page 👋",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
