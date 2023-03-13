import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../../view_model/profile_view_model.dart';
import '../profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => context.read<ProfileViewModel>().getUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: const [
                  Text(
                    "Users",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          )),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Users"),
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<ProfileViewModel>().users.length,
                itemBuilder: (context, index) {
                  User user = context.watch<ProfileViewModel>().users[index];
                  return GestureDetector(
                      onTap: () async {
                        await context
                            .read<ProfileViewModel>()
                            .getUserHttp(user.id!);
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(user.avatar!))),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(user.firstName! + " " + user.lastName!),
                          ],
                        ),
                      ));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1;
                    i <= context.read<ProfileViewModel>().totalPage;
                    i++)
                  context.watch<ProfileViewModel>().page == i
                      ? Text(i.toString())
                      : TextButton(
                          onPressed: () {
                            context.read<ProfileViewModel>().setPage(i);
                          },
                          child: Text(
                            i.toString(),
                          ),
                        )
              ],
            )
          ],
        ),
      ),
    );
  }
}
