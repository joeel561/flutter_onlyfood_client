import 'dart:convert';
import 'package:flutter_authentication_client/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication_client/services/register_service.dart';
import 'dart:developer' as developer;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  static const route = '/register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final RegisterService registerService = RegisterService();
  final _formKey = GlobalKey<FormState>();

  Future<void> register() async {
    var data = {
      'username': userNameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    };
    try {
      final result = await registerService.fetchData(data);
      final body = json.decode(result);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(body['success']),
        ),
      );

      Navigator.pushNamed(context, Login.route);
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
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                const SizedBox(height: 24),
                TextFormField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'User Name',
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a user name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'E-mail',
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an e-mail address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Confirm Password',
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm your password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }

                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      register();
                    }
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Already Registered? Login',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
