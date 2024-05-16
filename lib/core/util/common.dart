import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import 'ext/context.dart';


// Enum for predefined custom date formats
enum CustomDateFormat {
  shortDate,
  longDate,
  time,
  // Add more formats here as needed
}

final log = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    lineLength: 110,
  ),
);


String getCategorySearchParam(String query){
    if(query == 'Name & Model'){
      return 'name';
    }
    else if(query == 'Booking No'){
      return 'booking_no';
    }
    else if(query == 'Container No'){
      return 'container_no';
    }
    else if(query == 'Vin Number'){
      return 'vin_number';
    }
    else if(query == 'Lot Number'){
      return 'lot_number';
    }
    else{
      return '';
    }
}


String formatDateTime(DateTime dateTime,  {CustomDateFormat format = CustomDateFormat.shortDate}) {

  if(dateTime.isAtSameMomentAs(DateTime(0))){
    return 'N/A';
  }

  //debugPrint('>> ${dateTime.toString()}');
  switch (format) {
    case CustomDateFormat.shortDate:
      return DateFormat('MM/dd/yyyy').format(dateTime);
    case CustomDateFormat.longDate:
      return DateFormat('EEEE, MMMM dd, yyyy').format(dateTime);
    case CustomDateFormat.time:
      return DateFormat('h:mm a').format(dateTime);
  // Add more cases for additional formats
    default:
      return DateFormat('MM/dd/yyyy').format(dateTime);
  }
}


String formatDateTimeWithTime (String inputDateTimeString){

  try {
    List<String> dateTimeComponents = inputDateTimeString.split('T');
    String dateComponent = dateTimeComponents[0];
    String timeComponent = dateTimeComponents[1].substring(0, 8); // Extract only the time portion

    // Parse date and time components and create a DateTime object
    List<String> dateParts = dateComponent.split('-');
    List<String> timeParts = timeComponent.split(':');
    DateTime dateTime = DateTime(
      int.parse(dateParts[0]),
      int.parse(dateParts[1]),
      int.parse(dateParts[2]),
      int.parse(timeParts[0]),
      int.parse(timeParts[1]),
      int.parse(timeParts[2]),
    );

    DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm:ss');

    // Format the DateTime object using the defined formatter
    return formatter.format(dateTime);
  } on Exception catch (e) {
    return '';
  }
}

String formatIndex(int number) {

  return number.toString().padLeft(3, '0');
}


bool hasMatch(String? s, String p) {
  return (s == null) ? false : RegExp(p).hasMatch(s);
}


EdgeInsets dynamicAppButtonPadding(BuildContext context) {
  if (context.isDesktop()) {
    return const EdgeInsets.symmetric(vertical: 20, horizontal: 20);
  } else if (context.isTablet()) {
    return const EdgeInsets.symmetric(vertical: 16, horizontal: 16);
  } else {
    return const EdgeInsets.symmetric(vertical: 14, horizontal: 16);
  }
}

/// Returns a string from Clipboard
Future<String> paste() async {
  ClipboardData? data = await Clipboard.getData('text/plain');
  return data?.text?.toString() ?? '';
}
/// Hide soft keyboard
void hideKeyboard(context) => FocusScope.of(context).requestFocus(FocusNode());
