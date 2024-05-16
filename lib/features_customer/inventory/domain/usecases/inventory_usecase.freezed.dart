// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InventoryParams _$InventoryParamsFromJson(Map<String, dynamic> json) {
  return _InventoryParams.fromJson(json);
}

/// @nodoc
mixin _$InventoryParams {
  @JsonKey(name: 'invent_id')
  String get inventId => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_no')
  String get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'cus_id')
  int get cusId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cus_email')
  String get cusEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_url')
  String get invoiceUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'auction_name')
  String get auctionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_no')
  String get bookingNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'towing_location')
  String get towingLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'departure_port')
  String get departurePort => throw _privateConstructorUsedError;
  @JsonKey(name: 'offloading_port')
  String get offloadingPort => throw _privateConstructorUsedError;
  @JsonKey(name: 'ship_container_no')
  String get shipContainerNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_status')
  String get deliveryStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'expt_shipping_date')
  String get exptShippingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expt_arrival_date')
  String get exptArrivalDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'act_arrival_date')
  String get actArrivalDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt =>
      throw _privateConstructorUsedError; // Additional fields
  @JsonKey(name: 'vehicle_name')
  String get vehicleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'vin_number')
  String get vinNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'lot_number')
  String get lotNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_key')
  bool get isKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryParamsCopyWith<InventoryParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryParamsCopyWith<$Res> {
  factory $InventoryParamsCopyWith(
          InventoryParams value, $Res Function(InventoryParams) then) =
      _$InventoryParamsCopyWithImpl<$Res, InventoryParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'invent_id') String inventId,
      @JsonKey(name: 'invoice_no') String invoiceNo,
      @JsonKey(name: 'cus_id') int cusId,
      @JsonKey(name: 'cus_email') String cusEmail,
      @JsonKey(name: 'invoice_url') String invoiceUrl,
      @JsonKey(name: 'auction_name') String auctionName,
      @JsonKey(name: 'booking_no') String bookingNo,
      @JsonKey(name: 'towing_location') String towingLocation,
      @JsonKey(name: 'departure_port') String departurePort,
      @JsonKey(name: 'offloading_port') String offloadingPort,
      @JsonKey(name: 'ship_container_no') String shipContainerNo,
      @JsonKey(name: 'delivery_status') String deliveryStatus,
      @JsonKey(name: 'expt_shipping_date') String exptShippingDate,
      @JsonKey(name: 'expt_arrival_date') String exptArrivalDate,
      @JsonKey(name: 'act_arrival_date') String actArrivalDate,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'vehicle_name') String vehicleName,
      @JsonKey(name: 'vin_number') String vinNumber,
      @JsonKey(name: 'lot_number') String lotNumber,
      @JsonKey(name: 'color') String color,
      @JsonKey(name: 'is_key') bool isKey});
}

