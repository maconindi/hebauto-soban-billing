class ChartOfAccountsEntity {
  const ChartOfAccountsEntity(
      {required this.itemId,required this.name,required this.code,required this.parentItemId,required this.level});

  final int itemId;
  final String name;
  final String code;
  final int parentItemId;
  final int level;
}
