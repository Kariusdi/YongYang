import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yongyang/login.dart';
import 'package:yongyang/register.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Register",
                    style: TextStyle(
                        color: Color(0xff7c9982),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      "Username",
                      style: TextStyle(
                          color: Color(0xff7c9982),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff7c9982),
                              borderRadius: BorderRadius.circular(20),
                              ),
                          child: ListTile(
                            title: TextFormField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                validator: (user_name) {
                                  if (user_name == null) {
                                    return "Enter Username";
                                  }
                                  return null;
                                }),
                          ))),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      "Email",
                      style: TextStyle(
                          color: Color(0xff7c9982),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff7c9982),
                              borderRadius: BorderRadius.circular(20),
                              ),
                          child: ListTile(
                            title: TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                validator: (email) {
                                  if (email == null) {
                                    return "Enter Email";
                                  }
                                  return null;
                                }),
                          ))),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      "Password",
                      style: TextStyle(
                          color: Color(0xff7c9982),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff7c9982),
                              borderRadius: BorderRadius.circular(20),
                              ),
                          child: ListTile(
                            title: TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                validator: (password) {
                                  if (password == null) {
                                    return "Enter Password";
                                  }
                                  if (password.length < 8) {
                                    return "weak-password";
                                  }
                                  return null;
                                }),
                          ))),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                      width: double.infinity,
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(300, 45),
                            primary: Color(0xff7c9982),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // <-- Radius
                            ),
                          ),
                          onPressed: () async {
                            singup();
                          },
                          child: const Text(
                            "sign up",
                            style: TextStyle(
                                color: Color(0xfff9f8f6),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ));
  }

  void singup() async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);
    User? user = result.user;
    if (user != null) {
      //add display name for just created user
      user.updateDisplayName(_usernameController.text);
      //get updated user
      await user.reload();
      user = await _auth.currentUser;
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
