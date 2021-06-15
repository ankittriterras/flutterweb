import 'dart:developer';

import 'package:flutter/material.dart';

class CustomSelectField extends StatefulWidget {
  final bool isRequired;
  final String label;
  final String value;
  final List<Map<String, String>> items;
  final void Function(String) onChangedCallback;

  const CustomSelectField({Key key, this.isRequired, this.label, this.value, this.items, this.onChangedCallback}) : super(key: key);

  @override
  _CustomSelectFieldState createState() => _CustomSelectFieldState();
}

class _CustomSelectFieldState extends State<CustomSelectField> {
  List<DropdownMenuItem<String>> dropdownItems = [];

  @override
  void initState() {
    super.initState();
    _buildSelectFields();
  }

  void _buildSelectFields() {
    List<DropdownMenuItem<String>> tempDropdownItems = [];
    widget.items.forEach((element) {
      tempDropdownItems.add(DropdownMenuItem(value: element.keys.first, child: Text(element.values.first)));
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
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.grey[500]),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: widget.value,
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
                  widget.onChangedCallback(v);
                },
                items: dropdownItems,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
