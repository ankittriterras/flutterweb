import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:jiffy/jiffy.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_datepicker_field.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_file_picker.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_input_fields.dart';
import 'package:kratos_flutter/screens/kyc/ui/components/custom_select_field.dart';

// Interface
class _ColumnCellPairs {
  final String cellTitle;
  final String modelClassKey;
  final String identifier;

  _ColumnCellPairs({this.cellTitle, this.modelClassKey, this.identifier = 'text'});
}

// Model
class _MCompanyDirectors {
  final String name;
  final String country;
  final String dob;
  final String nationality;
  final String passportNumber;
  final String passportDocument;
  final String authorizedSignatory;

  _MCompanyDirectors({this.name, this.country, this.dob, this.nationality, this.passportNumber, this.passportDocument, this.authorizedSignatory});

  Map<String, dynamic> _toMap() {
    return {
      "name": this.name,
      "country": this.country,
      "dob": this.dob,
      "nationality": this.nationality,
      "passportNumber": this.passportNumber,
      "passportDocument": this.passportDocument,
      "authorizedSignatory": this.authorizedSignatory,
    };
  }

  dynamic get(String propertyName) {
    var _mapRep = _toMap();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('propery not found');
  }
}

// UI
class CompanyUltimateBeneficiaryTable extends StatefulWidget {
  @override
  _CompanyUltimateBeneficiaryTableState createState() => _CompanyUltimateBeneficiaryTableState();
}

class _CompanyUltimateBeneficiaryTableState extends State<CompanyUltimateBeneficiaryTable> with TickerProviderStateMixin {
  List<AnimationController> _animationControllerList = [];
  List<Animation<double>> _animationList = [];
  List<bool> _expandedList = [];

  List<_ColumnCellPairs> _columnCellPairs = [
    _ColumnCellPairs(cellTitle: "Name", modelClassKey: "name"),
    _ColumnCellPairs(cellTitle: "Country of Residence", modelClassKey: "country"),
    _ColumnCellPairs(cellTitle: "Date of Birth", modelClassKey: "dob"),
    _ColumnCellPairs(cellTitle: "Nationality", modelClassKey: "nationality"),
    _ColumnCellPairs(cellTitle: "Passport Number", modelClassKey: "passportNumber"),
    _ColumnCellPairs(cellTitle: "Passport Document", modelClassKey: "passportDocument", identifier: 'uploaded_doc'),
    _ColumnCellPairs(cellTitle: "Authorized Signatory", modelClassKey: "authorizedSignatory"),
  ];

  List<Widget> columns = [];
  int rowCount = 1;
  List<Widget> rows = [];

  List<_MCompanyDirectors> data = [
    _MCompanyDirectors(
      name: "Shareholder 1",
      country: "Albania",
      dob: "10-Mar-2021",
      nationality: "Albanian",
      passportNumber: "1234567890",
      passportDocument: "Director Passport",
      authorizedSignatory: "Yes",
    ),
    _MCompanyDirectors(
      name: "Shareholder 2",
      country: "Albania",
      dob: "10-Mar-2021",
      nationality: "Albanian",
      passportNumber: "1234567890",
      passportDocument: "Director Passport",
      authorizedSignatory: "No",
    ),
  ];

  // Dropdown states
  String countrySelected = "albania";
  String nationalitySelected = "albanian";

  @override
  void initState() {
    super.initState();
    _generateAnimationDependencies();
    _generateColumns();
    _generateDataCells();
  }

  toggleEditStateForEditRow(int index) {
    bool isExpanded = _expandedList[index];
    AnimationController controller = _animationControllerList[index];
    if (isExpanded) {
      controller.reverse();
    } else {
      controller.forward();
    }

    _expandedList[index] = !isExpanded;
  }

  void _generateAnimationDependencies() {
    for (var i = 0; i < data.length; i++) {
      AnimationController _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));

