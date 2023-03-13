import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gun_11/pages/login/loginpage.dart';
import 'package:gun_11/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

import 'view_model/profile_view_model.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProfileViewModel()),
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
