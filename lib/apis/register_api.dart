import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:developer' as developer;

class RegisterApi {
  static String baseUrl = '${dotenv.env['LOCAL_IP']}/register';

  Future<String> register(data) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: jsonEncode(data),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    if (response.statusCode == 400) {
      throw Exception('Bad Request');
    } else {
      return response.body;
    }
  }
}
