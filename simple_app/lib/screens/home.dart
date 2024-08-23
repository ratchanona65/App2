import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple App"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print("TextButton process");
              },
              child: const Text(
                "Text",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20,
                ),
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.brown,
              ),
              onPressed: () {
                print("FilledButton process");
              },
              child: const Text(
                "Filled",
                style: TextStyle(
                  color: Color.fromARGB(255, 246, 245, 247),
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 8, 70, 24),
                foregroundColor: Color.fromARGB(255, 240, 238, 237),
              ),
              onPressed: () {
                print("ElevatedButton process");
              },
              child: const Text(
                "Elevated",
                style: TextStyle(
                  color: Color.fromARGB(255, 239, 238, 240),
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
