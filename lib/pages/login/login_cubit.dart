import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
}
