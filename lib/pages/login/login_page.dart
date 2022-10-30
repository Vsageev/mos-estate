import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/login/login_cubit.dart';
import 'package:mos_estate/pages/login/login_state.dart';
import 'package:mos_estate/shared/widget/custom_text_form.dart';
import 'package:mos_estate/shared/widget/button.dart';
import 'package:mos_estate/shared/widget/navigated_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return NavigatedPage(
          body: Center(
        child: Container(
          width: 452.8,
          height: 458.4,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color.fromRGBO(234, 234, 234, 1), width: 2.4),
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
                  Text(
                    "Авторизация",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.6,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(height: 41.6),
              CustomTextForm(hint: "Имя пользователя", controller: username),
              const SizedBox(height: 28.8),
              CustomTextForm(hint: "Пароль", controller: username),
              const SizedBox(height: 47.2),
              Button(
                onTap: () {},
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 19.2),
                child: const Center(
                    child: Text(
                  "Войти",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 19.2),
                )),
              ),
            ]),
          ),
        ),
      ));
    });
  }
}
