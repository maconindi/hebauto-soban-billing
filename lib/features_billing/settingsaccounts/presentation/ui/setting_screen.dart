import 'package:flutter/material.dart';
import 'package:hebauto/core/components/dx_text.dart';
import 'package:hebauto/core/util/colors.dart';
import 'package:hebauto/core/util/decorations.dart';
import 'package:hebauto/core/util/ext/context.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 100,
                width: context.width(),
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: Color.fromARGB(255, 245, 244, 244),
                ),
                child: const DxText(
                  text: 'Settings',
                  isBold: true,
                  size: 20,
                  color: grey,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                child: Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      color: const Color.fromARGB(255, 250, 250, 250),
                      height: 67,
                      width: 800,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.currency_exchange_sharp,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Currency Setting',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 120,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.account_tree_sharp,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Charts of Accounts',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 120,
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const ChartOfAccountsScreen()), 
                                    // );
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.percent_rounded,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Tax Setting',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            height: 1.5,
                            color:
                                Colors.grey, // Use a predefined color constant
                          ),
                        ],
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
