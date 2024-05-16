import 'package:flutter/material.dart';
import 'package:hebauto/features_admin/customer_profile/domain/entity/customer_entity.dart';
import 'package:hebauto/features_admin/admin_report/domain/entities/report_entitiy.dart';
import 'package:hebauto/features_admin/inventory/domain/entity/inventory_entity.dart';

class PageControllerProvider extends InheritedWidget {
  final PageController pageController;
  InventoryItemEntity? entity;
  CustomerEntity? user;
  ReportItemEntity? reportEntity;

  PageControllerProvider({
    super.key,
    required this.pageController,
    required Widget child,
    this.entity,
    this.user,
    this.reportEntity
  }) : super(child: child);


  static PageControllerProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PageControllerProvider>();
  }

  @override
  bool updateShouldNotify(PageControllerProvider oldWidget) {
    return pageController != oldWidget.pageController;
  }
}
