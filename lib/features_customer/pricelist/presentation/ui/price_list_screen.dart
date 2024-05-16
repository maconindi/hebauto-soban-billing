import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hebauto/core/components/dx_text.dart';
import 'package:hebauto/core/util/colors.dart';
import 'package:hebauto/core/util/decorations.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_customer/pricelist/presentation/bloc/pricelist_bloc.dart';

import '../../../../core/components/dx_pdf_viewer.dart';
import '../../../../core/services/hive/main_box.dart';
import '../../domain/usecase/customer_pricelist_usecase.dart';
import '../bloc/pricelist_event.dart';
import '../bloc/pricelist_state.dart';

class PriceListScreen extends StatefulWidget {
  const PriceListScreen({super.key});

  @override
  State<PriceListScreen> createState() => _PriceListScreenState();
}

class _PriceListScreenState extends State<PriceListScreen> {
  @override
  void initState() {
    super.initState();

    context.read<CustomerPriceListBloc>().add(
          FetchPriceListEvent(
            params: CustomerPriceListParams(
                cusEmail:
                    '${(MainBoxMixin.mainBox?.get(MainBoxKeys.email.name) ?? false)}'),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerPriceListBloc, CustomerPriceListState>(
      builder: (context, state) {
        if (state.status.isLoading) return const CircularProgressIndicator();
        if (state.status.isError) return Text(state.message);
        if (state.status.isSuccess) {
          //debugPrint('>>> ${state.data.first.url}');
          return state.data.isEmpty ? const Center(
            child: Text('No Pricelist Found!'),
          ) : GroupedListView<dynamic, String>(
            elements: state.data,
            groupBy: (element) => element.createdAt.substring(0, 10),
            groupSeparatorBuilder: (String groupByValue) => Padding(
              padding: const EdgeInsets.all(8),
              child: DxText(
                text: groupByValue,
                isBold: true,
                size: 25,
                align: TextAlign.left,
              ),
            ),
            //separator: 10.height,
            itemBuilder: (context, dynamic element) {
              return Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: boxDecorationWithRoundedCorners(
                            border: Border.all(color: redColor)
                          ),
                          child: const Center(
                            child: Icon(Icons.picture_as_pdf_outlined ),
                          ),
                        
                        ),
                        10.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const DxText(text:'Uploading Date' , isBold:  true, size: 20,),
                            DxText(text: element.createdAt , size: 15,)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ).onTap((){
                if(element.url != ''){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DxPdfViewer(
                          vin: '',
                          url: element.url);
                    },
                  );
                }else{
                  'Something went wrong! Try again.'.toast();
                }
              });
            },
            order: GroupedListOrder.DESC,
            // itemComparator: (item1, item2) => item1['name'].compareTo(item2['name']), // optional
            // useStickyGroupSeparators: true, // optional
            // floatingHeader: true, // optional
          );
        }
        return Container();
      },
    );
  }
}
