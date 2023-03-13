import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginViewModel extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  Future login() async {
    var body = {"name": nameController.text, "year": yearController.value};
    print(body);
    // ignore: unused_local_variable
    http.Response response = await http.post(
        Uri.parse("https://reqres.in/api/register"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body);
    }
  }
}
