import 'package:flutter/material.dart';
import 'package:kratos_flutter/helpers/classes/country_name_code_dial.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_contact_field.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_file_picker.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_input_fields.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_select_field.dart';

class ConfirmationOfRegisteredDirectors extends StatefulWidget {
  @override
  _ConfirmationOfRegisteredDirectorsState createState() => _ConfirmationOfRegisteredDirectorsState();
}

class _ConfirmationOfRegisteredDirectorsState extends State<ConfirmationOfRegisteredDirectors> {
  List<Map<String, String>> documentTypes = [
    {"attested": "Attested"},
    {"not_attested": "Not attested"}
  ];
  String documentTypeSelected = "attested";

  List<Map<String, String>> attestingEntityTypes = [
    {"": "Select"},
    {"one": "Sample One"}
  ];
  String attestingEntityTypeSelected = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSelectField(
                isRequired: true,
                label: "Document Type",
                value: documentTypeSelected,
                items: documentTypes,
                onChangedCallback: (String value) {
                  if (documentTypeSelected != value) {
                    setState(() {
                      documentTypeSelected = value;
                    });
                  }
                },
              ),
              SizedBox(width: 20),
              CustomInputField(
                isRequired: true,
                label: "Document Name",
                hintText: "Please Enter",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validatorFunction: (String string) {
                  string = string.trim();
                  if (string == "" || string == null) {
                    return "Name is required";
                  }
                  return null;
                },
                onSaveFunction: (String value) {},
              ),
              SizedBox(width: 20),
              CustomFilePicker(
                label: "Document",
                isRequired: true,
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSelectField(
                isRequired: true,
                label: "Attesting Entity Type",
                value: attestingEntityTypeSelected,
                items: attestingEntityTypes,
                onChangedCallback: (String value) {
                  if (attestingEntityTypeSelected != value) {
                    setState(() {
                      attestingEntityTypeSelected = value;
                    });
                  }
                },
              ),
              SizedBox(width: 20),
              CustomInputField(
                isRequired: true,
                label: "Attesting Entity Name",
                hintText: "Please Enter",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validatorFunction: (String string) {
                  string = string.trim();
                  if (string == "" || string == null) {
                    return "Name is required";
                  }
                  return null;
                },
                onSaveFunction: (String value) {},
              ),
              SizedBox(width: 20),
              CustomInputField(
                isRequired: true,
                label: "Contact Name",
                hintText: "Please Enter",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validatorFunction: (String string) {
                  string = string.trim();
                  if (string == "" || string == null) {
                    return "Name is required";
                  }
                  return null;
                },
                onSaveFunction: (String value) {},
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomInputField(
                isRequired: true,
                label: "Email Address",
                hintText: "Please Enter",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validatorFunction: (String string) {
                  string = string.trim();
                  if (string == "" || string == null) {
                    return "Name is required";
                  }
                  return null;
                },
                onSaveFunction: (String value) {},
              ),
              SizedBox(width: 20),
              CustomContactField(
                isRequired: true,
                label: "Contact number",
                hintText: "1234567890",
                textInputAction: TextInputAction.next,
                validatorFunction: (String string) {
                  string = string.trim();
                  if (string == "" || string == null) {
                    return "Name is required";
                  }
                  return null;
                },
                onSaveFunction: (ICountryWithCodeAndDial countryWithCodeAndDial, String value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
