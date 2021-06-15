import 'package:flutter/material.dart';
import 'package:kratos_flutter/screens/kyc/components/navigation/components/kratos_navigation_account.dart';
import 'package:kratos_flutter/screens/kyc/components/navigation/components/kratos_navigation_notification.dart';
import 'package:kratos_flutter/screens/kyc/components/navigation/components/kratos_navigation_timer.dart';

class KratosNavbar extends StatelessWidget {
  const KratosNavbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 40),
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          KratosNavigationTimer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: KratosNavigationNotification(),
          ),
          KratosNavigationAccount(),
        ],
      ),
    );
  }
}
