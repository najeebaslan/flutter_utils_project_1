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
      home: const WidgetEx(),
    );
  }
}

class WidgetEx extends StatelessWidget {
  const WidgetEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Widget Extension'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //? ============== Widget Extension ==================//

          //! 1- onTap
          const Card(
            color: Colors.blue,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('test onTap widget'),
            ),
          ).onTap(() {
            log('user pressed');
          }),

          //! 2- center
          const Text(
            'test center widget',
            style: TextStyle(fontSize: 22),
          ).center(),

          //! 3- expand
          Container(
                  color: Colors.red,
                  height: 200,
                  width: 500,
                  child: const FlutterLogo())
              .expand(),

          //! 4-  paddingAll -paddingOny paddingleft -paddingRight -paddingTop -paddingBottm
          ElevatedButton(
            child: const Text('test Padding widget'),
            onPressed: () {},
          )
          .paddingTop(50),

          //! 5- SizedBox height - width
          ElevatedButton(
            child: const Text('test sizedBox widget'),
            onPressed: () {},
          ).withHeight(200),

          // //! 6- visible
          ElevatedButton(
            child: const Text('test visible widget'),
            onPressed: () {},
          ).visible(  true, ).center()
        ]));
  }
}
