import 'package:hebauto/core/util/ext/ext.dart';

import '../../domain/entity/track_item_entity.dart';

class TrackItemModel extends TrackItemEntity {
  TrackItemModel({
    super.invoiceNo,
    super.invoiceUrl,
    super.cusId,
    super.cusEmail,
    super.inventId,
    super.auctionName,
    super.bookingNo,
    super.towingLocation,
    super.departurePort,
    super.offloadingPort,
    super.shipContainerNo,
    super.deliveryStatus,
    super.exptShippingDate,
    super.exptArrivalDate,
    super.actArrivalDate,
    super.updatedAt,
    super.createdAt,
    super.id,
    super.vehicle,
    super.invoice,
    super.shipping,
    super.towing,
    super.port,
    super.vcc,
    super.warehouse,
  });

  factory TrackItemModel.fromJson(Map<String, dynamic> json) => TrackItemModel(
    invoiceNo: json['invoice_no'] ?? '',
    invoiceUrl: json['invoice_url'] ?? '',
    cusId: json['cus_id_fk'] ?? '',
    cusEmail: json['cus_email'] ?? '',
    inventId: json['invent_id'] ?? '',
    updatedAt: json['updated_at'] != null
        ? DateTime.parse(json['updated_at'])
        : null,
    createdAt: json['created_at'] != null
        ? DateTime.parse(json['created_at'])
        : null,
    id: json['id'] ?? 0,
    vehicle: json['vehicle'] != null
        ? VehicleModel.fromJson(
      json['vehicle'],
      (json['images'] as List<dynamic>? ?? [])
          .where((imageData) => imageData['category'] == 'vehicle')
          .map<String>((imageData) => imageData['url'] ?? '')
          .toList(),
    )
        : VehicleModel(),
    invoice: json['invoice'] != null
        ? InvoiceModel.fromJson(json['invoice'])
        : InvoiceModel(),
    shipping: json['shipping'] != null
        ? ShippingModel.fromJson(
      json['shipping'],
      (json['images'] as List<dynamic>? ?? [])
          .where((imageData) => imageData['category'] == 'shipping')
          .map<String>((imageData) => imageData['url'] ?? '')
          .toList(),
    )
        : ShippingModel(),
    towing: json['towing'] != null
        ? TowingModel.fromJson(
      json['towing'],
      (json['images'] as List<dynamic>? ?? [])
          .where((imageData) => imageData['category'] == 'towing')
          .map<String>((imageData) => imageData['url'] ?? '')
          .toList(),
    )
        : TowingModel(),
    port: json['port'] != null
        ? PortModel.fromJson(
      json['port'],
      (json['images'] as List<dynamic>? ?? [])
          .where((imageData) => imageData['category'] == 'port')
          .map<String>((imageData) => imageData['url'] ?? '')
          .toList(),
    )
        : PortModel(),
    vcc: json['vcc'] != null
        ? VccModel.fromJson(
      json['vcc'],
      (json['images'] as List<dynamic>? ?? [])
          .where((imageData) => imageData['category'] == 'vcc')
          .map<String>((imageData) => imageData['url'] ?? '')
          .toList(),
    )
        : VccModel(),
    warehouse: json['warehouse'] != null
        ? WarehouseModel.fromJson(
      json['warehouse'],
      (json['images'] as List<dynamic>? ?? [])
          .where((imageData) => imageData['category'] == 'warehouse')
          .map<String>((imageData) => imageData['url'] ?? '')
          .toList(),
    )
        : WarehouseModel(),
  );
}

class VehicleModel extends VehicleEntity {
  VehicleModel(
      {super.name,
        super.vinNumber,
        super.lotNumber,
        super.year,
        super.color,
        super.isKey,
        super.updatedAt,
        super.createdAt,
        super.inventId,
        super.id,
        super.images});