      _animationControllerList.add(_controller);
      _animationList.add(Tween<double>(begin: 0, end: 330).animate(_controller));
      _expandedList.add(false);
    }
  }

  void _generateColumns() {
    columns = _columnCellPairs.map((_ColumnCellPairs pair) {
      return ConstrainedBox(
        constraints: BoxConstraints(minWidth: 80),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            border: Border(
              right: BorderSide(color: Colors.grey[300], width: 1),
              bottom: BorderSide(color: Colors.grey[300], width: 1),
            ),
          ),
          child: Text(
            pair.cellTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "OpenSans"),
          ),
        ),
      );
    }).toList();

    columns.add(
      ConstrainedBox(
        constraints: BoxConstraints(minWidth: 80),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            border: Border(
              right: BorderSide(color: Colors.grey[300], width: 1),
              bottom: BorderSide(color: Colors.grey[300], width: 1),
            ),
          ),
          child: Text(
            "+ADD",
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "OpenSans", color: Colors.teal[300]),
          ),
        ),
      ),
    );
  }

  void _generateDataCells() {
    rows = [];

    data.asMap().entries.forEach((element) {
      int index = element.key;
      _MCompanyDirectors entry = element.value;
      // Generate Data cells from model
      List<Widget> dataRowCells = _columnCellPairs.map((_ColumnCellPairs pair) {
        Widget cellChild = SizedBox.shrink();

        if (pair.identifier == 'uploaded_doc') {
          cellChild = Row(
            children: [
              Text(
                entry.get(pair.modelClassKey),
                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "OpenSans", color: Colors.teal[300]),
              ),
              SizedBox(width: 10),
              Icon(Icons.upload_file)
            ],
          );
        } else if (pair.identifier == 'authorized_signatory') {
          cellChild = Text(
            entry.get(pair.modelClassKey) ? "Yes" : "No",
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "OpenSans"),
          );
        } else {
          cellChild = Text(
            entry.get(pair.modelClassKey),
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "OpenSans"),
          );
        }

        return ConstrainedBox(
          constraints: BoxConstraints(minWidth: 80),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.grey[300], width: 1),
                bottom: BorderSide(color: Colors.grey[300], width: 1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: cellChild,
                ),
              ],
            ),
          ),
        );
      }).toList();

      // Add additional Data cell for actions
      dataRowCells.add(
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 80),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.grey[300], width: 1),
                bottom: BorderSide(color: Colors.grey[300], width: 1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      TextButton(
                        onPressed: () {
                          toggleEditStateForEditRow(index);
                        },
                        style: TextButton.styleFrom(
                          side: BorderSide(color: Colors.grey[400]),
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                        ),
                        child: Icon(Icons.edit, size: 16, color: Colors.grey[400]),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          side: BorderSide(color: Colors.grey[400]),
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                        ),
                        child: Icon(Icons.delete, size: 16, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      rows.addAll(dataRowCells);
      rowCount++; // Increment row by one

      // Add corresponding edit row
      rows.add(
        GridPlacement(
          columnStart: 0,
          columnSpan: columns.length,
          rowStart: rowCount,
          rowSpan: 1,
          child: AnimatedBuilder(
            animation: _animationControllerList[index],
            builder: (context, children) {
              return Container(
                height: _animationList[index].value,
                child: ClipRect(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: kElevationToShadow[4],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300], width: 1),
                        ),
                        boxShadow: [
                          BoxShadow(offset: Offset(0.0, 2.0), blurRadius: 1.0, spreadRadius: -1.0, color: Colors.grey[300]),
                          BoxShadow(offset: Offset(0.0, 1.0), blurRadius: 1.0, spreadRadius: 0.0, color: Colors.grey[300]),
                          BoxShadow(offset: Offset(0.0, 1.0), blurRadius: 3.0, spreadRadius: 0.0, color: Colors.grey[300]),
                        ],
                      ),
                      child: children,
                    ),
                  ),
                ),
              );
            },
            child: _RowEditForm(
              countrySelected: countrySelected,
              nationalitySelected: nationalitySelected,
              widgetIndex: index,
              toggleFunction: (int index) {
                toggleEditStateForEditRow(index);
              },
            ),
          ),
        ),
      );

      rowCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: LayoutGrid(
          columnGap: 0,
          rowGap: 0,
          columnSizes: List.generate(columns.length, (index) {
            return auto;
          }).toList(),
          rowSizes: List.generate(rowCount, (index) {
            return auto;
          }).toList(),
          children: [
            ...columns,
            ...rows,
          ],
        ),
      ),
    );
  }
}

class _RowEditForm extends StatefulWidget {
  final String countrySelected;
  final String nationalitySelected;
  final int widgetIndex;
  final Function(int) toggleFunction;

  const _RowEditForm({Key key, this.countrySelected, this.nationalitySelected, this.widgetIndex, this.toggleFunction}) : super(key: key);
  @override
  __RowEditFormState createState() => __RowEditFormState();
}

class __RowEditFormState extends State<_RowEditForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Dropdown states
  List<Map<String, String>> countryList = [
    {"albania": "Albania"},
    {"india": "India"},
  ];
  String countrySelected;

  List<Map<String, String>> nationalityList = [
    {"albanian": "Albanian"},
    {"indian": "Indian"},
  ];
  String nationalitySelected;

  bool _isAuthorizedSignatory = false;

  @override
  void initState() {
    super.initState();
    countrySelected = widget.countrySelected ?? countryList.first.values.first;
    nationalitySelected = widget.nationalitySelected ?? nationalityList.first.values.first;
  }

  toggleAuthorizedSignatoryState() {
    setState(() {
      _isAuthorizedSignatory = !_isAuthorizedSignatory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomInputField(
                                isRequired: true,
                                label: "Name",
                                hintText: "Enter a name",
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
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: CustomSelectField(
                                isRequired: true,
                                label: "Country of Resisidence",
                                value: countrySelected,
                                items: countryList,
                                onChangedCallback: (String value) {
                                  if (countrySelected != value) {
                                    setState(() {
                                      countrySelected = value;
                                    });
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: CustomDatepickerField(
                                isRequired: true,
                                label: "Date of Birth",
                                value: Jiffy().dateTime.toString(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomSelectField(
                                isRequired: true,
                                label: "Nationality",
                                value: nationalitySelected,
                                items: nationalityList,
                                onChangedCallback: (String value) {
                                  if (nationalitySelected != value) {
                                    setState(() {
                                      nationalitySelected = value;
                                    });
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: CustomInputField(
                                isRequired: true,
                                label: "Passport Number",
                                hintText: "Enter passport number",
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                validatorFunction: (String string) {
                                  string = string.trim();
                                  if (string == "" || string == null) {
                                    return "Passort number is required";
                                  }
                                  return null;
                                },
                                onSaveFunction: (String value) {},
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: CustomFilePicker(
                                isRequired: true,
                                label: "Upload Passport Document",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(height: 1, color: Colors.grey[300]),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          toggleAuthorizedSignatoryState();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.grey[600],
                              value: _isAuthorizedSignatory,
                              onChanged: (bool value) {
                                setState(() {
                                  toggleAuthorizedSignatoryState();
                                });
                              },
                            ),
                            Text(
                              "The person above is also an authorized signatory.",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            _formKey.currentState.reset();
                            widget.toggleFunction(widget.widgetIndex);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.grey[500],
                            ),
                            padding: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.cancel,
                                size: 14,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Cancel",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              widget.toggleFunction(widget.widgetIndex);
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.teal[300],
                            ),
                            padding: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.save,
                                size: 14,
                                color: Colors.teal[300],
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Save",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.teal[300],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
