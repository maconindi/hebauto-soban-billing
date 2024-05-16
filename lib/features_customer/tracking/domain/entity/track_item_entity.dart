
class TrackItemEntity {
  final String invoiceNo;
  final String invoiceUrl;
  final String cusId;
  final String cusEmail;
  final String inventId;
  final String auctionName;
  final String bookingNo;
  final String towingLocation;
  final String departurePort;
  final String offloadingPort;
  final String shipContainerNo;
  final String deliveryStatus;
  final DateTime? exptShippingDate;
  final DateTime? exptArrivalDate;
  final DateTime? actArrivalDate;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int id;
  final VehicleEntity? vehicle;
  final WarehouseEntity? warehouse;
  final PortEntity? port;
  final ShippingEntity? shipping;
  final TowingEntity? towing;
  final InvoiceEntity? invoice;
  final VccEntity? vcc;


  const TrackItemEntity({
    this.invoiceNo = '',
    this.invoiceUrl = '',
    this.cusId = '',
    this.cusEmail = '',
    this.inventId = '',
    this.auctionName = '',
    this.bookingNo = '',
    this.towingLocation = '',
    this.departurePort = '',
    this.offloadingPort = '',
    this.shipContainerNo = '',
    this.deliveryStatus = '',
    this.exptShippingDate,
    this.exptArrivalDate,
    this.actArrivalDate,
    this.updatedAt,
    this.createdAt,
    this.id = 0,
    this.vehicle,
    this.vcc,
    this.warehouse,
    this.port,
    this.shipping,
    this.towing,
    this.invoice,

  });
}

class VehicleEntity {
  final String name;
  final String vinNumber;
  final String lotNumber;
  final String year;
  final String color;
  final bool isKey;
  DateTime? updatedAt;
  DateTime? createdAt;
  final String inventId;
  final int id;
  final List<String> images;

  VehicleEntity({this.name = '',
    this.vinNumber = '',
    this.lotNumber = '',
    this.year = '',
    this.color = '',
    this.isKey = false,
    this.updatedAt,
    this.createdAt,
    this.inventId = '',
    this.id = 0,
    this.images = const []});
}

class InvoiceEntity {
  final int id;
  final String invoiceNumber;
  final String invoiceUrl;
  DateTime? invoiceDate;
  final String invoiceAmountCad;
  final String hstAmountCad;
  final String invoiceAmountAed;
  final String totalAmountAed;
  DateTime? updatedAt;
  DateTime? createdAt;
  final String inventIdFk;

  InvoiceEntity({this.id = 0,
    this.invoiceNumber = '',
    this.invoiceUrl = '',
    this.invoiceDate,
    this.invoiceAmountCad = '',
    this.hstAmountCad = '',
    this.invoiceAmountAed = '',
    this.totalAmountAed = '',
    this.updatedAt,
    this.createdAt,
    this.inventIdFk = ''});
}

class TowingEntity {
  final int id;
  final String departurePort;
  final String towingCity;
  final String towingCostAed;
  final String towingCostCad;
  DateTime? towingDate;
  DateTime? warehouseDeliveryDate;
  DateTime? updatedAt;
  DateTime? createdAt;
  final String inventIdFk;
  final List<String> images;

  TowingEntity({this.id = 0,
    this.departurePort = '',
    this.towingCity = '',
    this.towingCostAed = '',
    this.towingCostCad = '',
    this.towingDate,
    this.updatedAt,
    this.createdAt,
    this.warehouseDeliveryDate,
    this.inventIdFk = '',
    this.images = const []});
}

class ShippingEntity {
  final int id;
  final String containerNumber;
  final String bookingNumber;
  DateTime? expArrivalDate;
  DateTime? shippingDate;
  final String shippingCostAed;
  final String shippingCostCad;
  final String offLoadingPort;

  DateTime? updatedAt;
  DateTime? createdAt;
  final String inventIdFk;
  final List<String> images;

  ShippingEntity({this.id = 0,
    this.containerNumber = '',
    this.bookingNumber = '',
    this.expArrivalDate,
    this.shippingDate,
    this.shippingCostAed = '',
    this.shippingCostCad = '',
    this.offLoadingPort = '',
    this.updatedAt,
    this.createdAt,
    this.inventIdFk = '',
    this.images = const []});
}

class PortEntity {
  final int id;
  DateTime? arrivalDate;
  DateTime? clearanceDate;
  final String clearanceAmount;
  final String portWarehouseCostAed;
  final String vatAmountAed;
  final String customCostAed;
  DateTime? updatedAt;
  DateTime? createdAt;
  final String inventIdFk;
  final List<String> images;

  PortEntity({this.id = 0,
    this.arrivalDate,
    this.clearanceDate,
    this.customCostAed = '',
    this.vatAmountAed = '',
    this.clearanceAmount = '',
    this.portWarehouseCostAed = '',
    this.updatedAt,
    this.createdAt,
    this.inventIdFk = '',
    this.images = const []});
}

class WarehouseEntity {
  final int id;
  final String name;
  DateTime? arrivalDate;
  final String storageCost;
  DateTime? pickingDate;
  final String authorizedBy;
  DateTime? authorizedDate;
  final String pickedBy;
  DateTime? pickedDate;
  final String emiratesId;
  final String idUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  final String inventIdFk;
  final List<String> images;

  WarehouseEntity({this.id = 0,
    this.name = '',
    this.arrivalDate,
    this.storageCost = '',
    this.pickedDate,
    this.authorizedBy = '',
    this.authorizedDate,
    this.pickedBy = '',
    this.pickingDate,
    this.emiratesId = '',
    this.idUrl = '',
    this.createdAt,
    this.updatedAt,
    this.inventIdFk = '',
    this.images = const []});
}

class VccEntity {
  final int id;
  DateTime? receivedDate;
  final String url;
  DateTime? pickingDate;
  final String issuedBy;
  DateTime? issuedDate;
  final String pickedBy;
  DateTime? pickedDate;
  final String emiratesId;
  final String idUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  final String inventIdFk;

  VccEntity({
    this.id = 0,
    this.url = '',
    this.receivedDate,
    this.pickedDate,
    this.issuedBy = '',
    this.issuedDate,
    this.pickedBy = '',
    this.pickingDate,
    this.emiratesId = '',
    this.idUrl = '',
    this.createdAt,
    this.updatedAt,
    this.inventIdFk = '',
  });
}