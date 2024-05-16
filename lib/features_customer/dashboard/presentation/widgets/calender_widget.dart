import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../core/util/config.dart';
import '../../../../core/util/decorations.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({
    super.key,
    this.isMobile = false

  });
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMobile ? 200: 400,
      clipBehavior: Clip.hardEdge,
      decoration: boxDecorationRoundedWithShadow(
        defaultItemsRadius.toInt(),
      ),
      child: SfCalendar(

        view:isMobile ? CalendarView.month: CalendarView.month,
      ),
    );
  }
}