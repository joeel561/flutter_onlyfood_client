import 'dart:convert';
import 'package:flutter_authentication_client/apis/register_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:developer' as developer;

class RegisterService {
  final RegisterApi registerApi = RegisterApi();

  Future<String> fetchData(data) async {
    try {
      final result = await RegisterApi().register(data);

      return result;
    } catch (e) {
      throw e;
    }
  }
}
