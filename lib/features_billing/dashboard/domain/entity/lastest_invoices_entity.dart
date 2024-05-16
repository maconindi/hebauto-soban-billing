class LatestInvoiceEntity {

  // Constructor
  LatestInvoiceEntity({
    required this.invoiceId,
    required this.status,
    required this.amount,
    required this.carDetails,
    required this.customerName,
    required this.billingDate,
  });
  String invoiceId;
  String status;
  double amount;
  String carDetails;
  String customerName;
  String billingDate;
}



