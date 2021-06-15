import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kratos_flutter/helpers/classes/country_name_code_dial.dart';

class CustomContactField extends StatefulWidget {
  final String initialSelection;
  final bool isRequired;
  final bool enabled;
  final String hintText;
  final String label;
  final int maxNumOfCharacters;
  final TextInputAction textInputAction;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final FocusNode focusTo;
  final String Function(String) validatorFunction;
  final Function(ICountryWithCodeAndDial, String) onSaveFunction;

  CustomContactField({
    Key key,
    this.initialSelection,
    this.isRequired = false,
    this.enabled = true,
    this.hintText = "Hint text",
    this.label,
    this.maxNumOfCharacters,
    this.textInputAction = TextInputAction.done,
    this.textEditingController,
    this.focusNode,
    this.focusTo,
    this.validatorFunction,
    this.onSaveFunction,
  }) : super(key: key);

  @override
  _CustomContactFieldState createState() => _CustomContactFieldState();
}

class _CustomContactFieldState extends State<CustomContactField> {
  String selectedCountryCode = "";
  ICountryWithCodeAndDial selectedCountryModel;
  List<ICountryWithCodeAndDial> countriesList = CountryNameWithCodeAndDialCode().getArray();
  List<DropdownMenuItem<String>> dropdownItems = [];

  @override
  void initState() {
    super.initState();
    selectedCountryCode = widget.initialSelection ?? countriesList.first.countryCode;

    selectedCountryModel = countriesList.where((element) => element.countryCode == selectedCountryCode).first;
    _buildSelectFields();
  }

  void _buildSelectFields() {
    List<DropdownMenuItem<String>> tempDropdownItems = [];
    countriesList.forEach((element) {
      tempDropdownItems.add(DropdownMenuItem(value: element.countryCode, child: Text(element.countryName)));
    });

    setState(() {
      dropdownItems = tempDropdownItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 380, minWidth: 380),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: (widget.isRequired)
                ? RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(text: widget.label),
                        TextSpan(
                          text: " *",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  )
                : Text(
                    widget.label,
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 12,
                    ),
                  ),
          ),
          SizedBox(height: 5),
          Container(
            child: Row(
              children: [
                countrySelection(),
                SizedBox(width: 10),
                contactInput(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Country Selection
  Widget countrySelection() {
    return Container(
      height: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[600], width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: SvgPicture.asset('assets/images/flags/$selectedCountryCode.svg'),
          ),
          SizedBox(width: 10),
          Container(
            width: 100,
            height: 24,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedCountryCode,
                selectedItemBuilder: (BuildContext context) {
                  return countriesList.map((ICountryWithCodeAndDial item) {
                    return Text(
                      "+${item.dialCode}",
                      style: TextStyle(fontSize: 18),
                    );
                  }).toList();
                },
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey[600],
                ),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
                onChanged: (String v) {
                  if (v != selectedCountryCode) {
                    ICountryWithCodeAndDial selectedCountry = countriesList.where((element) => element.countryCode == v).first;
                    setState(() {
                      selectedCountryCode = v;
                      selectedCountryModel = selectedCountry;
                    });
                  }
                },
                items: dropdownItems,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Input
  Widget contactInput() {
    return Expanded(
      child: TextFormField(
        enabled: this.widget.enabled,
        cursorColor: Colors.grey[900],
        style: TextStyle(
          color: Colors.grey[900],
        ),
        controller: widget.textEditingController,
        focusNode: widget.focusNode,
        maxLength: widget.maxNumOfCharacters ?? 10,
        keyboardType: TextInputType.number,
        textInputAction: widget.textInputAction,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
        ],
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey[600],
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey[200],
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey[500],
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),
          errorStyle: TextStyle(color: Colors.redAccent[200]),
          hintText: widget.hintText,
          counterText: "",
          hintStyle: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        onFieldSubmitted: (String value) {
          if (widget.focusTo != null) {
            FocusScope.of(context).requestFocus(widget.focusTo);
          }
        },
        validator: widget.validatorFunction,
        onSaved: (String number) {
          widget.onSaveFunction(selectedCountryModel, number);
        },
      ),
    );
  }
}
