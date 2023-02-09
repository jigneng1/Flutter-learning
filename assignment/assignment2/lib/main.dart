import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Form assignment'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: const MyCustomForm(),
      ),
    ));
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  bool texterror = false;
  bool passwordErr = false;
  bool emailErr = false;
  final myText = TextEditingController();
  final myNumber = TextEditingController();
  final myEmail = TextEditingController();
  @override
  void dispose() {
    myText.dispose();
    myNumber.dispose();
    myEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: myText,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Name',
            errorText: texterror ? 'Name is required' : null,
          ),
          onChanged: (value) {
            if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
              setState(() {
                texterror = true;
              });
            } else {
              setState(() {
                texterror = false;
              });
            }
          },
        ),
        const SizedBox(height: 20),
        TextField(
          controller: myNumber,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'student id',
            errorText: passwordErr ? 'password is required' : null,
          ),
          onChanged: (value) {
            if (value.isEmpty ||
                !RegExp(r'[0-9]$').hasMatch(value) ||
                value.length > 11) {
              setState(() {
                passwordErr = true;
              });
            } else {
              setState(() {
                passwordErr = false;
              });
            }
          },
        ),
        const SizedBox(height: 20),
        TextField(
          controller: myEmail,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Email',
            errorText: emailErr ? 'Email is required' : null,
          ),
          onChanged: (value) {
            if (value.isEmpty ||
                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              setState(() {
                emailErr = true;
              });
            } else {
              setState(() {
                emailErr = false;
              });
            }
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: (texterror || passwordErr || emailErr)
              ? null
              : () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Student info',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),
                          ),
                          Text('Name: ${myText.text}'),
                          Text('Password: ${myNumber.text}'),
                          Text('Email: ${myEmail.text}'),
                        ],
                      ));
                    },
                  );
                },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
