import 'package:flutter/material.dart';
import 'package:kratos_flutter/screens/kyc/components/kyc_ui_notice.dart';
import 'package:kratos_flutter/screens/kyc/components/kyc_ui_section.dart';
import 'package:kratos_flutter/screens/kyc/ui/share_holder/sub_ui/company_directors.dart';
import 'package:kratos_flutter/screens/kyc/ui/share_holder/sub_ui/company_ultimate_benificiary.dart';

class UIKycShareholderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KycUiNotice("Note: Please fill in the details of all your directors and shareholders. For shareholders, all individuals who ultimately own over 19% of the company must be listed."),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                KycUiSection(
                  sectonTitle: RichText(
                    text: TextSpan(
                      style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 16),
                      children: [TextSpan(text: "Company's Directors: "), TextSpan(text: "*", style: TextStyle(color: Colors.red))],
                    ),
                  ),
                  sectionSubtitle: "Please Add/Edit/Delete in list below",
                  sectionContentWidget: CompanyDirectorsTable(),
                ),
                KycUiSection(
                  sectonTitle: RichText(
                    text: TextSpan(
                      style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold, fontSize: 16),
                      children: [TextSpan(text: "Company's Ultimate Beneficiary Owners/Shareholders: "), TextSpan(text: "*", style: TextStyle(color: Colors.red))],
                    ),
                  ),
                  sectionSubtitle: "Please Add/Edit/Delete in list below",
                  sectionContentWidget: CompanyUltimateBeneficiaryTable(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
