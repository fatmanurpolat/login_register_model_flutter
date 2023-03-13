/*
import 'package:flutter/material.dart';
import 'package:gun_11/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  User? get user => context.watch<ProfileViewModel>().user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 178, 197),
      body: Center(
        child: ListView(children: [
          Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            color: const Color.fromARGB(255, 243, 204, 202),
            child: Image.network(
              user!.avatar,
              width: 100,
              height: 300,
              scale: 0.8,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.near_me),
            title: Text(
              user!.firstName,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.near_me_disabled),
            title: Text(
              user!.lastName,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.upcoming),
            title: Text(
              context.watch<ProfileViewModel>().user!.email,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ]),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../../view_model/profile_view_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? get user => context.watch<ProfileViewModel>().user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Profile Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   width: 100,
              //   height: 100,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(image: NetworkImage(user!.avatar!)),
              //     shape: BoxShape.circle
              //   ),),
              ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(user!.avatar!)),
              Text(user!.firstName!),
              Text(user!.lastName!),
              Text(user!.email!),
            ],
          ),
        ),
      ),
    );
  }
}
