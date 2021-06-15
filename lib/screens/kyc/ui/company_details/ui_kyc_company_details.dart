import 'package:flutter/material.dart';
import 'package:kratos_flutter/screens/kyc/components/kyc_ui_notice.dart';
import 'package:kratos_flutter/screens/kyc/components/kyc_ui_section.dart';
import 'package:kratos_flutter/screens/kyc/ui/company_details/sub_ui/company_information.dart';
import 'package:kratos_flutter/screens/kyc/ui/company_details/sub_ui/company_operations.dart';
import 'package:kratos_flutter/screens/kyc/ui/company_details/sub_ui/address.dart';
import 'package:kratos_flutter/screens/kyc/ui/company_details/sub_ui/company_admin.dart';
import 'package:kratos_flutter/screens/kyc/ui/company_details/sub_ui/sanctioned_countries.dart';

class UIKycCompanyDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // KycUiNotice(""),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                KycUiSection(
                  sectonTitle: RichText(
                    text: TextSpan(
                      style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 16),
                      children: [TextSpan(text: "Company Information : "), TextSpan(text: "", style: TextStyle(color: Colors.red))],
                    ),
                  ),
                  sectionSubtitle: "",
                  sectionContentWidget: CompanyInformation(),
                ),
                KycUiSection(
                  sectonTitle: RichText(
                    text: TextSpan(
                      style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 16),
                      children: [TextSpan(text: "Company Operations : "), TextSpan(text: "", style: TextStyle(color: Colors.red))],
                    ),
                  ),
                  sectionSubtitle: "",
                  sectionContentWidget: CompanyOperations(),
                ),
                KycUiSection(
                  sectonTitle: RichText(
                    text: TextSpan(
                      style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 16),
                      children: [TextSpan(text: "Does this entity, its associate entities and/or its suppliers deal with "), TextSpan(text: "sanctioned countries ?", style: TextStyle(color: Colors.teal[300]))],
                    ),
                  ),
                  sectionSubtitle: "",
                  sectionContentWidget: SanctionedCountries(),
                ),
                KycUiSection(
                  sectonTitle: RichText(
                    text: TextSpan(
                      style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 16),
                      children: [TextSpan(text: "Address : "), TextSpan(text: "", style: TextStyle(color: Colors.red))],
                    ),
                  ),
                  sectionSubtitle: "",
                  sectionContentWidget: Address(),
                ),
                KycUiSection(
                  sectonTitle: RichText(
                    text: TextSpan(
                      style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 16),
                      children: [TextSpan(text: "Company Admin : "), TextSpan(text: "", style: TextStyle(color: Colors.red))],
                    ),
                  ),
                  sectionSubtitle: "",
                  sectionContentWidget: CompanyAdmin(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
