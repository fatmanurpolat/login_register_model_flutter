import 'package:flutter/material.dart';
import 'package:gun_11/pages/register/register_page.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../view_model/login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 220, 229),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "LOG IN PAGE",
                  style: GoogleFonts.alike(
                      textStyle: Theme.of(context).textTheme.displayMedium,
                      fontSize: 25),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: context.watch<LoginViewModel>().userNameController,
                decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    hintText: 'Enter email',
                    iconColor: Colors.purple,
                    icon: Icon(Icons.mail)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: context.watch<LoginViewModel>().passwordController,
                decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    hintText: 'Enter password',
                    iconColor: Colors.purple,
                    icon: Icon(Icons.lock)),
              ),
            ),
            SizedBox(
              height: 20,
              child: Padding(
                padding: const EdgeInsets.only(left: 230.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 172, 12, 140)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    child: const Text("Aleady has register?")),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  context.read<LoginViewModel>().login();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    foregroundColor: const Color.fromARGB(255, 233, 233, 233),
                    backgroundColor: const Color.fromARGB(255, 81, 57, 153),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.8, 50)),
                child: const Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
