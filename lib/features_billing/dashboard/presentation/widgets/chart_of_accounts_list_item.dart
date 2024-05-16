import 'package:flutter/material.dart';
import 'package:hebauto/core/util/ext/ext.dart';

import '../../../../core/util/util.dart';
import '../../../../injection.dart';
import '../../../chartofaccounts/domain/repository/chart_of_accounts_repository.dart';

class ChartOfAccountsListItem extends StatelessWidget {
  const ChartOfAccountsListItem(
      {super.key,
      required this.text,
      this.isAccount = false,
      required this.code,
      required this.level});

  final String text;
  final String code;
  final bool isAccount;
  final int level;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: boxDecorationWithRoundedCorners(
          // backgroundColor:
          //     kPrimaryColor.withOpacity(0.2),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (level == 3 || level == 4) 20.width,
              Container(
                height: 25,
                width: 25,
                // margin:
                // EdgeInsets.all(5.0),
                decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: kPrimaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Icon(
                    Icons.delete_outline,
                    color: kPrimaryColor,
                    size: 13,
                  ),
                ),
              ),
              10.width,
              Text(
                text,
                style: TextStyle(
                    fontWeight: isAccount ? null : FontWeight.bold,
                    color: level == 4 ? Colors.blueAccent : null),
              ),
            ],
          ),
          if (isAccount)
            Text(
              code,
              style: const TextStyle(fontStyle: FontStyle.italic),
            )
          else
            const Icon(Icons.circle_outlined)
        ],
      ),
    ).onTap(() async {
      final data =
          await getIt<ChartOfAccountsRepository>().fetchAccountCodeReport(code);

      data.fold(
        (error) {
          'Something went wrong!'.toToastError(context);
        },
        (success) {
          if(success.isEmpty){
            'No Record against this code!'.toast();
          }else {
            showDialog(
              context: context,

              builder: (BuildContext context) {
                return AlertDialog(
                    content:  SizedBox(
                        width: context.width() / 2,
                        height: context.height(),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [

                              Text(text, style:  const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                              Text(code, style:  const TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),




                              ...success.map((e) => Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(e.purchaseId), Text(e.supplierName)
                                    ],
                                  )
                                ],
                              ))
                            ],
                          ),
                        )));
              },
            );
          }

        },
      );
    });
  }
}
