// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_datepicker_field.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_file_picker.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_input_fields.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_select_field.dart';
// import 'package:kratos_flutter/screens/kyc/ui/components/edit_table_data_dialog.dart';

class SanctionedCountries extends StatefulWidget {
  @override
  _SanctionedCountryState createState() => _SanctionedCountryState();
}

class _SanctionedCountryState extends State<SanctionedCountries> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailFocus = FocusNode();

   // Dropdown states
  // List<String> countryList = ["Albania", "India"];
  // List<String> industryList = ["Industry 1", "Industry 2"]; 
  // String countrySelected = "Albania";
  // String industrySelected = 'Industry 1';

  List<Map<String, String>> countryList = [
    {"": "Select"},
    {"Albania": "Albania"},
    {"India": "India"}
  ];
  String countrySelected = "";


  List<String> nationalityList = ["Albanian", "Indian"];
  String nationalitySelected = "Albanian";

  // Checkbox
  bool isAuthorizedSignatory = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                StatefulBuilder(builder: (BuildContext context, StateSetter dropDownState) {
                  return CustomSelectField(
                    isRequired: true,
                    label: "Select",
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
                
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [                                
                CustomInputField(
                  isRequired: true,
                  label: "If yes, please explain",
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

