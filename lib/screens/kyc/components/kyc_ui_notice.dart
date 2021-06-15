import 'package:flutter/material.dart';

class KycUiNotice extends StatelessWidget {
  final String noticeText;

  KycUiNotice(this.noticeText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border.all(
          width: 1,
          color: Colors.grey[200],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        noticeText,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 16,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}
