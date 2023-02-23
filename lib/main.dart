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
      home: const ContextExtension(),
    );
  }
}

class ContextExtension extends StatelessWidget {
  const ContextExtension({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Context Extensions'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //? ============== Context Extensions ==================//

        //! 1- height - width
        Container(
          color: Colors.amberAccent,
          height: context.height / 2.1,
          width: context.width,
          // height: MediaQuery.of(context).size.height / 2.1,
          // width: MediaQuery.of(context).size.width,
        ),

        //! 2- push Navigator
        // ElevatedButton(
        //     onPressed: () =>
        //     context.push(const Page2()),
        //     //  Navigator.of(context)
        //     // .push(MaterialPageRoute(builder: (context) => const Page2())),
        //     child: const Text('Navigator')),

        //! 3- textTheme
        // Text(
        //   'text Theme',
        //   style:
        //   context.textTheme.headline6
        // // Theme.of(context).textTheme.headline6,
        // ),

        //! 4- isDarkMode
        ElevatedButton(
            onPressed: () => log(context.isDarkMode.toString()),
            child: const Text('isDarkMode')),
      ]).center(),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: Colors.brown,
        body: Center(
          child: Text(
            'Page2',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
}
