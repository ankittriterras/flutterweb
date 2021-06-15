import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KratosNavigationAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Icon(
            Icons.account_box,
            size: 42,
            color: Colors.teal[900],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "User+1",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            height: 16,
            width: 16,
            child: new SvgPicture.string('<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="#424242"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" /></svg>'),
          ),
        ],
      ),
    );
  }
}