/// @nodoc
class _$InventoryParamsCopyWithImpl<$Res, $Val extends InventoryParams>
    implements $InventoryParamsCopyWith<$Res> {
  _$InventoryParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inventId = null,
    Object? invoiceNo = null,
    Object? cusId = null,
    Object? cusEmail = null,
    Object? invoiceUrl = null,
    Object? auctionName = null,
    Object? bookingNo = null,
    Object? towingLocation = null,
    Object? departurePort = null,
    Object? offloadingPort = null,
    Object? shipContainerNo = null,
    Object? deliveryStatus = null,
    Object? exptShippingDate = null,
    Object? exptArrivalDate = null,
    Object? actArrivalDate = null,
    Object? updatedAt = null,
    Object? createdAt = null,
    Object? vehicleName = null,
    Object? vinNumber = null,
    Object? lotNumber = null,
    Object? color = null,
    Object? isKey = null,
  }) {
    return _then(_value.copyWith(
      inventId: null == inventId
          ? _value.inventId
          : inventId // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNo: null == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      cusId: null == cusId
          ? _value.cusId
          : cusId // ignore: cast_nullable_to_non_nullable
              as int,
      cusEmail: null == cusEmail
          ? _value.cusEmail
          : cusEmail // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceUrl: null == invoiceUrl
          ? _value.invoiceUrl
          : invoiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      auctionName: null == auctionName
          ? _value.auctionName
          : auctionName // ignore: cast_nullable_to_non_nullable
              as String,
      bookingNo: null == bookingNo
          ? _value.bookingNo
          : bookingNo // ignore: cast_nullable_to_non_nullable
              as String,
      towingLocation: null == towingLocation
          ? _value.towingLocation
          : towingLocation // ignore: cast_nullable_to_non_nullable
              as String,
      departurePort: null == departurePort
          ? _value.departurePort
          : departurePort // ignore: cast_nullable_to_non_nullable
              as String,
      offloadingPort: null == offloadingPort
          ? _value.offloadingPort
          : offloadingPort // ignore: cast_nullable_to_non_nullable
              as String,
      shipContainerNo: null == shipContainerNo
          ? _value.shipContainerNo
          : shipContainerNo // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryStatus: null == deliveryStatus
          ? _value.deliveryStatus
          : deliveryStatus // ignore: cast_nullable_to_non_nullable
              as String,
      exptShippingDate: null == exptShippingDate
          ? _value.exptShippingDate
          : exptShippingDate // ignore: cast_nullable_to_non_nullable
              as String,
      exptArrivalDate: null == exptArrivalDate
          ? _value.exptArrivalDate
          : exptArrivalDate // ignore: cast_nullable_to_non_nullable
              as String,
      actArrivalDate: null == actArrivalDate
          ? _value.actArrivalDate
          : actArrivalDate // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleName: null == vehicleName
          ? _value.vehicleName
          : vehicleName // ignore: cast_nullable_to_non_nullable
              as String,
      vinNumber: null == vinNumber
          ? _value.vinNumber
          : vinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lotNumber: null == lotNumber
          ? _value.lotNumber
          : lotNumber // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      isKey: null == isKey
          ? _value.isKey
          : isKey // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryParamsImplCopyWith<$Res>
    implements $InventoryParamsCopyWith<$Res> {
  factory _$$InventoryParamsImplCopyWith(_$InventoryParamsImpl value,
          $Res Function(_$InventoryParamsImpl) then) =
      __$$InventoryParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invent_id') String inventId,
      @JsonKey(name: 'invoice_no') String invoiceNo,
      @JsonKey(name: 'cus_id') int cusId,
      @JsonKey(name: 'cus_email') String cusEmail,
      @JsonKey(name: 'invoice_url') String invoiceUrl,
      @JsonKey(name: 'auction_name') String auctionName,
      @JsonKey(name: 'booking_no') String bookingNo,
      @JsonKey(name: 'towing_location') String towingLocation,
      @JsonKey(name: 'departure_port') String departurePort,
      @JsonKey(name: 'offloading_port') String offloadingPort,
      @JsonKey(name: 'ship_container_no') String shipContainerNo,
      @JsonKey(name: 'delivery_status') String deliveryStatus,
      @JsonKey(name: 'expt_shipping_date') String exptShippingDate,
      @JsonKey(name: 'expt_arrival_date') String exptArrivalDate,
      @JsonKey(name: 'act_arrival_date') String actArrivalDate,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'vehicle_name') String vehicleName,
      @JsonKey(name: 'vin_number') String vinNumber,
      @JsonKey(name: 'lot_number') String lotNumber,
      @JsonKey(name: 'color') String color,
      @JsonKey(name: 'is_key') bool isKey});
}

