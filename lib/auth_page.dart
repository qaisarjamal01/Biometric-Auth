import 'package:biometric_auth/auth_service.dart';
import 'package:biometric_auth/home_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authCheck();
  }

  void authCheck() async{
    bool check = await AuthService().authenticateLocally();
    if(check) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth Page'),
        centerTitle: true,
      ),
      body: Center(
        child: IconButton(onPressed: () async{
          authCheck();
          // bool check = await AuthService().authenticateLocally();
          // if(check) {
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          // }
        }, icon: Icon(Icons.fingerprint,size: 70)))
    );
  }
}