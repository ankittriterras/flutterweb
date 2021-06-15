import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFilePicker extends StatefulWidget {
  final bool isRequired;
  final String label;
  final String initialFileName;
  final String noFileSelectedHint;

  const CustomFilePicker({Key key, this.isRequired = false, this.label, this.initialFileName, this.noFileSelectedHint = "Select File"}) : super(key: key);

  @override
  _CustomFilePickerState createState() => _CustomFilePickerState();
}

class _CustomFilePickerState extends State<CustomFilePicker> {
  String fileName = "No file selected";
  bool isFileSelected = false;

  @override
  initState() {
    super.initState();
    fileName = widget.initialFileName;
    isFileSelected = (widget.initialFileName != null && widget.initialFileName != "");
  }

  selectFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(withReadStream: true);

    if (result != null) {
      PlatformFile selectedFile = result.files.first;
      // log(result.files.first.toString());
      setState(() {
        fileName = selectedFile.name;
        isFileSelected = true;
      });
    }
  }

  removeFile() {
    setState(() {
      fileName = null;
      isFileSelected = false;
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
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.grey[500],
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => selectFile(),
                              child: (() {
                                if (isFileSelected) {
                                  return Container(
                                    height: 48,
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ConstrainedBox(
                                          constraints: BoxConstraints(maxWidth: 200),
                                          child: Text(
                                            fileName,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.teal[300],
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.upload_file,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Container(
                                    height: 48,
                                    width: double.infinity,
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(maxWidth: 200),
                                      child: Text(
                                        widget.noFileSelectedHint,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }()),
                            ),
                          ),
                        ),
                        (() {
                          if (isFileSelected) {
                            return Container(
                              height: 48,
                              width: 48,
                              child: TextButton(
                                onPressed: () {
                                  removeFile();
                                },
                                child: SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: SvgPicture.string('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><path d="M7.219 5.781L5.78 7.22 14.563 16 5.78 24.781 7.22 26.22 16 17.437l8.781 8.782 1.438-1.438L17.437 16l8.782-8.781L24.78 5.78 16 14.563z"/></svg>'),
                                ),
                              ),
                            );
                          }
                          return SizedBox.shrink();
                        }()),
                      ],
                    ),
                  ),
                  (() {
                    if (isFileSelected) {
                      return Row(
                        children: [
                          Container(
                            height: 36,
                            child: VerticalDivider(
                              width: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                          MouseRegion(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('File $fileName is selected for upload'),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 48,
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Container(
                                      child: SvgPicture.string('<svg xmlns="http://www.w3.org/2000/svg" fill="#9E9E9E" width="48" height="48"><path d="M18 32h12V20h8L24 6 10 20h8zm-8 4h28v4H10z"/></svg>'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    return SizedBox.shrink();
                  }()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
