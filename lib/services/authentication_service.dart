import 'dart:convert';
import 'package:flutter_authentication_client/apis/authentication_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationService {
  final AuthenticationApi authenticationApi = AuthenticationApi();

  Future<String> fetchData(data) async {
    try {
      final result = await AuthenticationApi().login(data);
      final body = json.decode(result);

      if (body['token'] != null) {
        FlutterSecureStorage storage = new FlutterSecureStorage();
        await storage.write(key: 'token', value: body['token']);
      } 
      return result;
    } catch (e) {
      throw e;
    }
  }
}
