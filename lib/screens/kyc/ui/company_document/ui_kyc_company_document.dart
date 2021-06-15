import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kratos_flutter/screens/kyc/components/kyc_ui_notice.dart';
import 'package:kratos_flutter/screens/kyc/components/kyc_ui_section.dart';
import 'package:kratos_flutter/screens/kyc/ui/company_document/sub_ui/confirmation_of_registered_directors.dart';
import 'package:kratos_flutter/screens/kyc/ui/company_document/sub_ui/company_related_document.dart';
import 'package:kratos_flutter/screens/kyc/ui/company_document/sub_ui/confirmation_of_registered_shareholder.dart';
import 'package:kratos_flutter/screens/kyc/ui/company_document/sub_ui/more_documents.dart';

class UIKycCompanyDocuments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KycUiNotice("Note: When the business registration document does not contain information on current directors and/or UBOs with above 19% ownership, the client must submit documents that have this information and are attested by the client's Legal Counsel / Auditors (contact details for these parties are required)."),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                KycUiSection(
                  sectonTitle: RichText(
                    text: TextSpan(
                      style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 16),
                      children: [TextSpan(text: "Company Related Required Documents: "), TextSpan(text: "*", style: TextStyle(color: Colors.red))],
                    ),
                  ),
                  sectionContentWidget: CompanyRealtedDocument(),
                ),
                KycUiSection(
                  sectonTitle: RichText(
                    text: TextSpan(
                      style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 16),
                      children: [TextSpan(text: "Confirmation Of Registered Director(s): "), TextSpan(text: "*", style: TextStyle(color: Colors.red))],
                    ),
                  ),
                  sectionContentWidget: ConfirmationOfRegisteredDirectors(),
                ),
                KycUiSection(
                  sectonTitle: RichText(
                    text: TextSpan(
                      style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 16),
                      children: [TextSpan(text: "Confirmation Of Registered UBO/Shareholder(s): "), TextSpan(text: "*", style: TextStyle(color: Colors.red))],
                    ),
                  ),
                  sectionContentWidget: ConfirmationOfRegisteredShareholders(),
                ),
                KycUiSection(
                  sectonTitle: RichText(
                    text: TextSpan(
                      style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 16),
                      children: [TextSpan(text: "More Documents: "), TextSpan(text: "*", style: TextStyle(color: Colors.red))],
                    ),
                  ),
                  sectionSubtitle: "Please Add/Edit/Delete in list below",
                  sectionContentWidget: MoreDocuments(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
