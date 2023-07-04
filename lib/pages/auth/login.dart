import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/pages/auth/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? errorMessage = '';

  Future<void> _signInWithGoogle() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    try {
      await Auth().signUpWithGoogle();
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
        print(errorMessage);
      });
    }
    Navigator.pop(context);
  }

  Future<void> _signInWithFb() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      await Auth().signInWithFacebook();
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
        print(errorMessage);
      });
    } finally {
      Navigator.pop(context);
    }
  }

  Future<void> _signInWithEmailAndPassword() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    try {
      await Auth().signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
        print(errorMessage);
      });
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                child: Image.asset('assets/images/login-image.jpg'),
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 30.0, 10.0),
                child: Column(
                  children: [
                    _buildInput('Email', _emailController, false),
                    _buildInput('Password', _passwordController, true),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                      child: Text(
                        errorMessage!,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: 180,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _signInWithEmailAndPassword();
                    },
                    child: const Text('Log in'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffECECEC),
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text('or login with'),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              _buildProviderButtons(),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle navigation to the sign-up screen here
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput(
    String title,
    TextEditingController controller,
    bool isPassword,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 20, top: 7),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          suffixIcon: isPassword
              ? IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {},
                )
              : null,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(8),
          hintStyle: const TextStyle(
            color: Color(0xffDDDADA),
            fontSize: 14,
          ),
          labelText: title,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProviderButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xffECECEC),
            child: IconButton(
              icon: Image.asset('assets/icons/google.png', height: 20),
              onPressed: () {
                _signInWithGoogle();
              },
            ),
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: Color(0xffECECEC),
          child: IconButton(
            icon: Image.asset('assets/icons/facebook.png', height: 27),
            onPressed: () {
              _signInWithFb();
            },
          ),
        ),
      ],
    );
  }
}
