import 'package:authinflutter/ForgotPass.dart';
import 'package:authinflutter/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  String _errorMessage = "";

  checkuser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text.toString(), password: pass.text.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      setState(() {
        if (e is FirebaseAuthException) {
          switch (e.code) {
            case 'user-not-found':
              _errorMessage = 'No user found with this email.';
              break;
            case 'wrong-password':
              _errorMessage = 'Invalid password.';
              break;
            case 'invalid-email':
              _errorMessage = 'Invalid email address.';
              break;
            default:
              _errorMessage = 'can not determine.';
          }
        } else {
          _errorMessage = 'can not determine.';
        }
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(_errorMessage)));
      // print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Login',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: email,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: pass,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Add your login logic here
                  checkuser();
                },
                child: Text('Login'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordForm()));
                  },
                  child: Text("Forgot pass")),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/signup');
                },
                child: Text(
                  'Don\'t have an account? Sign up',
                  style: TextStyle(fontSize: 16.0, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
