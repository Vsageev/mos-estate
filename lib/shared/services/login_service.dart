class LoginService {
  
  String? token;

  LoginService._privateConstructor(this.token);

  static final LoginService _instance = LoginService._privateConstructor(null);

  static LoginService get instance => _instance;


}