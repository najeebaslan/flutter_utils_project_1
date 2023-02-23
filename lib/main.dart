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
      title: 'Flutter Utils Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final String _key = 'username';
  String text = 'no value';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(children: [
            Text(
              text,
              style: const TextStyle(color: Colors.red, fontSize: 22),
            ),
            10.height,
            buildTextField(),
            60.height,
            //! Set Value
            customBotton(
                onPressed: () async {
                  await FuSharedPreferences.setString(_key, _controller.text);
                },
                text: 'Set value'),
            //! Get Value
            customBotton(
                onPressed: () async {
                  String? value = await FuSharedPreferences.getString(
                    _key,
                  );
                  setState(() => text = value ?? 'no value');
                },
                text: 'Get value'),
            //! Delete Value
            customBotton(
                onPressed: () async {
                  await FuSharedPreferences.deleteString(
                    _key,
                  );
                },
                text: 'Delete value'),
          ])),
    );
  }

  Widget buildTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
          key: _formKey,
          child: TextFormField(
            controller: _controller,
            validator: (String? value) {
              return FuInputValidation.validationTextField(
                  controller: _controller,
                  error: 'Please add value',
                  lengthMin:
                      'The field must be at least three characters long.',
                  lengthMax:
                      'The field should not be more than eight letters long.',
                  main: 3,
                  max: 8);
            },
            decoration: InputDecoration(
                contentPadding: FuSpacing.all(16.0),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                labelText: "Add Value",
                labelStyle: const TextStyle(fontSize: 22)),
          )),
    );
  }

  Widget customBotton(
      {required void Function() onPressed, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF434CF4),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          )),
        ],
      ),
    );

    // FuButton.rounded(
    //     block: true,
    //     borderRadiusAll: 30,
    //     padding: const EdgeInsets.all(15),
    //     onPressed: onPressed,
    //     backgroundColor: const Color(0xFF434CF4),
    //     child: FuText.button(
    //       fontSize: 20,
    //       text,
    //       color: Colors.white,
    //     )).paddingSymmetric(horizontal: 20, vertical: 10);
  }
}
