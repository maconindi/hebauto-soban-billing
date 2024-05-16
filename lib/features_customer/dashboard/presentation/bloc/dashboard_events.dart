import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CustomerDashboardEventX extends Equatable {

  @override
  List<Object> get props => [];
}


class DashboardStatsEvent extends CustomerDashboardEventX{

  DashboardStatsEvent();
  @override
  List<Object> get props => [];
}

class DashboardChangeScreenEvent extends CustomerDashboardEventX{
  DashboardChangeScreenEvent(this.currentScreen);

  final Widget currentScreen;
  @override
  List<Object> get props => [];
}


class DashboardResetEvent extends CustomerDashboardEventX{
  DashboardResetEvent();


  @override
  List<Object> get props => [];
}