/// @nodoc
class __$$InventoryParamsImplCopyWithImpl<$Res>
    extends _$InventoryParamsCopyWithImpl<$Res, _$InventoryParamsImpl>
    implements _$$InventoryParamsImplCopyWith<$Res> {
  __$$InventoryParamsImplCopyWithImpl(
      _$InventoryParamsImpl _value, $Res Function(_$InventoryParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inventId = null,
    Object? invoiceNo = null,
    Object? cusId = null,
    Object? cusEmail = null,
    Object? invoiceUrl = null,
    Object? auctionName = null,
    Object? bookingNo = null,
    Object? towingLocation = null,
    Object? departurePort = null,
    Object? offloadingPort = null,
    Object? shipContainerNo = null,
    Object? deliveryStatus = null,
    Object? exptShippingDate = null,
    Object? exptArrivalDate = null,
    Object? actArrivalDate = null,
    Object? updatedAt = null,
    Object? createdAt = null,
    Object? vehicleName = null,
    Object? vinNumber = null,
    Object? lotNumber = null,
    Object? color = null,
    Object? isKey = null,
  }) {
    return _then(_$InventoryParamsImpl(
      inventId: null == inventId
          ? _value.inventId
          : inventId // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNo: null == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      cusId: null == cusId
          ? _value.cusId
          : cusId // ignore: cast_nullable_to_non_nullable
              as int,
      cusEmail: null == cusEmail
          ? _value.cusEmail
          : cusEmail // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceUrl: null == invoiceUrl
          ? _value.invoiceUrl
          : invoiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      auctionName: null == auctionName
          ? _value.auctionName
          : auctionName // ignore: cast_nullable_to_non_nullable
              as String,
      bookingNo: null == bookingNo
          ? _value.bookingNo
          : bookingNo // ignore: cast_nullable_to_non_nullable
              as String,
      towingLocation: null == towingLocation
          ? _value.towingLocation
          : towingLocation // ignore: cast_nullable_to_non_nullable
              as String,
      departurePort: null == departurePort
          ? _value.departurePort
          : departurePort // ignore: cast_nullable_to_non_nullable
              as String,
      offloadingPort: null == offloadingPort
          ? _value.offloadingPort
          : offloadingPort // ignore: cast_nullable_to_non_nullable
              as String,
      shipContainerNo: null == shipContainerNo
          ? _value.shipContainerNo
          : shipContainerNo // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryStatus: null == deliveryStatus
          ? _value.deliveryStatus
          : deliveryStatus // ignore: cast_nullable_to_non_nullable
              as String,
      exptShippingDate: null == exptShippingDate
          ? _value.exptShippingDate
          : exptShippingDate // ignore: cast_nullable_to_non_nullable
              as String,
      exptArrivalDate: null == exptArrivalDate
          ? _value.exptArrivalDate
          : exptArrivalDate // ignore: cast_nullable_to_non_nullable
              as String,
      actArrivalDate: null == actArrivalDate
          ? _value.actArrivalDate
          : actArrivalDate // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleName: null == vehicleName
          ? _value.vehicleName
          : vehicleName // ignore: cast_nullable_to_non_nullable
              as String,
      vinNumber: null == vinNumber
          ? _value.vinNumber
          : vinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lotNumber: null == lotNumber
          ? _value.lotNumber
          : lotNumber // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      isKey: null == isKey
          ? _value.isKey
          : isKey // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryParamsImpl implements _InventoryParams {
  const _$InventoryParamsImpl(
      {@JsonKey(name: 'invent_id') this.inventId = '',
      @JsonKey(name: 'invoice_no') this.invoiceNo = '',
      @JsonKey(name: 'cus_id') this.cusId = 0,
      @JsonKey(name: 'cus_email') this.cusEmail = '',
      @JsonKey(name: 'invoice_url') this.invoiceUrl = '',
      @JsonKey(name: 'auction_name') this.auctionName = '',
      @JsonKey(name: 'booking_no') this.bookingNo = '',
      @JsonKey(name: 'towing_location') this.towingLocation = '',
      @JsonKey(name: 'departure_port') this.departurePort = '',
      @JsonKey(name: 'offloading_port') this.offloadingPort = '',
      @JsonKey(name: 'ship_container_no') this.shipContainerNo = '',
      @JsonKey(name: 'delivery_status') this.deliveryStatus = '',
      @JsonKey(name: 'expt_shipping_date') this.exptShippingDate = '',
      @JsonKey(name: 'expt_arrival_date') this.exptArrivalDate = '',
      @JsonKey(name: 'act_arrival_date') this.actArrivalDate = '',
      @JsonKey(name: 'updated_at') this.updatedAt = '',
      @JsonKey(name: 'created_at') this.createdAt = '',
      @JsonKey(name: 'vehicle_name') this.vehicleName = '',
      @JsonKey(name: 'vin_number') this.vinNumber = '',
      @JsonKey(name: 'lot_number') this.lotNumber = '',
      @JsonKey(name: 'color') this.color = '',
      @JsonKey(name: 'is_key') this.isKey = false});

  factory _$InventoryParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryParamsImplFromJson(json);

  @override
  @JsonKey(name: 'invent_id')
  final String inventId;
  @override
  @JsonKey(name: 'invoice_no')
  final String invoiceNo;
  @override
  @JsonKey(name: 'cus_id')
  final int cusId;
  @override
  @JsonKey(name: 'cus_email')
  final String cusEmail;
  @override
  @JsonKey(name: 'invoice_url')
  final String invoiceUrl;
  @override
  @JsonKey(name: 'auction_name')
  final String auctionName;
  @override
  @JsonKey(name: 'booking_no')
  final String bookingNo;
  @override
  @JsonKey(name: 'towing_location')
  final String towingLocation;
  @override
  @JsonKey(name: 'departure_port')
  final String departurePort;
  @override
  @JsonKey(name: 'offloading_port')
  final String offloadingPort;
  @override
  @JsonKey(name: 'ship_container_no')
  final String shipContainerNo;
  @override
  @JsonKey(name: 'delivery_status')
  final String deliveryStatus;
  @override
  @JsonKey(name: 'expt_shipping_date')
  final String exptShippingDate;
  @override
  @JsonKey(name: 'expt_arrival_date')
  final String exptArrivalDate;
  @override
  @JsonKey(name: 'act_arrival_date')
  final String actArrivalDate;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
// Additional fields
  @override
  @JsonKey(name: 'vehicle_name')
  final String vehicleName;
  @override
  @JsonKey(name: 'vin_number')
  final String vinNumber;
  @override
  @JsonKey(name: 'lot_number')
  final String lotNumber;
  @override
  @JsonKey(name: 'color')
  final String color;
  @override
  @JsonKey(name: 'is_key')
  final bool isKey;

  @override
  String toString() {
    return 'InventoryParams(inventId: $inventId, invoiceNo: $invoiceNo, cusId: $cusId, cusEmail: $cusEmail, invoiceUrl: $invoiceUrl, auctionName: $auctionName, bookingNo: $bookingNo, towingLocation: $towingLocation, departurePort: $departurePort, offloadingPort: $offloadingPort, shipContainerNo: $shipContainerNo, deliveryStatus: $deliveryStatus, exptShippingDate: $exptShippingDate, exptArrivalDate: $exptArrivalDate, actArrivalDate: $actArrivalDate, updatedAt: $updatedAt, createdAt: $createdAt, vehicleName: $vehicleName, vinNumber: $vinNumber, lotNumber: $lotNumber, color: $color, isKey: $isKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryParamsImpl &&
            (identical(other.inventId, inventId) ||
                other.inventId == inventId) &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.cusId, cusId) || other.cusId == cusId) &&
            (identical(other.cusEmail, cusEmail) ||
                other.cusEmail == cusEmail) &&
            (identical(other.invoiceUrl, invoiceUrl) ||
                other.invoiceUrl == invoiceUrl) &&
            (identical(other.auctionName, auctionName) ||
                other.auctionName == auctionName) &&
            (identical(other.bookingNo, bookingNo) ||
                other.bookingNo == bookingNo) &&
            (identical(other.towingLocation, towingLocation) ||
                other.towingLocation == towingLocation) &&
            (identical(other.departurePort, departurePort) ||
                other.departurePort == departurePort) &&
            (identical(other.offloadingPort, offloadingPort) ||
                other.offloadingPort == offloadingPort) &&
            (identical(other.shipContainerNo, shipContainerNo) ||
                other.shipContainerNo == shipContainerNo) &&
            (identical(other.deliveryStatus, deliveryStatus) ||
                other.deliveryStatus == deliveryStatus) &&
            (identical(other.exptShippingDate, exptShippingDate) ||
                other.exptShippingDate == exptShippingDate) &&
            (identical(other.exptArrivalDate, exptArrivalDate) ||
                other.exptArrivalDate == exptArrivalDate) &&
            (identical(other.actArrivalDate, actArrivalDate) ||
                other.actArrivalDate == actArrivalDate) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.vehicleName, vehicleName) ||
                other.vehicleName == vehicleName) &&
            (identical(other.vinNumber, vinNumber) ||
                other.vinNumber == vinNumber) &&
            (identical(other.lotNumber, lotNumber) ||
                other.lotNumber == lotNumber) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isKey, isKey) || other.isKey == isKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        inventId,
        invoiceNo,
        cusId,
        cusEmail,
        invoiceUrl,
        auctionName,
        bookingNo,
        towingLocation,
        departurePort,
        offloadingPort,
        shipContainerNo,
        deliveryStatus,
        exptShippingDate,
        exptArrivalDate,
        actArrivalDate,
        updatedAt,
        createdAt,
        vehicleName,
        vinNumber,
        lotNumber,
        color,
        isKey
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryParamsImplCopyWith<_$InventoryParamsImpl> get copyWith =>
      __$$InventoryParamsImplCopyWithImpl<_$InventoryParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryParamsImplToJson(
      this,
    );
  }
}

