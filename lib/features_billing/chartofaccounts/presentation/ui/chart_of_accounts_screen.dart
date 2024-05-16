// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/components/dx_text.dart';
import 'package:hebauto/core/util/ext/ext.dart';

import '../../../../core/util/util.dart';
import '../../../dashboard/presentation/widgets/chart_of_accounts_list_item.dart';
import '../../domain/usecase/chart_of_accounts_usecase.dart';
import '../bloc/chart_of_accounts_state.dart';
import '../bloc/chat_of_accounts_cubit.dart';
import '../widgets/alert_add_group.dart';

class ChartOfAccountsScreen extends StatefulWidget {
  const ChartOfAccountsScreen({super.key});

  @override
  State<ChartOfAccountsScreen> createState() => _ChartOfAccountsScreenState();
}

class _ChartOfAccountsScreenState extends State<ChartOfAccountsScreen> {
  final kBackgroundColor = Colors.grey.withOpacity(0.1);
  final kVerticalSpaces = 10.height;
  final kHorizontalSpaces = 5.width;

  String getGroupType(int index) {
    // Create a map to store integer to string mappings
    final stringMap = <int, String>{
      1: 'Assets',
      5: 'Income',
      4: 'Cost Of Sales',
      3: 'Equity',
      2: 'Liabilities',
      6: 'Expenses',
    };
    return stringMap[index] ?? '';
  }

  int getGroupTypeIndex(String value) {
    final indexMap = <String, int>{
      'Assets': 1,
      'Income': 5,
      'Cost Of Sales': 4,
      'Equity': 3,
      'Liabilities': 2,
      'Expenses': 6,
    };
    return indexMap[value] ?? 0;
  }

