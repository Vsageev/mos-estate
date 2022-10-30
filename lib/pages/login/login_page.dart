import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/login/login_cubit.dart';
import 'package:mos_estate/shared/widget/auth_text_form.dart';
import 'package:mos_estate/shared/widget/button.dart';
import 'package:mos_estate/shared/widget/navigated_page.dart';
import 'package:mos_estate/shared/widget/submitable_text_form.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return NavigatedPage(
          body: Container(
        child: Center(
          child: Container(
            width: 452.8,
            height: 458.4,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color.fromRGBO(234, 234, 234, 1),
                width: 2.4
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.8),
              child: Column(children: [
                const SizedBox(
                  height: 75.2,
                ),
                Row(
                  children: const [
                    const Text(
                      "Авторизация",
                      style: const TextStyle(
                        fontWeight:  FontWeight.w700,
                        fontSize: 25.6,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(height: 41.6),
                const AuthTextForm(hint: "Имя пользователя"),
                const SizedBox(height: 28.8),
                const AuthTextForm(hint: "Пароль"),
                const SizedBox(height: 47.2),
                Button(child: Center(child: Text("Войти", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 19.2),)), onTap: (){}, width: double.infinity, padding: EdgeInsets.symmetric(vertical: 19.2),),

              ]),
            ),
          ),
        ),
      ));
    });
  }
}
