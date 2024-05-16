import 'package:dartz/dartz.dart';
import 'package:hebauto/features_admin/dashboard/domain/entities/add_customer_entity.dart';
import 'package:hebauto/features_admin/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../customer_profile/domain/usecase/customer_profile_usecase.dart';



@injectable
class AddCustomerUseCase extends UseCase<AddCustomerEntity, CustomerParams> {

  AddCustomerUseCase(this.repository);
  final DashboardRepository repository;

  @override
  Future<Either<Failure, AddCustomerEntity>> call(CustomerParams params) => repository.addCustomer(params);

}


// @freezed
// class CustomerParams with _$CustomerParams {
//   const factory CustomerParams({
//     @JsonKey(name: 'cus_id')
//     @Default('') String cusId,
//     @Default('') String name,
//     @Default('') String email,
//     @Default('') String phone,
//     @Default('') String password,
//     @JsonKey(name: 'company_name')
//     @Default('') String companyName,
//   }) = _CustomerParams;
//
//   factory CustomerParams.fromJson(Map<String, dynamic> json) =>
//       _$CustomerParamsFromJson(json);
// }
