import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';
import 'package:http/http.dart' as http;

import 'model/posts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get data from api',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  Future<List<Posts>> getData() async {
    try {
      const String uri = 'https://jsonplaceholder.typicode.com/photos';

      final response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        List post = jsonDecode(response.body);

        final result = post.map((json) => Posts.fromJson(json)).toList();

        return result;
      } else {
        throw Exception('Failed to load data from api');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('get data form api'),
        centerTitle: true,
      ),
      body: SnapHelperWidget(
          future: getData(),
          loadingWidget: const Center(child: Text('waiting data')),
          onSuccess: (List<Posts> onSuccess) => shaowData(onSuccess)),
      // FutureBuilder(
      //   future: getData(),
      //   builder: (context, snapshot) {
      //     //Error
      //     if (snapshot.hasError) return Text(snapshot.error.toString());
      //     //Success
      //     if (snapshot.hasData) {
      //       return shaowData(snapshot.data!);
      //     } else {
      //       //Loading
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
    );
  }
}

Widget shaowData(List<Posts> data) {
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index) {
      Posts myData = data[index];
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.primaries[index % Colors.primaries.length]
              .withOpacity(0.7),
        ),
        child: Row(children: [
          ClipOval(
            child: Image.network(
              myData.thumbnailUrl,
              height: 80,
              width: 80,
            ),
          ),
          Expanded(
            child: Text(
              myData.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),

        //
//flutter_utils_project_1
          CircleAvatar(
            radius: 15,
            child: Text(
              myData.id.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ]),
      );
    },
  );
}
