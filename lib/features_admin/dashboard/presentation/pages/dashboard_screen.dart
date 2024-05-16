import 'package:flutter/material.dart';
import 'package:hebauto/core/util/ext/widget.dart';


import 'package:hebauto/features_admin/dashboard/presentation/widgets/header.dart';
import 'package:hebauto/features_admin/dashboard/presentation/widgets/page_controller_provider.dart';

import '../widgets/page_view_list.dart';
import '../widgets/sidebar.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with AutomaticKeepAliveClientMixin {
  PageController controller = PageController();

  @override
  bool get wantKeepAlive => true;




  @override
  Widget build(BuildContext context) {

    super.build(context); // This is important!
    return PageControllerProvider(
      pageController: controller,
      child: Scaffold(
        body: Row(
          children: [
            const DashboardSideBar().expand(flex: 1),
            Column(
              children: [
                const Header(),


                PageView(
                  allowImplicitScrolling: false,
                  controller: controller,
                  onPageChanged: (val) {

                  },
                  children: list,
                ).expand(),
              ],
            ).expand(flex: 5)
          ],
        ),
      ),
    );
  }
}
