import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var body = Container(
        width: 360,
        height: 200,
        color: const Color(0xFF8157D5),
        // decoration: const BoxDecoration(color: Color(0xFF8157D5)),
        padding: const EdgeInsets.only(top: 20),
        // constraints: BoxConstraints.tight(const Size(360, 300)),
        child: const Text('HomeScreen')
    );
    return Scaffold(
        body: body
    );
  }


}