import 'package:flutter/material.dart';

class WinScreen extends StatelessWidget {
  const WinScreen({required this.onPop, super.key});

  final VoidCallback onPop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Winner!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/winner.png',
              width: 100,
            ),
            const SizedBox(height: 25),
            const Text(
              'Til Hamingju!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            TextButton.icon(
              onPressed: () {
                onPop();
              },
              icon: const Icon(Icons.restart_alt),
              label: const Text('Aftur'),
            ),
          ],
        ),
      ),
    );
  }
}
