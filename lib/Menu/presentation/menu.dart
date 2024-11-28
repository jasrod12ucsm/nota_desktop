import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notacredito/Credit/presentation/credit_page.dart';
import 'package:notacredito/public/provider/menu_controller.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    final menuuController = Get.put(MenuuController());
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(constraints.maxWidth, 100),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: const BorderDirectional(
                        bottom: BorderSide(width: 1, color: Colors.black)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                        spreadRadius: 4,
                      )
                    ]),
                child: Row(
                  children: [
                    Container(
                      constraints: const BoxConstraints(minWidth: 200),
                      width: constraints.maxWidth * 0.1,
                      height: 100,
                      child: Center(
                        child: Text(
                          'MENU',
                          style: theme.textTheme.displaySmall,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 9,
                        child: SizedBox(
                          child: Row(
                            children: [
                              Expanded(child: Container()),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: SizedBox(
                                  width: 200,
                                  height: 100,
                                  child: Obx(() => ElevatedButton(
                                        onPressed: () {
                                          menuuController.textColorClient
                                              .value = Colors.white;
                                          menuuController.textColorCredit
                                              .value = Colors.yellow;
                                          menuuController.pageController.value =
                                              0;
                                        },
                                        style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 12), // Espaciado
                                            backgroundColor: Colors.pink),
                                        child: Center(
                                          child: Text(
                                            'CREDIT NOTES',
                                            style: TextStyle(
                                              color: menuuController
                                                  .textColorCredit.value,
                                              fontFamily: "Segoe UI",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.25,
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                              Expanded(child: Container()),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: SizedBox(
                                  width: 200,
                                  height: 100,
                                  child: Obx(() => ElevatedButton(
                                        onPressed: () {
                                          menuuController.textColorClient
                                              .value = Colors.yellow;
                                          menuuController.textColorCredit
                                              .value = Colors.white;
                                          menuuController.pageController.value =
                                              1;
                                        },
                                        style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 12), // Espaciado
                                            backgroundColor: Colors.pink),
                                        child: Center(
                                          child: Text(
                                            'CLIENT',
                                            style: TextStyle(
                                              color: menuuController
                                                  .textColorClient.value,
                                              fontFamily: "Segoe UI",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.25,
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                              Expanded(child: Container())
                            ],
                          ),
                        ))
                  ],
                ),
              )),
          body: Obx(
            () => IndexedStack(
              index: menuuController.pageController.value,
              children: [
                Credit_page(),
                Container(
                  color: Colors.amber,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