  factory VehicleModel.fromJson(
      Map<String, dynamic> json, List<String> images) =>
      VehicleModel(
          name: json['name'] ?? '',
          vinNumber: json['vin_number'] ?? '',
          lotNumber: json['lot_number'] ?? '',
          year: json['year'] ?? '',
          color: json['color'] ?? '',
          isKey: json['is_key'].toString().getBoolInt(),
          updatedAt: json['updated_at'] != null
              ? DateTime.parse(json['updated_at'])
              : null,
          createdAt: json['created_at'] != null
              ? DateTime.parse(json['created_at'])
              : null,
          inventId: json['invent_id_fk'] ?? '',
          id: json['id'] ?? 0,
          images: images);
}

class InvoiceModel extends InvoiceEntity {
  InvoiceModel({
    super.id,
    super.invoiceNumber,
    super.invoiceUrl,
    super.invoiceDate,
    super.invoiceAmountCad,
    super.hstAmountCad,
    super.invoiceAmountAed,
    super.totalAmountAed,
    super.updatedAt,
    super.createdAt,
    super.inventIdFk,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
    id: json['id'] ?? 0,
    invoiceNumber: json['invoice_no'] ?? '',
    invoiceUrl: json['invoice_url'] ?? '',
    invoiceDate: json['invoice_date'] != null
        ? DateTime.parse(json['invoice_date'])
        : null,
    invoiceAmountCad: json['invoice_amount_cad'] ?? '',
    hstAmountCad: json['hst_amount_cad'] ?? '',
    invoiceAmountAed: json['invoice_amount_aed'] ?? '',
    totalAmountAed: json['total_amount_aed'] ?? '',
    updatedAt: json['updated_at'] != null
        ? DateTime.parse(json['updated_at'])
        : null,
    createdAt: json['created_at'] != null
        ? DateTime.parse(json['created_at'])
        : null,
    inventIdFk: json['invent_id_fk'] ?? '',
  );
}

class TowingModel extends TowingEntity {
  TowingModel(
      {super.id,
        super.departurePort,
        super.towingCity,
        super.towingCostAed,
        super.towingCostCad,
        super.towingDate,
        super.updatedAt,
        super.createdAt,
        super.warehouseDeliveryDate,
        super.inventIdFk,
        super.images});

  factory TowingModel.fromJson(
      Map<String, dynamic> json, List<String> images) =>
      TowingModel(
          id: json['id'] ?? 0,
          departurePort: json['departure_port'] ?? '',
          towingCity: json['towing_city'] ?? '',
          towingCostAed: json['towing_cost_aed'] ?? '',
          towingCostCad: json['towing_cost_cad'] ?? '',
          towingDate: json['towing_date'] != null
              ? DateTime.parse(json['towing_date'])
              : null,
          warehouseDeliveryDate: json['warehouse_delivery_date'] != null
              ? DateTime.parse(json['warehouse_delivery_date'])
              : null,
          updatedAt: json['updated_at'] != null
              ? DateTime.parse(json['updated_at'])
              : null,
          createdAt: json['created_at'] != null
              ? DateTime.parse(json['created_at'])
              : null,
          inventIdFk: json['invent_id_fk'] ?? '',
          images: images);
}

class ShippingModel extends ShippingEntity {
  ShippingModel(
      {super.id,
        super.containerNumber,
        super.bookingNumber,
        super.expArrivalDate,
        super.shippingDate,
        super.shippingCostAed,
        super.shippingCostCad,
        super.offLoadingPort,
        super.updatedAt,
        super.createdAt,
        super.inventIdFk,
        super.images});

  factory ShippingModel.fromJson(
      Map<String, dynamic> json, List<String> images) =>
      ShippingModel(
          id: json['id'] ?? 0,
          containerNumber: json['container_no'] ?? '',
          bookingNumber: json['booking_no'] ?? '',
          expArrivalDate: json['exp_arrival_date'] != null
              ? DateTime.parse(json['exp_arrival_date'])
              : null,
          shippingDate: json['shipping_date'] != null
              ? DateTime.parse(json['shipping_date'])
              : null,
          shippingCostAed: json['shipping_cost_aed'] ?? '',
          shippingCostCad: json['shipping_cost_cad'] ?? '',
          offLoadingPort: json['off_loading_port'] ?? '',
          updatedAt: json['updated_at'] != null
              ? DateTime.parse(json['updated_at'])
              : null,
          createdAt: json['created_at'] != null
              ? DateTime.parse(json['created_at'])
              : null,
          inventIdFk: json['invent_id_fk'] ?? '',
          images: images);
}

class PortModel extends PortEntity {
  PortModel(
      {super.id,
        super.arrivalDate,
        super.clearanceDate,
        super.customCostAed,
        super.vatAmountAed,
        super.clearanceAmount,
        super.portWarehouseCostAed,
        super.updatedAt,
        super.createdAt,
        super.inventIdFk,
        super.images});