abstract class _InventoryParams implements InventoryParams {
  const factory _InventoryParams(
      {@JsonKey(name: 'invent_id') final String inventId,
      @JsonKey(name: 'invoice_no') final String invoiceNo,
      @JsonKey(name: 'cus_id') final int cusId,
      @JsonKey(name: 'cus_email') final String cusEmail,
      @JsonKey(name: 'invoice_url') final String invoiceUrl,
      @JsonKey(name: 'auction_name') final String auctionName,
      @JsonKey(name: 'booking_no') final String bookingNo,
      @JsonKey(name: 'towing_location') final String towingLocation,
      @JsonKey(name: 'departure_port') final String departurePort,
      @JsonKey(name: 'offloading_port') final String offloadingPort,
      @JsonKey(name: 'ship_container_no') final String shipContainerNo,
      @JsonKey(name: 'delivery_status') final String deliveryStatus,
      @JsonKey(name: 'expt_shipping_date') final String exptShippingDate,
      @JsonKey(name: 'expt_arrival_date') final String exptArrivalDate,
      @JsonKey(name: 'act_arrival_date') final String actArrivalDate,
      @JsonKey(name: 'updated_at') final String updatedAt,
      @JsonKey(name: 'created_at') final String createdAt,
      @JsonKey(name: 'vehicle_name') final String vehicleName,
      @JsonKey(name: 'vin_number') final String vinNumber,
      @JsonKey(name: 'lot_number') final String lotNumber,
      @JsonKey(name: 'color') final String color,
      @JsonKey(name: 'is_key') final bool isKey}) = _$InventoryParamsImpl;

