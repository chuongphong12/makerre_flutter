import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
      ),
      body: Column(children: [
        Card(
          shadowColor: Color(0xFFBDBDBBD),
          child: Row(
              children: [IconButton(onPressed: () {}, icon: Icon(Icons.abc))]),
        )
      ]),
    );
  }
}
