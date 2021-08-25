import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Future<String> _loadDatos() async {
    await Future.delayed(Duration(seconds: 5));
    return await rootBundle.loadString('assets/datos.txt');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Future builder'),
        ),
        body: FutureBuilder(
          future: _loadDatos(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error : ${snapshot.error.toString()}'),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: Text(snapshot.data),
            );
          },
        ),
      ),
    );
  }
}