  factory _InventoryParams.fromJson(Map<String, dynamic> json) =
      _$InventoryParamsImpl.fromJson;

  @override
  @JsonKey(name: 'invent_id')
  String get inventId;
  @override
  @JsonKey(name: 'invoice_no')
  String get invoiceNo;
  @override
  @JsonKey(name: 'cus_id')
  int get cusId;
  @override
  @JsonKey(name: 'cus_email')
  String get cusEmail;
  @override
  @JsonKey(name: 'invoice_url')
  String get invoiceUrl;
  @override
  @JsonKey(name: 'auction_name')
  String get auctionName;
  @override
  @JsonKey(name: 'booking_no')
  String get bookingNo;
  @override
  @JsonKey(name: 'towing_location')
  String get towingLocation;
  @override
  @JsonKey(name: 'departure_port')
  String get departurePort;
  @override
  @JsonKey(name: 'offloading_port')
  String get offloadingPort;
  @override
  @JsonKey(name: 'ship_container_no')
  String get shipContainerNo;
  @override
  @JsonKey(name: 'delivery_status')
  String get deliveryStatus;
  @override
  @JsonKey(name: 'expt_shipping_date')
  String get exptShippingDate;
  @override
  @JsonKey(name: 'expt_arrival_date')
  String get exptArrivalDate;
  @override
  @JsonKey(name: 'act_arrival_date')
  String get actArrivalDate;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override // Additional fields
  @JsonKey(name: 'vehicle_name')
  String get vehicleName;
  @override
  @JsonKey(name: 'vin_number')
  String get vinNumber;
  @override
  @JsonKey(name: 'lot_number')
  String get lotNumber;
  @override
  @JsonKey(name: 'color')
  String get color;
  @override
  @JsonKey(name: 'is_key')
  bool get isKey;
  @override
  @JsonKey(ignore: true)
  _$$InventoryParamsImplCopyWith<_$InventoryParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
