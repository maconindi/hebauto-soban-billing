class Accounts {
  // Named constructor to create an instance with default values
  Accounts.empty()
      : id = 0,
        parentId = 0,
        accountName = '',
        code = '';

  Accounts(this.id, this.parentId, this.accountName, this.code);

  factory Accounts.fromJson(Map<String, dynamic> json,
      {String name = 'accountName'}) {
    return Accounts(
      json['item_id'] ?? 0,
      json['parent_item_id'] ?? 0,
      json[name] ?? '',
      json['code'] ?? '',
    );
  }

  // Method to convert an instance of Accounts to JSON
  Map<String, dynamic> toJson({String name = 'accountName'}) {
    return {
      'id': id,
      'parentId': parentId,
      name: accountName,
      'code': code,
    };
  }

  final int id;
  final int parentId;
  final String accountName;
  final String code;
}

class Groups {
  Groups(
    this.id,
    this.parentId,
    this.groupName,
    this.groupType,
  );

  final int id;
  final int parentId;
  final String groupName;
  final String groupType;
}
