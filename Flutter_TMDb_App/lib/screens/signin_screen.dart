import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umdb_app/reusable_widgets/reusable_widget.dart';
import 'package:umdb_app/home.dart';
import 'package:umdb_app/screens/reset_password.dart';
import 'package:umdb_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 70),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(0, 0, 0, 1),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          const Text(
                            'TMDb',
                            style:
                                TextStyle(fontSize: 40, fontFamily: 'Horizon'),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 70,
                            decoration: const BoxDecoration(
                              color: Colors.purpleAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  // Color.fromARGB(255, 228, 5, 247),
                                  Color.fromRGBO(255, 0, 0, 1),
                                  Color.fromRGBO(0, 0, 255, 1),

                                  // Color.fromRGBO(92, 10, 65, 1),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                      TextField(
                        controller: _emailTextController,
                        obscureText: false,
                        enableSuggestions: true,
                        autocorrect: true,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: Colors.white70,
                          ),
                          labelText: "Enter Username",
                          labelStyle:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // reusableTextField("Enter Password", Icons.lock_outline,
                      //     true, _passwordTextController),
                      TextField(
                        controller: _passwordTextController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Colors.white70,
                          ),
                          labelText: "Enter Password",
                          labelStyle:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.white70),
                            textAlign: TextAlign.right,
                          ),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ResetPassword())),
                        ),
                      ),
                      firebaseUIButton(context, "Sign In", () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        }).onError((error, stackTrace) {
                          String er = error.toString();
                          String oper =
                              er.substring(er.indexOf(']') + 1, er.length);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.width * .5,
                              left: 0,
                            ),
                            content: Text(
                              oper,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            duration: const Duration(seconds: 3),
                          ));
                        });
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have account?",
                              style: TextStyle(color: Colors.white70)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           SignUpScreen()));
                            },
                            child: const Text(
                              " Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              alignment: Alignment.center,
              //color: Colors.blue,
              height: 40,
              child: Text(
                '© Kannan Shibu',
                style: GoogleFonts.arizonia(
                    fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
