import 'package:flutter/material.dart';
import 'package:hebauto/core/util/ext/ext.dart';

class DashboardRecentHistoryListItem extends StatelessWidget {
  const DashboardRecentHistoryListItem(
      {super.key,
      this.color = Colors.grey,
      required this.vinNumber,
      required this.carDetails,
      required this.departurePort,
      // required this.shippingPrice,
      required this.deliveryPort,
      required this.state});

  final String vinNumber;
  final String carDetails;
  final String departurePort;
  final Color color;

  // final String shippingPrice;
  final String deliveryPort;
  final String state;

  @override
  Widget build(BuildContext context) {
    //Colors.grey[300];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: color),
            child: Center(
              child: SelectableText(vinNumber,
                  focusNode: FocusNode(),
                  //overflow: TextOverflow.ellipsis
              ),
            ),
          ).expand(),
          5.width,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: color),
            child: Center(
              child: Text(
                carDetails,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ).expand(),
          1.width,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: color),
            child: Center(
              child: Text(
                departurePort,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ).expand(),
          1.width,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: color),
            child: Center(
              child: Text(
                deliveryPort,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ).expand(),
          1.width,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: color),
            child: Center(
              child: Text(

                state == 'State' ? state : '⬤ $state',
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(

                  fontWeight: state == 'State' ? null : FontWeight.w400,
                    color:
                        state == 'State' ? null : getColor(state)),
              ),
            ),
          ).expand(),
        ],
      ),
    );
  }

  Color getColor(String type) {
    switch (type) {
      case 'New Created':
        return Colors.redAccent;
      case 'Shipping':
        return Colors.pinkAccent;
      case 'Towing':
        return Colors.blueAccent;
      case 'Delivered':
        return Colors.greenAccent;
      case 'Warehouse':
        return Colors.deepPurple;
      default:
        return Colors.grey.withOpacity(0.5);
    }
  }
}