  @override
  void initState() {
    super.initState();
    context.read<ChartOfAccountsCubit>().fetchAccountsList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChartOfAccountsCubit, ChartOfAccountsState>(
      listener: (context, bloc) {
        if (bloc.status.isSuccess) {}
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            20.height,
            Container(
              height: 100,
              width: context.width(),
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: kBackgroundColor),
              child: const DxText(
                text: 'Chart Of Accounts',
                isBold: true,
                size: 25,
                color: grey,
              ),
            ),
            20.height,
            SingleChildScrollView(
              child: Column(
                children: [
                  kVerticalSpaces,
                  BlocBuilder<ChartOfAccountsCubit, ChartOfAccountsState>(
                    builder: (BuildContext context, state) {
                      return Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          SizedBox(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          Map<String, dynamic> groupDetails =
                                              await showAddGroupAlert(context,
                                                  title: 'Add Group');
                                          if (groupDetails['groupValue']
                                              .toString()
                                              .isNotEmpty) {
                                            context
                                                .read<ChartOfAccountsCubit>()
                                                .addItemChartOfAccounts(
                                                  AddChartOfAccountsParams(
                                                      name:
                                                          groupDetails['name'],
                                                      parentItemId:
                                                          getGroupTypeIndex(
                                                              groupDetails[
                                                                  'groupValue']),
                                                      level: 2),
                                                  true,
                                                );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.dashboard_outlined,
                                          color: kPrimaryColor,
                                        )),
                                    10.width,
                                    IconButton(
                                        onPressed: () async {
                                          Map<String, dynamic> accountDetails =
                                              await showAddAccountAlert(
                                                  context,
                                                  title: 'Add Account',
                                                  state.groupsList);
                                          if (accountDetails['code']
                                              .toString()
                                              .isNotEmpty) {
                                            context
                                                .read<ChartOfAccountsCubit>()
                                                .addItemChartOfAccounts(
                                                    AddChartOfAccountsParams(
                                                        name: accountDetails[
                                                            'name'],
                                                        parentItemId:
                                                            accountDetails[
                                                                    'groupValue']
                                                                .toString()
                                                                .toInt(
                                                                    defaultValue:
                                                                        0),
                                                        level: 3,
                                                        code: accountDetails[
                                                            'code']),
                                                    false);
                                          }
                                        },
                                        icon: Icon(Icons.account_box_outlined,
                                            color: kPrimaryColor)),
                                    IconButton(
                                        onPressed: () async {
                                          Map<String, dynamic> accountDetails =
                                              await showAddAccountAlert(
                                                  context,
                                                  title: 'Add Sub Account',
                                                  state.accountsList);
                                          if (accountDetails['code']
                                              .toString()
                                              .isNotEmpty) {
                                            context
                                                .read<ChartOfAccountsCubit>()
                                                .addItemChartOfAccounts(
                                                    AddChartOfAccountsParams(
                                                        name: accountDetails[
                                                            'name'],
                                                        parentItemId:
                                                            accountDetails[
                                                                    'groupValue']
                                                                .toString()
                                                                .toInt(
                                                                    defaultValue:
                                                                        0),
                                                        level: 4,
                                                        code: accountDetails[
                                                            'code']),
                                                    false);
                                          }
                                        },
                                        icon: Icon(
                                            Icons.supervisor_account_rounded,
                                            color: kPrimaryColor)),
                                  ],
                                ),
                                10.height,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      //color:Colors.yellow,
                                      decoration:
                                          boxDecorationWithRoundedCorners(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text(
                                                'Balance Sheet',
                                                style: TextStyle(color: grey),
                                              ),
                                            ],
                                          ),
                                          const Divider(
                                            height: 2,
                                            color: grey,
                                          ),
                                          20.height,
                                          DxText(
                                            text: 'Assets'.toUpperCase(),
                                            isBold: true,
                                            size: 20,
                                          ),
                                          if (state.groupsList
                                              .where((element) =>
                                                  element.parentId == 1)
                                              .isNotEmpty)
                                            ...state.groupsList
                                                .where((element) =>
                                                    element.parentId == 1)
                                                .map((e) => Column(
                                                      children: [
                                                        ChartOfAccountsListItem(
                                                            level: 2,
                                                            code: '',
                                                            text: e.groupName),
                                                        ...state.accountsList
                                                            .where((element) =>
                                                                element.parentId == e.id)
                                                            .map((e) => Column(
                                                                  children: [
                                                                    ChartOfAccountsListItem(
                                                                      level: 3,
                                                                      code: e.code,
                                                                      text: e.accountName,
                                                                      isAccount: true,
                                                                    ),
                                                                    ...state
                                                                        .subAccountsList
                                                                        .where((element) => element.parentId == e.id)
                                                                        .map((e) =>
                                                                        ChartOfAccountsListItem(
                                                                          level: 4,
                                                                          code: e.code,
                                                                          text: e.accountName,
                                                                          isAccount: true,
                                                                        ))
                                                                  ],
                                                                ))
                                                      ],
                                                    ))
                                          else
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Text('No Groups Yet'),
                                            ),
                                          //...mapValue.map((key, value) => Container()),
                                          // ...groups.map((e) => Container(child: accounts.where((element) => element.groupType = e)...map((e) => Container()))),
                                          DxText(
                                            text: 'Liabilities'.toUpperCase(),
                                            isBold: true,
                                            size: 20,
                                          ),
                                          if (state.groupsList
                                              .where((element) =>
                                                  element.parentId == 2)
                                              .isNotEmpty)
                                            ...state.groupsList
                                                .where((element) =>
                                                    element.parentId == 2)
                                                .map((e) => Column(
                                                      children: [
                                                        ChartOfAccountsListItem(
                                                            level: 2,
                                                            code: '',
                                                            text: e.groupName),
                                                        ...state.accountsList
                                                            .where((element) =>
                                                                element.parentId == e.id)
                                                            .map((e) =>
                                                                ChartOfAccountsListItem(
                                                                  level: 3,
                                                                  code: e.code,
                                                                  text: e.accountName,
                                                                  isAccount: true,
                                                                ))
                                                      ],
                                                    ))
                                          else
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Text('No Groups Yet'),
                                            ),
                                          DxText(
                                            text: 'Equity'.toUpperCase(),
                                            isBold: true,
                                            size: 20,
                                          ),
                                          if (state.groupsList
                                              .where((element) =>
                                                  element.parentId == 3)
                                              .isNotEmpty)
                                            ...state.groupsList
                                                .where((element) =>
                                                    element.parentId == 3)
                                                .map((e) => Column(
                                                      children: [
                                                        ChartOfAccountsListItem(
                                                            level: 2,
                                                            code: '',
                                                            text: e.groupName),
                                                        ...state.accountsList
                                                            .where((element) =>
                                                                element.parentId == e.id)
                                                            .map((e) =>
                                                                ChartOfAccountsListItem(
                                                                  level: 2,
                                                                  code: e.code,
                                                                  text: e.accountName,
                                                                  isAccount: true,
                                                                ))
                                                      ],
                                                    ))
                                          else
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Text('No Groups Yet'),
                                            ),
                                        ],
                                      ),
                                    ).expand(),
                                    20.width,
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      //color:Colors.yellow,
                                      decoration:
                                          boxDecorationWithRoundedCorners(),
                                      //color: Colors.red,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text(
                                                'Profit and Loss Statement',
                                                style: TextStyle(color: grey),
                                              ),
                                              // Row(
                                              //   children: [
                                              //     IconButton(
                                              //         onPressed: () {},
                                              //         icon: Icon(
                                              //           Icons.groups,
                                              //           color: kPrimaryColor,
                                              //         )),
                                              //
                                              //     10.width,
                                              //
                                              //     IconButton(
                                              //         onPressed: () {},
                                              //         icon: Icon(
                                              //             Icons.account_box_outlined,
                                              //             color: kPrimaryColor))
                                              //
                                              //     // FDButton(
                                              //     //   //width: context.width(),
                                              //     //   text: 'Add New Group',
                                              //     //   onTap: () {
                                              //     //
                                              //     //   },
                                              //     // ),
                                              //   ],
                                              // )
                                            ],
                                          ),
                                          const Divider(
                                            height: 2,
                                            color: grey,
                                          ),
                                          20.height,
                                          DxText(
                                            text: 'Less : Cost Of Sales'.toUpperCase(),
                                            isBold: true,
                                            size: 20,
                                          ),
                                          if (state.groupsList
                                              .where((element) =>
                                                  element.parentId == 4)
                                              .isNotEmpty)
                                            ...state.groupsList
                                                .where((element) =>
                                                    element.parentId == 4)
                                                .map((e) => Column(
                                                      children: [
                                                        ChartOfAccountsListItem(
                                                            level: 2,
                                                            code: '',
                                                            text: e.groupName),
                                                        ...state.accountsList
                                                            .where((element) =>
                                                                element.parentId == e.id)
                                                            .map((e) =>
                                                                ChartOfAccountsListItem(
                                                                  level: 2,
                                                                  code: e.code,
                                                                  text: e.accountName,
                                                                  isAccount: true,
                                                                ))
                                                      ],
                                                    ))
                                          else
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Text('No Groups Yet'),
                                            ),
                                          DxText(
                                            text: 'Income'.toUpperCase(),
                                            isBold: true,
                                            size: 20,
                                          ),
                                          if (state.groupsList
                                              .where((element) =>
                                                  element.parentId == 5)
                                              .isNotEmpty)
                                            ...state.groupsList
                                                .where((element) =>
                                                    element.parentId == 5)
                                                .map((e) => Column(
                                                      children: [
                                                        ChartOfAccountsListItem(
                                                            level: 2,
                                                            code: '',
                                                            text: e.groupName),
                                                        ...state.accountsList
                                                            .where((element) =>
                                                                element.parentId == e.id)
                                                            .map((e) =>
                                                                ChartOfAccountsListItem(
                                                                  level: 3,
                                                                  code: e.code,
                                                                  text: e.accountName,
                                                                  isAccount: true,
                                                                ))
                                                      ],
                                                    ))
                                          else
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Text('No Groups Yet'),
                                            ),
                                          DxText(
                                            text: 'Less : Expenses'.toUpperCase(),
                                            isBold: true,
                                            size: 20,
                                          ),
                                          if (state.groupsList
                                              .where((element) =>
                                                  element.parentId == 6)
                                              .isNotEmpty)
                                            ...state.groupsList
                                                .where((element) =>
                                                    element.parentId == 6)
                                                .map((e) => Column(
                                                      children: [
                                                        ChartOfAccountsListItem(
                                                            level: 2,
                                                            code: '',
                                                            text: e.groupName),
                                                        ...state.accountsList
                                                            .where((element) =>
                                                                element.parentId == e.id)
                                                            .map((e) =>
                                                                ChartOfAccountsListItem(
                                                                  level: 3,
                                                                  code: e.code,
                                                                  text: e.accountName,
                                                                  isAccount: true,
                                                                ))
                                                      ],
                                                    ))
                                          else
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Text('No Groups Yet'),
                                            ),
                                        ],
                                      ),
                                    ).expand(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          state.status.isLoading
                              ? AlertDialog(
                                  content: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Center(
                                          child:
                                              const CircularProgressIndicator())))
                              : const SizedBox.shrink(),
                        ],
                      );
                    },
                  ),
                  // 50.height,
                ],
              ),
            ).expand(),
          ],
        ),
      ),
    );
  }
}
