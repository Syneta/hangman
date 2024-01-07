import 'package:flutter/material.dart';

class WinScreen extends StatelessWidget {
  WinScreen({required this.onRestart, super.key});

  final void Function() onRestart;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset('assets/images/winner.png'),
          const SizedBox(height: 25),
          const Text(
            'Til Hamingju',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),
          TextButton.icon(
            onPressed: onRestart,
            icon: const Icon(Icons.restart_alt),
            label: const Text('Aftur'),
          ),
        ],
      ),
    );
  }
}
