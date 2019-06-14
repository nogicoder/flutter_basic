import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(title: "Sample App", home: CustomForm());
  }
}

class CustomForm extends StatefulWidget {
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              onChanged: (text) {
                print("First text field: $text");
              },
              decoration: InputDecoration(
                  hintText: 'Type something', labelText: 'Text Field '),
            ),
            RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                showDialog(
                  context: context,
                  child: AlertDialog(
                    title: Text('Alert'),
                    content: Text('You typed ${_controller.text}'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
