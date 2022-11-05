// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginResponse {
  final bool status;
  final String message;
  final String? token;

  LoginResponse(this.status, this.message, this.token);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'token': token,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      map['status'] as bool,
      map['message'] as String,
      map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) => LoginResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
