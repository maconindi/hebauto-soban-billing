
import '../../../../customer_profile/domain/usecase/customer_profile_usecase.dart';

import '../dashboard_event.dart';



class AddCustomerEvent extends DashboardEventX {
  AddCustomerEvent({required this.params});

  final CustomerParams params;
  @override
  List<Object> get props => [params];

}