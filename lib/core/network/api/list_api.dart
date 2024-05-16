class ListAPI {
  ListAPI._();


  static const String loginCustomer = 'customer/login';
  static const String fetchCustomerInventory = 'customer/get-customer-inventory';
  static const String trackInventoryItemCustomer = 'customer/track-inventory-item';
  static const String fetchInventoryStats = 'customer/fetch-inventory-stats';
  static const String fetchCustomerPriceList = 'customer/fetch-price-list';


  /// Download API'S
  ///
  static const String downloadFiles = 'customer/download-files';
  static const String downloadFile = 'customer/download-file';
  static const String loadPdf = 'customer/load-pdf';

  //static const String fetchPriceListCustomer = 'customer/fetch-price-list';

  static const String login = 'admin/login';
  static const String createCustomer = 'admin/create-customer';
  static const String updateCustomer = 'admin/update-customer';
  static const String deleteCustomer = 'admin/delete-customer';
  static const String fetchCustomers = 'admin/fetch-customers';


  static const String createInventory = 'admin/create-inventory-item';
  static const String fetchInventory = 'admin/fetch-inventory';
  static const String updateInventory = 'admin/update-inventory-item';
  static const String deleteInventory = 'admin/delete-inventory';
  static const String trackInventoryItem = 'admin/track-inventory-item';

  static const String addPriceList = 'admin/add-price-list';
  static const String fetchPriceList = 'admin/fetch-price-list';
  static const String deletePriceList = 'admin/delete-price-list';


  static const String imageUpload = 'admin/image-upload';
  static const String videoUpload = 'admin/video-upload';
  static const String mediaUpload = 'admin/pdf-upload';


  static const String register = 'user/signup';

  //---------------Fetch Report ---------------------------------
  static const String fetchReport = 'admin/fetch-report';
  static const String filterReport = 'admin/filtered-report';



  /// ////////////// BILLING API's
 ///
  static const String fetchAccountOfCharts = 'billing/fetch-chart-of-accounts';
  static const String fetchAccountCodeReport = 'billing/fetch-account-code-report';
  static const String addItemChartOfAccounts = 'billing/add-chart-of-accounts-item';
  static const String deleteItemChartOfAccounts = 'billing/delete-chart-of-accounts-item';


  /// Purchase Items
  ///
  static const String fetchPurchaseItems = 'billing/get-purchase-items';
  static const String addPurchaseItem = 'billing/add-purchase-item';
}
