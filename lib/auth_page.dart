import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth Page'),
        centerTitle: true,
      ),
      body: Center(
        child: IconButton(onPressed: (){}, icon: Icon(Icons.fingerprint,size: 70)))
    );
  }
}