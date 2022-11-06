import 'package:flutter/material.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/shared/services/login_service.dart';
import 'package:mos_estate/shared/widget/dropdown_popup/dropdown_item.dart';
import 'package:mos_estate/shared/widget/dropdown_popup/dropdown_popup.dart';

class NavigatedPage extends StatelessWidget {
  final Widget body;

  NavigatedPage({super.key, required this.body});

  final accountButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Scaffold(
          body: Column(
            children: [
              Container(
                height: 55,
              ),
              Expanded(
                child: body,
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: CustomColors.div, width: 1),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 26,
                    width: 26,
                    child: Image.network(
                      'assets/decorations/logo.png',
                      isAntiAlias: true,
                    ),
                  ),
                  Container(width: 16),
                  const Text(
                    'Аналитический центр Москвы',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  if (LoginService.instance.token != null)
                    IconButton(
                      key: accountButtonKey,
                      padding: const EdgeInsets.all(0),
                      onPressed: () async {
                        final val = await openDropdown(
                            context,
                            accountButtonKey,
                            [
                              DropdownItem(
                                  child: Container(
                                    width: 200,
                                    padding: const EdgeInsets.all(5),
                                    child: const Text(
                                      "Выйти",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  value: AccountActions.logout),
                            ],
                            10);

                        if (val == AccountActions.logout) {
                          LoginService.logout();
                        }
                      },
                      icon: const Icon(
                        Icons.account_circle,
                        size: 30,
                      ),
                    ),
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}

enum AccountActions {
  logout,
}
