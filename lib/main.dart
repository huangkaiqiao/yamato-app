// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:nicole/route.dart';
import 'package:nicole/screen/home.dart';
import 'package:nicole/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nicole',
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Startup Name Generator'),
      //   ),
      //   body: const Center(
      //     child: RandomWords()
      //   ),
      // ),
      // home: const (),
      initialRoute: '/',
      routes: {
        // '/': (context) => const HomeScreen(),
        '/': (context) => const ScaffoldRoute(),
        '/login': (context) => LoginScreen()
      }
    );
  }
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          print('itemBuilder: $i');
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          // return Text(_suggestions[index].asPascalCase);
          return ListTile(
              title: Text(
                  _suggestions[index].asPascalCase,
                  style: _biggerFont
              )
          );
        }
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}
