import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:umdb_app/reusable_widgets/reusable_widget.dart';
import 'package:umdb_app/home.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(0, 0, 0, 1),

                Color.fromRGBO(0, 0, 0, 1),

              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        const Text(
                          'Let\'s Start',style: TextStyle(fontFamily: 'Large',fontSize: 35),
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
                            borderRadius: BorderRadius.all(Radius.circular(15)),
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
                    reusableTextField("Enter UserName", Icons.person_outline, false,
                        _userNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Email Id", Icons.person_outline, false,
                        _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Password", Icons.lock_outlined, true,
                        _passwordTextController,),
                    const SizedBox(
                      height: 20,
                    ),
                    firebaseUIButton(context, "Sign Up", () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                          .then((value) {
                        if (kDebugMode) {
                          print("Created New Account");
                        }
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomeScreen()));
                      }).onError((error, stackTrace) {
                        String er= error.toString();
                        String oper= er.substring(er.indexOf(']')+1,er.length);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              margin: EdgeInsets.only(bottom:  0,
                                  left: MediaQuery.of(context).size.width*.08),
                              content: Text('$oper',style: TextStyle(color: Colors.red,),),
                              duration: const Duration(seconds: 3),));
                        print(error);
                        print (oper);
                      });
                    })
                  ],
                ),
              ))),
    );
  }
}