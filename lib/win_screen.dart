import 'package:flutter/material.dart';

class WinScreen extends StatelessWidget {
  const WinScreen({super.key});
  //WinScreen({required this.onRestart, super.key});

  //final void Function() onRestart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Winner!'),),
      body: Column(
        children: [
          Image.asset('assets/images/winner.png'),
          const SizedBox(height: 25),
          const Text(
            'Til Hamingju!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),
          TextButton.icon(
            onPressed: (){},
            icon: const Icon(Icons.restart_alt),
            label: const Text('Aftur'),
          ),
        ],
      ),
    );
  }
}
