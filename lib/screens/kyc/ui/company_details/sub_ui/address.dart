import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_datepicker_field.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_file_picker.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_input_fields.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_select_field.dart';
// import 'package:kratos_flutter/screens/kyc/ui/components/edit_table_data_dialog.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailFocus = FocusNode();

   // Dropdown states
  List<String> countryList = ["Albania", "India"];
  List<String> industryList = ["Industry 1", "Industry 2"];
  String countrySelected = "Albania";
  String industrySelected = 'Industry 1';

  List<String> nationalityList = ["Albanian", "Indian"];
  String nationalitySelected = "Albanian";

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
                CustomInputField(
                  isRequired: true,
                  label: "Company Address",
                  hintText: "Enter Address ..",
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
                   label: "City",
                   hintText: "Enter City ..",
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
                  label: "State",
                  hintText: "Enter State ..",
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
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                CustomInputField(
                  isRequired: true,
                  label: "Country",
                  hintText: "Enter Country ..",
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
                  label: "Zipcode",
                  hintText: "Enter Zipcode ..",
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

