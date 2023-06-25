import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthenticationApi {
  static String baseUrl = '${dotenv.env['LOCAL_IP']}/authentication';
  Future<String> login(data) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: jsonEncode(data),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if (response.statusCode == 401) {
      throw Exception('Incorrect email or password');
    } else {
      return response.body;
    }
  }
}
