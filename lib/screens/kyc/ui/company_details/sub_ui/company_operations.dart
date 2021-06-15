import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_datepicker_field.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_file_picker.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_input_fields.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_select_field.dart';
// import 'package:kratos_flutter/screens/kyc/ui/components/edit_table_data_dialog.dart';

class CompanyOperations extends StatefulWidget {
  @override
  _CompanyOperationsState createState() => _CompanyOperationsState();
}

class _CompanyOperationsState extends State<CompanyOperations> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailFocus = FocusNode();

   // Dropdown states
  // List<String> countryList = ["Albania", "India"];
  // List<String> industryList = ["Industry 1", "Industry 2"];
  // String countrySelected = "Albania";
  // String industrySelected = 'Industry 1';

  // List<String> nationalityList = ["Albanian", "Indian"];
  // String nationalitySelected = "Albanian";

  List<Map<String, String>> countryList = [
    {"": "Select"},
    {"Albania": "Albania"},
    {"India": "India"}
  ];
  String countrySelected = "";

  List<Map<String, String>> industryList = [
    {"": "Select"},
    {"Industry 1": "Industry 1"},
    {"Industry 2": "Industry 2"}
  ];
  String industrySelected = "";

  List<Map<String, String>> nationalityList = [
    {"": "Select"},
    {"Nationality 1": "Nationality 1"},
    {"Nationality 2": "Nationality 2"}
  ];
  String nationalitySelected = "";

  // Checkbox
  bool isAuthorizedSignatory = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                StatefulBuilder(builder: (BuildContext context, StateSetter dropDownState) {
                  return CustomSelectField(
                    isRequired: true,
                    label: "Country of Incorporation",
                    value: countrySelected,
                    items: countryList,                                      
                    onChangedCallback: (String value) {
                      if (countrySelected != value) {
                        dropDownState(() {
                          countrySelected = value;
                        });
                      }
                    },
                  );
                }),
                SizedBox(
                  width: 30,
                ),
                 CustomDatepickerField(
                   isRequired: true,
                   label: "Date of Incorporation",
                   value: Jiffy().dateTime.toString(),
                 ),
                SizedBox(
                  width: 30,
                ),
                StatefulBuilder(builder: (BuildContext context, StateSetter dropDownState) {
                  return CustomSelectField(
                    isRequired: true,
                    label: "Country of Operations",
                    value: countrySelected,
                    items: countryList,
                    onChangedCallback: (String value) {
                      if (countrySelected != value) {
                        dropDownState(() {
                          countrySelected = value;
                        });
                      }
                    },
                  );
                }),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                StatefulBuilder(builder: (BuildContext context, StateSetter dropDownState) {
                  return CustomSelectField(
                    isRequired: true,
                    label: "Industry",
                    value: industrySelected,
                    items: industryList,
                    onChangedCallback: (String value) {
                      if (industrySelected != value) {
                        dropDownState(() {
                          industrySelected = value;
                        });
                      }
                    },
                  );
                }),
                SizedBox(
                  width: 30,
                ),
                CustomInputField(
                  isRequired: true,
                  label: "Billing Contact Name",
                  hintText: "Enter Name ..",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  focusTo: _emailFocus,
                  validatorFunction: (String string) {
                    string = string.trim();
                    if (string == "" || string == null) {
                      return "Passort number is required";
                    }
                    return null;
                  },
                  onSaveFunction: (String value) {},
                ),
                SizedBox(
                  width: 30,
                ),
                
              ],
            ),
          ],
        ),
      ),
    );

    
  }
}

