import 'package:flutter/material.dart';


import '../../../admin_report/persentation/pages/display_report.dart';
import '../../../customer_profile/presentation/ui/customer_profile_screen.dart';
import '../../../customer_profile/presentation/ui/show_customers_screen.dart';
import '../../../inventory/presentation/pages/add_inventory_screen.dart';
import '../../../inventory/presentation/pages/display_inventory_screen.dart';
import '../../../inventory/presentation/pages/update_inventory_screen.dart';
import '../../../tracking/presentation/ui/admin_tracking_screen.dart';
import '../pages/add_customer_screen.dart';
import '../../../pricelist/presentation/ui/price_list_screen.dart';
import '../pages/dashboard_main.dart';




class Pages extends StatelessWidget {
  final text;
  final color;

  const Pages({super.key, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                textAlign: TextAlign.center,
                style:
                const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
            ]),
      ),
    );
  }
}



final List<Widget> list = <Widget>[

  const Center(
    child: DashboardMain(),
  ),
  const Center(
    child: AddInventoryScreen(),
  ),

  const Center(
    child: DisplayInventoryScreen(),
  ),

  const Center(
    child: AdminTrackingScreen(),
  ),

  const Center(
    child: PriceListScreen(),
  ),
  Center(
    child: Pages(
      text: 'Page Five',
      color: Colors.yellow.shade100,
    ),
  ),
  Center(
    child: Pages(
      text: 'Page Six',
      color: Colors.yellow.shade100,
    ),
  ),
  AddCustomerScreen(),
  const ShowCustomersScreen(),
  const Center(
    child: DisplayReportScreen(),
  ),


  Center(
    child: Pages(
      text: 'Page Ten',
      color: Colors.yellow.shade100,
    ),
  ),
  const UpdateInventoryScreen(),
  const CustomerProfileScreen(),
];
