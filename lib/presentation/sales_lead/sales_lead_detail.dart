import 'package:flutter/material.dart';
import 'package:skakone/core/constants/const_data.dart';
import 'package:skakone/presentation/sales_lead/widgets/sales_lead_widgets.dart';
import 'models/sales_lead_model.dart';

class SalesLeadDetailPage extends StatelessWidget {
  final SalesLeadModel lead;

  const  SalesLeadDetailPage({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lead Details"),
        backgroundColor: ConstData.prmClr,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            SalesLeadWidgets.buildDetailTile("Reference No.", lead.refNo),
            SalesLeadWidgets.buildDetailTile("Company Name", lead.company),
            SalesLeadWidgets.buildDetailTile("Business Type", lead.businessType),
            SalesLeadWidgets.buildDetailTile("Product/Service", lead.productService),
            SalesLeadWidgets.buildDetailTile("Address", lead.address),
            SalesLeadWidgets.buildDetailTile("Source of Contact", lead.source),
            SalesLeadWidgets.buildDetailTile("Recent Update Date", lead.recentUpdate),
            SalesLeadWidgets.buildDetailTile("Follow-up Date", lead.followUpDate),
          ],
        ),
      ),
    );
  }

}
