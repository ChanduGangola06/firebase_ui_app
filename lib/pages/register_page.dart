import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  void createAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cPasswordController.text.trim();

    if (email == "" || password == "" || cPassword == "") {
      log("Please fill all the details");
    } else if (password != cPassword) {
      log("Password do not match");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const LoginPage()));
        }
        log("User created!");
      } on FirebaseAuthException catch (ex) {
        log(ex.code.toString());
      }
    }
  }

  bool isHidden = true;

  void _togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 250,
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text(
                      "Welcome Back",
                      style: GoogleFonts.roboto(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign up to Continue",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: const Color(0xFF98E1F2),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          // Email
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFEEEEEE),
                              prefixIcon: const Icon(Icons.email),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: const EdgeInsets.all(10),
                              hintText: 'Email or Phone',
                              hintStyle: GoogleFonts.roboto(fontSize: 14),
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Password
                          TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFEEEEEE),
                              prefixIcon: const Icon(Icons.lock),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: const EdgeInsets.all(10),
                              hintText: 'Password',
                              hintStyle: GoogleFonts.roboto(fontSize: 14),
                              suffix: InkWell(
                                onTap: _togglePasswordView,
                                child: const Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            obscureText: isHidden,
                          ),
                          const SizedBox(height: 15),
                          // Confirm Password
                          TextField(
                            controller: cPasswordController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFEEEEEE),
                              prefixIcon: const Icon(Icons.lock),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: const EdgeInsets.all(10),
                              hintText: 'Confirm Password',
                              hintStyle: GoogleFonts.roboto(fontSize: 14),
                              suffix: InkWell(
                                onTap: _togglePasswordView,
                                child: const Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            obscureText: isHidden,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 22),
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {
                          createAccount();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF98E1F2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Already have account? ",
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                              children: [
                                TextSpan(
                                  text: "SignIn",
                                  style: GoogleFonts.roboto(
                                    color: const Color(0xFF98E1F2),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage(),
                                            ),
                                          )
                                        },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
