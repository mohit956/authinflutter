import 'package:authinflutter/Login.dart';
import 'package:authinflutter/Signin.dart';
import 'package:authinflutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupPage(),
    );
  }
}

// import 'package:authinflutter/Home.dart';
// import 'package:authinflutter/firebase_options.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(SignUpApp());
// }

// class SignUpApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sign Up',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SignUpScreen(),
//     );
//   }
// }

// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   String email = '', password = '', name = '';
//   final TextEditingController _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _formkey = GlobalKey<FormState>();
//   registration() async {
//     if (_passwordController.text != "" &&
//         _nameController.text != '' &&
//         _emailController.text != '') {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(
//                 email: _emailController.text.toString(),
//                 password: _passwordController.text.toString());
//         print('done');
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Home()));
//       } catch (e) {
//         print(e.toString());
//       }
//     } else {
//       print("fill the required feild");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formkey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextFormField(
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'please enter name';
//                   }
//                   return null;
//                 },
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'please enter email';
//                   }
//                   return null;
//                 },
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'please enter password';
//                   }
//                   return null;
//                 },
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   print('1');
//                   registration();
//                   print('2');
//                   // Implement your sign up logic here
//                   /*     String name = _nameController.text;
//                   String email = _emailController.text;
//                   String password = _passwordController.text;
          
//                   // Example: Print the values for now
//                   print('Name: $name');
//                   print('Email: $email');
//                   print('Password: $password');*/
//                 },
//                 child: Text('Sign Up'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
