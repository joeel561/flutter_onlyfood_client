import 'dart:convert';
import 'package:flutter_authentication_client/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication_client/services/authentication_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  static const route = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthenticationService authenticationService = AuthenticationService();

  Future<void> login() async {
    var data = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    try {
      final result = await authenticationService.fetchData(data);
      final body = json.decode(result);

      if (body['token'] != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter-Symfony Rest API'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'E-mail',
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  labelStyle: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 24),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 16),
                      )
                  )
                ]
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
