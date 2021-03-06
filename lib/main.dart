import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projetfutter/pages/detail_page.dart';
import 'pages/list.dart';
import 'pages/login.dart';
import 'package:projetfutter/pages/home_page.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes:
      {
        "/":(context) => const HomePage(),
        "/list": (context) => const ListPage(),
        "/login": (context) => const LoginPage(),
        "/detail": (context) => const DetailPage(),
      },
    );
  }
}

