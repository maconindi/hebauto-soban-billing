


class PaginatedModel {
  final bool status;
  final Data data;

  PaginatedModel({
    this.status = false,
    required this.data,
  });

  factory PaginatedModel.fromJson(Map<String, dynamic> json,
      {required String entityName}) => PaginatedModel(
    status: json['status'],
    data: json[entityName] != null ? Data.fromJson(json[entityName]) : Data(),
  );


}

class Data {
  final int currentPage;
  final List<dynamic> dataList;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String nextPageUrl;
  final String path;
  final int perPage;
  final String prevPageUrl;
  final int to;
  final int total;

  Data({
    this.currentPage = 0,
    this.dataList = const [],
    this.firstPageUrl = '',
    this.from = 0,
    this.lastPage = 0,
    this.lastPageUrl = '',
    this.links  = const [],
    this.nextPageUrl = '',
    this.path = '',
    this.perPage = 0,
    this.prevPageUrl = '',
    this.to = 0,
    this.total = 0,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json['current_page'] ?? 0,
    dataList: json['data'] ?? [],
    firstPageUrl: json['first_page_url'] ?? '',
    from: json['from'] ?? 0,
    lastPage: json['last_page'] ?? 0,
    lastPageUrl: json['last_page_url'] ?? '',
    links: List<Link>.from(json['links'].map((x) => Link.fromJson(x))),
    nextPageUrl: json['next_page_url'] ?? '',
    path: json['path'] ?? '',
    perPage: json['per_page'] ?? 0,
    prevPageUrl: json['prev_page_url'] ?? '',
    to: json['to'] ?? 0,
    total: json['total'] ?? 0,
  );


}

// class Datum {
//   final int id;
//   final String name;
//   final String email;
//   final String phone;
//
//   final String tradingLicense;
//   final String companyName;
//   final DateTime? updatedAt;
//   final DateTime? createdAt;
//
//   Datum({
//     this.id = 0,
//     this.name = '',
//     this.email = '',
//     this.phone = '',
//
//     this.tradingLicense = '',
//     this.companyName = '',
//     this.updatedAt,
//     this.createdAt ,
//   });
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["id"] ?? 0,
//     name: json["name"] ?? '',
//     email: json["email"] ?? '',
//     phone: json["phone"] ?? '',
//
//     tradingLicense: json["trading_license"] ?? '',
//     companyName: json["company_name"] ?? '',
//     updatedAt: DateTime.parse(json["updated_at"]),
//     createdAt: DateTime.parse(json["created_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "email": email,
//     "phone": phone,
//
//     "trading_license": tradingLicense,
//     "company_name": companyName,
//     "updated_at": updatedAt?.toIso8601String(),
//     "created_at": createdAt?.toIso8601String(),
//   };
//
// }

class Link {
  final String url;
  final String label;
  final bool active;

  Link({
    this.url = '',
    this.label = '',
    this.active = false,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json['url'] ?? '',
    label: json['label'] ?? '',
    active: json['active'] ?? false,
  );

}
