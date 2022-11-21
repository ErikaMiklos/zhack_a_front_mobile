import 'package:flutter/material.dart';
import 'package:zhack_a_front_mobile/pages/home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const HomePage()
      },
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontSize: 22, color: Colors.deepOrange)
        )
      )
    );
  }
}
