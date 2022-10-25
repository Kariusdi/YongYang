import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yongyang/home.dart';
import 'package:yongyang/main.dart';
import 'package:yongyang/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scafflodkey = GlobalKey<ScaffoldState>();

  bool statusRedEye = true;

  // void initState() {
  //   super.initState();
  //   checkAuth(context);
  // }

  Future checkAuth(BuildContext context) async {
    var user = _auth.currentUser;
    if (user != null) {
      print(user.displayName);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Homepage(user: user,)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scafflodkey,
        backgroundColor: Colors.white,
        body: SafeArea(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Login",
                    style: TextStyle(
                        color: Color(0xff7c9982),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
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
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "email"),
                                validator: (user_name) {
                                  if (user_name == null) {
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
                                obscureText: statusRedEye,
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: statusRedEye
                                        ? Icon(Icons.remove_red_eye_sharp)
                                        : Icon(Icons.remove_red_eye_outlined),
                                    onPressed: () {
                                      setState(() {
                                        statusRedEye = !statusRedEye;
                                      });
                                    },
                                  ),
                                  hintText: "password",
                                  border: InputBorder.none,
                                ),
                                validator: (password) {
                                  if (password == null) {
                                    return "Enter Password";
                                  }
                                  return null;
                                }),
                          ))),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        child: const Text(
                          "Don't have account?",
                          style: TextStyle(
                              color: Color(0xff7c9982),
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
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
                            loginUseingEmailPassword();
                          },
                          child: const Text(
                            "sign in",
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

  void loginUseingEmailPassword() async {
    _auth
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((value) {
      print("Login");
      checkAuth(context);
    }).onError((error, stackTrace) {
      print("Error ${error.toString()}");
    });
  }
}
