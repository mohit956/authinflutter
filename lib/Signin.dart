import 'package:authinflutter/GoogleAuth.dart';
import 'package:authinflutter/Home.dart';
import 'package:authinflutter/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration(BuildContext context) async {
    if (name.text != "" || pass.text != "" || email.text != "") {
      try {
        // Adding user in firebase
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.text.toString(), password: pass.text.toString());
        // Navigator.push(
        // context, MaterialPageRoute(builder: (context) => const Home()));
// Showing message of signup
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Done")));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
        print("Done");
      } catch (e) {
        // ScaffoldMessenger.of(context as BuildContext)
        //     .showSnackBar(SnackBar(content: Text(e.toString())));
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Pleas enter required feilds";
                    }
                    return null;
                  },
                  controller: name,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Pleas enter required feilds";
                    }
                    return null;
                  },
                  controller: email,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Pleas enter required feilds";
                    }
                    return null;
                  },
                  controller: pass,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Add your sign up logic here
                    registration(context);
                  },
                  child: Text('Sign Up'),
                ),
                SizedBox(height: 20.0),
                Text("Or Login with"),
                SizedBox(
                  height: 10,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GoogleSignInButton()));
                  },
                  icon: Icon(Icons.g_mobiledata_outlined),
                  color: Colors.red,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    'Already have an account? Login',
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
