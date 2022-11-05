import 'dart:convert';

import 'package:mos_estate/pages/login/login_request.dart';
import 'package:mos_estate/pages/login/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:mos_estate/shared/constants/request_pathes.dart';

class LoginRequests {
  static Future<LoginResponse> login(String username, String password) async {
    final body = LoginRequest(username: username, password: password).toMap();

    final response = await http
        .post(Uri.https(host, '/api/login'), body: json.encode(body), headers: {"Content-Type": "application/json"});

    return LoginResponse.fromJson(response.body);
  }
}
