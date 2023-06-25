import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter-Symfony Rest API'),
      ),
      body: const Center(
        child: Text('Successfully logged in!'),
      ),
    );
  }
}
