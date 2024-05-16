
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../repository/customer_profile_repository.dart';


part 'customer_profile_usecase.freezed.dart';
part 'customer_profile_usecase.g.dart';



@injectable
class CustomerProfileUseCase {
  CustomerProfileUseCase(this.repository);
  CustomerProfileRepository repository;


}




@freezed
class CustomerParams with _$CustomerParams {
  const factory CustomerParams({
    @JsonKey(name: 'cus_id')
    @Default('') String cusId,
    @Default('') String name,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String country,
    @JsonKey(name: 'company_address')
    @Default('') String address,
    @JsonKey(name: 'trading_license_no')
    @Default('') String tradingLicenseNumber,
    @Default('') String password,
    @JsonKey(name: 'company_name')
    @Default('') String companyName,
  }) = _CustomerParams;

  factory CustomerParams.fromJson(Map<String, dynamic> json) =>
      _$CustomerParamsFromJson(json);
}
