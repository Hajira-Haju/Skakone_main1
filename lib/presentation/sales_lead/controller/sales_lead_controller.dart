import 'package:get/get.dart';
import '../models/sales_data.dart';
import '../models/sales_lead_model.dart';

class SalesLeadController extends GetxController {
  var leads = <SalesLeadModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    leads.assignAll(salesLeadData);
  }
}
