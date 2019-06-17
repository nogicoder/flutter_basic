// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(context) {
//     return MaterialApp(title: "Sample App", home: CustomForm());
//   }
// }

// class CustomForm extends StatefulWidget {
//   @override
//   _CustomFormState createState() => _CustomFormState();
// }

// class _CustomFormState extends State<CustomForm> {
//   final formKey = GlobalKey<FormState>();
//   var _email = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Retrieve Text Input'),
//         ),

//         body: Form(
//           key: formKey,
//           child: Column(
//             children: <Widget>[
//               TextFormField(
//                 validator: (value) =>
//                     !value.contains('@') ? 'Not a valid email.' : null,
//                 onSaved: (val) {_email = val;},
//                 decoration: const InputDecoration(
//                   hintText: 'Enter your email',
//                   labelText: 'Email',
//                 ),
//               ),
//               RaisedButton(
//                 onPressed: _submit,
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ));
//   }

//   void _submit() {
//     final FormState form = formKey.currentState;
//     if (form.validate()) {
//       form.save();
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Alert'),
//             content: Text('Email: $_email')
//           );
//         }
//       );
//     }
//   }
// }