  factory PortModel.fromJson(Map<String, dynamic> json, List<String> images) =>
      PortModel(
        id: json['id'] ?? 0,
        arrivalDate: json['arrival_date'] != null
            ? DateTime.parse(json['port_arrival_date'])
            : null,
        clearanceDate: json['clearance_date'] != null
            ? DateTime.parse(json['clearance_date'])
            : null,
        customCostAed: json['custom_cost_aed'] ?? '',
        portWarehouseCostAed: json['port_warehouse_cost'] ?? '',
        vatAmountAed: json['vat_amount_aed'] ?? '',
        clearanceAmount: json['clearance_amount'] ?? '',
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'])
            : null,
        inventIdFk: json['invent_id_fk'] ?? '',
        images: images,
      );
}

class WarehouseModel extends WarehouseEntity {
  WarehouseModel(
      {super.id,
        super.name,
        super.arrivalDate,
        super.storageCost,
        super.pickingDate,
        super.authorizedBy,
        super.authorizedDate,
        super.pickedBy,
        super.pickedDate,
        super.emiratesId,
        super.idUrl,
        super.createdAt,
        super.updatedAt,
        super.inventIdFk,
        super.images});

  factory WarehouseModel.fromJson(
      Map<String, dynamic> json, List<String> images) =>
      WarehouseModel(
        id: json['id'] ?? 0,
        name: json['warehouse_name'] ?? '',
        arrivalDate: json['warehouse_arrival_date'] != null
            ? DateTime.parse(json['arrival_date'])
            : null,
        storageCost: json['storage_cost'] ?? '',
        pickingDate: json['picking_date'] != null
            ? DateTime.parse(json['picking_date'])
            : null,
        authorizedBy: json['authorized_by'] ?? '',
        authorizedDate: json['authorized_date'] != null
            ? DateTime.parse(json['authorized_date'])
            : null,
        pickedBy: json['w_picked_by'] ?? '',
        pickedDate: json['w_picked_date'] != null
            ? DateTime.parse(json['picked_date'])
            : null,
        emiratesId: json['emirates_id'] ?? '',
        idUrl: json['id_url'] ?? '',
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null,
        inventIdFk: json['invent_id_fk'] ?? '',
        images: images,
      );
}

class VccModel extends VccEntity {
  VccModel({
    super.id,
    super.receivedDate,
    super.url,
    // super.pickingDate,
    super.issuedBy,
    super.issuedDate,
    super.pickedBy,
    super.pickedDate,
    super.emiratesId,
    super.idUrl,
    super.createdAt,
    super.updatedAt,
    super.inventIdFk,
  });

  factory VccModel.fromJson(Map<String, dynamic> json, List<String> images) =>
      VccModel(
        id: json['id'] ?? 0,
        receivedDate: json['received_date'] != null
            ? DateTime.parse(json['received_date'])
            : null,
        url: json['url'] ?? '',
        // pickingDate: json["picking_date"] != null
        //     ? DateTime.parse(json["picking_date"])
        //     : null,
        issuedBy: json['issued_by'] ?? '',
        issuedDate: json['issued_date'] != null
            ? DateTime.parse(json['issued_date'])
            : null,
        pickedBy: json['picked_by'] ?? '',
        pickedDate: json['picked_date'] != null
            ? DateTime.parse(json['picked_date'])
            : null,
        emiratesId: json['emirates_id'] ?? '',
        idUrl: json['id_url'] ?? '',
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null,
        inventIdFk: json['invent_id_fk'] ?? '',
      );
}