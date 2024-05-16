




enum DashboardStatus { initial, success, error, loading }

extension DashboardStatusX on DashboardStatus {
  bool get isInitial => this == DashboardStatus.initial;
  bool get isSuccess => this == DashboardStatus.success;
  bool get isError => this == DashboardStatus.error;
  bool get isLoading => this == DashboardStatus.loading;
}

