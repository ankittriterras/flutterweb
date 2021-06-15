import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final bool isRequired;
  final bool enabled;
  final bool obscureText;

  final String hintText;
  final String label;
  final int maxNumOfCharacters;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final FocusNode focusTo;
  final String Function(String) validatorFunction;
  final Function(String) onSaveFunction;

  CustomInputField({
    Key key,
    this.isRequired = false,
    this.enabled = true,
    this.obscureText = false,
    this.hintText = "Hint text",
    this.label,
    this.maxNumOfCharacters,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.textEditingController,
    this.focusNode,
    this.focusTo,
    this.validatorFunction,
    this.onSaveFunction,
  }) : super(key: key);

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
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
          TextFormField(
            enabled: this.widget.enabled,
            cursorColor: Colors.grey[900],
            style: TextStyle(
              color: Colors.grey[900],
            ),
            controller: widget.textEditingController,
            focusNode: widget.focusNode,
            maxLength: widget.maxNumOfCharacters,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            obscureText: widget.obscureText,
            decoration: buildInputDecoration(widget.hintText),
            onFieldSubmitted: (String value) {
              if (widget.focusTo != null) {
                FocusScope.of(context).requestFocus(widget.focusTo);
              }
            },
            validator: widget.validatorFunction,
            onSaved: widget.onSaveFunction,
          ),
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration(String hintText) {
    return InputDecoration(
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
      hintText: hintText,
      counterText: "",
      hintStyle: TextStyle(
        color: Colors.grey[600],
      ),
    );
  }
}
