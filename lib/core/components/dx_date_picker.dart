import 'package:flutter/material.dart';

void showDxDatePicker(
     BuildContext context,{
      required Function(DateTime, String) onDateSelected}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.utc(2030),
  );
  if (picked != null) {
    onDateSelected(picked, '${picked.year}-${picked.month}-${picked.day}');
  }
}