import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rw_servicios_app/src/providers/company/company_provider.dart';

class HomePageCompany extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final companyInfo = Provider.of<CompanyProvider>(context);
    final data  = companyInfo.getData();

    return Scaffold(
      appBar: AppBar(
        title: Text('CLiente1'),
      ),
      body: Column(
        children: [
          Text(''),
        ],
      ),
    );
  }
}
