import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == "") {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Implement your logic here to send reset password instructions
                  String email = _emailController.text;
                  // Example: Call a function to send reset password instructions
                  _sendResetPasswordInstructions(email);
                }
              },
              child: Text('Send Reset Instructions'),
            ),
          ],
        ),
      ),
    );
  }

  void _sendResetPasswordInstructions(String email) async {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print("sended");
    } catch (e) {
      print(e.toString());
    }
  }
}
