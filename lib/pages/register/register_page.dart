import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../view_model/login_view_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 220, 229),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "REGISTER PAGE",
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
            Padding(
              padding: const EdgeInsets.only(left: 300.0),
              child: SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 155, 9, 181)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.backspace),
                ),
              ),
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
                    foregroundColor: Color.fromARGB(255, 233, 233, 233),
                    backgroundColor: Color.fromARGB(255, 81, 57, 153),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.8, 50)),
                child: const Text("Register"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
