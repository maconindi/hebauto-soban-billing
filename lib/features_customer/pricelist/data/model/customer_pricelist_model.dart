
import 'package:hebauto/features_customer/pricelist/domain/entity/customer_pricelist_entity.dart';

import '../../../../core/util/common.dart';

class CustomerPriceListResponseModel extends CustomerPriceListResponseEntity {
  CustomerPriceListResponseModel({
    required super.item,
    required super.status,
    required super.message,
    required super.prePageUrl,
    required super.nextPageUrl,
    required super.firstPageUrl,
    required super.lastPageUrl,
    required super.currentPage,
    required super.lastPage,
  });

  factory CustomerPriceListResponseModel.fromJson(Map<String, dynamic> json) =>
      CustomerPriceListResponseModel(
        status: json['status'],
        message: json['message'],
        item: json['item'],
        prePageUrl: json['prev_page_url'] ?? '',
        nextPageUrl: json['next_page_url'] ?? '',
        firstPageUrl: json['first_page_url'] ?? '',
        lastPageUrl: json['last_page_url'] ?? '',
        currentPage: json['current_page'] ?? 0,
        lastPage: json['last_page'] ?? 0,
      );
}

class PriceListModel extends CustomerPriceListEntity {
  PriceListModel({
    required super.url,
    required super.cusId,
    required super.cusEmail,
    required super.cusCompany,
    required super.cusName,
    super.updatedAt,
    super.createdAt,
  });

  factory PriceListModel.fromJson(Map<String, dynamic> json) => PriceListModel(
        url: json['url'] ?? '',
        cusId: json['cus_id_fk'] ?? '',
        cusEmail: json['cus_email'] ?? '',
        cusName: json['cus_name'] ?? '',
        cusCompany: json['cus_company'] ?? '',

        updatedAt: formatDateTimeWithTime(json['updated_at']),
        createdAt: formatDateTimeWithTime(json['created_at']),

        // updatedAt: json['updated_at'] != null
        //     ? DateTime.parse(formatDateTimeWithTime(json['updated_at']))
        //     : null,
        // createdAt: json['created_at'] != null
        //     ? DateTime.parse(formatDateTimeWithTime(json['created_at']))
        //     : null,
      );
}
