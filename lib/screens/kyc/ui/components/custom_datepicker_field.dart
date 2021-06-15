import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class CustomDatepickerField extends StatefulWidget {
  final bool isRequired;
  final String label;
  final String value;

  const CustomDatepickerField({Key key, this.isRequired = false, this.label, this.value}) : super(key: key);

  @override
  _CustomDatepickerFieldState createState() => _CustomDatepickerFieldState();
}

class _CustomDatepickerFieldState extends State<CustomDatepickerField> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 380, minWidth: 380),
          child: GestureDetector(
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 1,
                  color: Colors.grey[500],
                ),
              ),
              width: double.infinity,
              child: Text(
                Jiffy(widget.value).format('MMM do yyyy'),
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        onTap: () async {
          final DateTime picked = await showDatePicker(
            context: context,
            initialDate: Jiffy().dateTime,
            firstDate: Jiffy([1900]).dateTime,
            lastDate: Jiffy([2100, 12, 31]).dateTime,
          );
        },
      ),
    );
  }
}
