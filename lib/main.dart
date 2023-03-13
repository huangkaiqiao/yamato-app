// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'dart:developer' as developer;

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/yamato_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:yamato/route.dart';
import 'package:yamato/screen/login.dart';
import 'package:provider/provider.dart';

import 'common/models.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<Profile>(
            create: (final BuildContext context) {
              return Profile();
            },
        )
      ],
      child: const MyApp(),
  ),);
  // if (Platform.isAndroid) {
  //   SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent, //设置为透明
  //   );
  //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Profile>(
      builder: (final BuildContext context, final Profile profile, final Widget? child) {
        developer.log('builder: $profile');
        return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child:  MaterialApp(
                title: 'Yamato',
                initialRoute: '/',
                routes: {
                  // '/': (context) => const HomeScreen(),
                  '/': (context) => profile.isAuthenticated ? const ScaffoldRoute(restorationId: 'scaffold_route_bottom_navigation'): LoginScreen(),
                  // '/login': (context) => LoginScreen()
                },
                localizationsDelegates: const [
                  ...YamatoLocalizations.localizationsDelegates,
                  LocaleNamesLocalizationsDelegate()
                ],
                supportedLocales: YamatoLocalizations.supportedLocales,
                locale: const Locale('zh', 'CN'),
                localeResolutionCallback: (Locale? locales, supportedLocales) {
                  // deviceLocale = locales?.first;
                  // print(locales);
                  return basicLocaleListResolution([locales!], supportedLocales);
                },
            )
        );
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
