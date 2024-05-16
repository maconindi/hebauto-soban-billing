import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BillingDashboardEventX extends Equatable {

  @override
  List<Object> get props => [];
}




class DashboardChangeScreenEvent extends BillingDashboardEventX{
  DashboardChangeScreenEvent(this.currentScreen);

  final Widget currentScreen;
  @override
  List<Object> get props => [];
}


class DashboardResetEvent extends BillingDashboardEventX{
  DashboardResetEvent();


  @override
  List<Object> get props => [];
}