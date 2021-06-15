import 'package:flutter/material.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_file_picker.dart';

class CompanyRealtedDocument extends StatefulWidget {
  @override
  _CompanyRealtedDocumentState createState() => _CompanyRealtedDocumentState();
}

class _CompanyRealtedDocumentState extends State<CompanyRealtedDocument> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomFilePicker(
            label: "Business Registration Document",
            isRequired: true,
            initialFileName: "Business Registration",
          ),
          SizedBox(width: 20),
          CustomFilePicker(
            label: "Proof of company address",
            isRequired: true,
            initialFileName: "Director Passport",
          ),
        ],
      ),
    );
  }
}
