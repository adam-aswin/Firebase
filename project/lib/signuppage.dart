import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _cpassword = TextEditingController();
  bool obs = true;

  Future create() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text.trim(), password: _password.text.trim());
    Navigator.pushNamedAndRemoveUntil(context, "/main", (route) => false);
  }

  void passcheck() {
    if (_password.text == _cpassword.text) {
      create();
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(255, 238, 238, 238),
              content: Text(
                "Password doesn't match",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "./images/5026563.jpg",
            ),
            Expanded(
              child: Container(
                // height: 500,
                padding: EdgeInsets.only(left: 75, right: 75),
                child: Expanded(
                  child: ListView(
                    children: [
                      Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      // Container(
                      //   // padding: EdgeInsets.only(bottom: 13),
                      //   width: MediaQuery.of(context).size.width * .6,
                      //   height: 45,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(15),
                      //     color: Colors.white,
                      //   ),
                      //   child: TextField(
                      //     cursorColor: Colors.black,
                      //     keyboardType: TextInputType.name,
                      //     decoration: InputDecoration(
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide.none,
                      //       ),
                      //       hintText: "Username",
                      //       hintStyle: TextStyle(
                      //         color: Colors.black54,
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide.none,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      Container(
                        // padding: EdgeInsets.only(bottom: 13),
                        width: MediaQuery.of(context).size.width * .6,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: _email,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Container(
                      //   // padding: EdgeInsets.only(bottom: 13),
                      //   width: MediaQuery.of(context).size.width * .6,
                      //   height: 45,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(15),
                      //     color: Colors.white,
                      //   ),
                      //   child: TextField(
                      //     cursorColor: Colors.black,
                      //     keyboardType: TextInputType.number,
                      //     decoration: InputDecoration(
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide.none,
                      //       ),
                      //       hintText: "Phone",
                      //       hintStyle: TextStyle(
                      //         color: Colors.black54,
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide.none,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        // padding: EdgeInsets.only(bottom: 13),
                        width: MediaQuery.of(context).size.width * .6,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: _password,
                          cursorColor: Colors.black,
                          obscureText: obs,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obs = !obs;
                                });
                              },
                              icon: Icon(
                                obs
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined,
                                size: 23,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        // padding: EdgeInsets.only(bottom: 13),
                        width: MediaQuery.of(context).size.width * .6,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: _cpassword,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Confirm password",
                            hintStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: passcheck,
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
