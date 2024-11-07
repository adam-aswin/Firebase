import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool obs = true;

  Future logIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text.trim(), password: _password.text.trim());
  }

  Future signInWithGoogle() async {
    try {
      final firebaseauth = await FirebaseAuth.instance;
      final googleservices = await GoogleSignIn();
      final googleuser = await googleservices.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleuser?.authentication;
      final cred = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      final user = await firebaseauth.signInWithCredential(cred);
      print("helooooooo");
      print(googleuser);
    } catch (e) {
      print(e);
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
        child: ListView(
          padding: EdgeInsets.all(0),
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "./images/5134336.jpg",
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 45,
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
                          controller: _email,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
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
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
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
                          height: 5,
                        ),
                        Text("Forgot password?"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.fromLTRB(100, 0, 100, 0)),
                    onPressed: logIn,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  IconButton(
                    onPressed: signInWithGoogle,
                    icon: Image.asset(
                      "./lib/icons/google.png",
                      height: 35,
                      width: 35,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .14,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pushNamed(context, "/sign");
                        });
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
