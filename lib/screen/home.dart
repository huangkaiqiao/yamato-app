import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  // Navigate to the second screen when tapped
                },
                child: const Text('Launch screen')
            )
        )
    );
  }
}