import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Extensions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StringEx(),
    );
  }
}

class StringEx extends StatelessWidget {
  const StringEx({super.key});
  static String? text;

  static String email = 'najeebaslan@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('String Extension'),
      ),
      backgroundColor: const Color(0xFFF5F6FA),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //? ==============String Extension==================//

          //! 1- validateEmail
          ElevatedButton(
              onPressed: () {
                if (email.validateEmail()) {
                  snackBar(' email is valid', context);
                } else {
                  snackBar(' email is not valid', context);
                }
              },
              child: const Text('validateEmail')),

          //! 2- validate
          Text(
            text.validate(),
            style: _style,
          ),

          //! 3- isImage  - isAudio - isTxt  -isApk
          ElevatedButton(
              onPressed: () {
                if ('image.jpg'.isImage) {
                  snackBar(' isImage is valid', context);
                } else {
                  snackBar(' isImage is not valid', context);
                }
              },
              child: const Text('isImage')),

          //! 4- capitalizeFirstLetter
          Text(
            'capitalize First Letter'.capitalizeFirstLetter(),
            style: _style,
          ),

          //! 5-  replaceFarsiNumber
          Text(
            ''.replaceFarsiNumber('12345678'),
            style: _style,
          ),

          //! 6- formatNumberWithComma
          Text(
            '1234567891101112'.formatNumberWithComma(),
            style: _style,
          ),

          //! 7- removeAllWhiteSpace
          Text(
            'remove All White Space'.removeAllWhiteSpace(),
            style: _style,
          ),

          //! 8- countWords
          Text(
            'Count Words is ${'count Words '.countWords()}',
            style: _style,
          ),
        ]),
      ),
    );
  }

  final TextStyle _style = const TextStyle(fontSize: 22, height: 1.5);
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(
      String message, BuildContext context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
