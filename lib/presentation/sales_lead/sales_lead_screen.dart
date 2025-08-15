import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skakone/presentation/sales_lead/sales_lead_detail.dart';
import '../../core/constants/const_data.dart';
import 'controller/sales_lead_controller.dart';


class SalesLeadScreen extends StatelessWidget {
  final SalesLeadController controller = Get.put(SalesLeadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sales Leads',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
            ),
            Obx(() => ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: controller.leads.length,
              padding: EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (context, index) {
                final lead = controller.leads[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  margin: EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Ref #: ${lead.refNo}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Icon(Icons.business_center_rounded, color: Colors.indigo),
                          ],
                        ),
                        SizedBox(height: 6),
                        Text(
                          lead.company,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text("Business Type: ${lead.businessType}"),
                        Text("Product/Service: ${lead.productService}"),
                        Text("Address: ${lead.address}"),
                        Text("Source: ${lead.source}"),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.update, size: 16),
                            SizedBox(width: 4),
                            Text("Recent Update: ${lead.recentUpdate}"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month, size: 16),
                            SizedBox(width: 4),
                            Text("Follow-up: ${lead.followUpDate}"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            child: Text("Action"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ConstData.prmClr,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Get.to(() => SalesLeadDetailPage(lead: lead));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
