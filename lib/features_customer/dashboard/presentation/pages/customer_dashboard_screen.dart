import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/context.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/core/util/ext/widget.dart';

import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_states.dart';
import '../widgets/customer_sidebar.dart';
import '../widgets/header.dart';
import '../widgets/mobile_header.dart';



class CustomerDashboardScreen extends StatefulWidget {
  //Widget? child;

  const CustomerDashboardScreen({super.key,
  //  this.child = const SizedBox()
  });

  @override
  State<CustomerDashboardScreen> createState() =>
      _CustomerDashboardScreenState();
}

class _CustomerDashboardScreenState extends State<CustomerDashboardScreen> {
  //PageController controller = PageController();

  // final List<Widget> _list = <Widget>[
  //   // const Center(
  //   //   child: DashboardMain(),
  //   // ),
  //   const Center(
  //     child: DashboardMain(),
  //   ),
  //   const Center(
  //     child: ShowCustomerInventory(),
  //   ),
  //   const Center(
  //     child: CustomerTrackingScreen(),
  //   ),
  //   const Center(
  //     child: PriceListScreen(),
  //   ),
  //   const Center(
  //     child: EmptyPage(
  //       pageName: 'Notification',
  //     ),
  //   ),
  //   const Center(
  //     child: EmptyPage(
  //       pageName: 'Estimate Calculator',
  //     ),
  //   ),
  //   const Center(
  //     child: EmptyPage(
  //       pageName: 'Reports',
  //     ),
  //   ),
  //   const Center(
  //     child: EmptyPage(
  //       pageName: 'Chat',
  //     ),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          context.isPhone() ? const SizedBox.shrink(): const DashboardSideBarCustomer().expand(flex: 1),
          Column(
            children: [

              context.isPhone() ? 20.height : const SizedBox.shrink(),

              context.isPhone() ?  MobileHeader(): const Header(),

              BlocBuilder<CustomerDashboardBloc, DashboardState>(
                builder: (context, state) {
                  return state.screen;
                },
              ).expand(),
              // PageView(
              //   physics: const NeverScrollableScrollPhysics(),
              //   controller: controller,
              //   onPageChanged: (val) {},
              //   children: _list,
              // ).expand(),
            ],
          ).expand(flex: 5)
        ],
      ),
    );
  }
}
