import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_datepicker_field.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_file_picker.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_input_fields.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_select_field.dart';
// import 'package:kratos_flutter/screens/kyc/ui/components/edit_table_data_dialog.dart';

class CompanyInformation extends StatefulWidget {
  @override
  _CompanyInformationState createState() => _CompanyInformationState();
}

class _CompanyInformationState extends State<CompanyInformation> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailFocus = FocusNode();

   // Dropdown states
  // List<String> countryList = ["Albania", "India"];
  // List<String> entityList = ["Entity 1", "Entity 2"];
  // String countrySelected = "Albania";
  // String entitySelected = 'Entity 1';

  // List<String> nationalityList = ["Albanian", "Indian"];
  // String nationalitySelected = "Albanian";

  List<Map<String, String>> countryList = [
    {"": "Select"},
    {"Albania": "Albania"},
    {"India": "India"}
  ];
  String countrySelected = "";

  List<Map<String, String>> entityList = [
    {"": "Select"},
    {"Entity 1": "Entity 1"},
    {"Entity 2": "Entity 2"}
  ];
  String entitySelected = "";

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
                CustomFilePicker(
                  label: "Logo",
                  isRequired: true,
                  initialFileName: "Company Logo",
                ),
                SizedBox(
                  width: 30,
                ),
                CustomInputField(
                  isRequired: true,
                  label: "Company Name",
                  hintText: "Test Company Name",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  focusTo: _emailFocus,
                  validatorFunction: (String string) {
                    string = string.trim();
                    if (string == "" || string == null) {
                      return "Name is required";
                    }
                    return null;
                  },
                  onSaveFunction: (String value) {},
                ),
                SizedBox(
                  width: 30,
                ),
                StatefulBuilder(builder: (BuildContext context, StateSetter dropDownState) {
                  return CustomSelectField(
                    isRequired: true,
                    label: "Entity Type",
                    value: entitySelected,
                    items: entityList,
                    onChangedCallback: (String value) {
                      if (entitySelected != value) {
                        dropDownState(() {
                          entitySelected = value;
                        });
                      }
                    },
                  );
                }),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomInputField(
                  isRequired: true,
                  label: "Website",
                  hintText: "www.testSite.com",
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
                CustomInputField(
                  isRequired: true,
                  label: "Business Registration Number",
                  hintText: "ABCD1234567890",
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

