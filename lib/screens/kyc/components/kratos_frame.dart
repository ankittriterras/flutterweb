import 'package:flutter/material.dart';
import 'package:kratos_flutter/screens/kyc/components/kyc_card/kratos_kyc_card.dart';
import 'package:kratos_flutter/screens/kyc/components/kyc_status/kratos_kyc_status.dart';
import 'package:kratos_flutter/screens/kyc/interfaces/kratos_frame_card_tabs.dart';
import 'package:measured_size/measured_size.dart';

import 'navigation/kratos_navbar.dart';

class KratosFrame extends StatefulWidget {
  final List<IKycStep> steps;

  KratosFrame({Key key, this.steps})
      : assert(steps != null, "The kyc steps must be provided"),
        assert(steps is List<IKycStep>, "The kyc steps must be List<IStepIndicator>"),
        super(key: key);

  @override
  _KratosFrameState createState() => _KratosFrameState();
}

class _KratosFrameState extends State<KratosFrame> {
  double kycIndicatorHeight = 0;

  setKycIndicatorHeight(double height) {
    setState(() {
      kycIndicatorHeight = height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.grey[100],
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: 250,
                  height: double.infinity,
                  color: Colors.teal[300],
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 64),
                        width: 200,
                        child: Image.network("https://dummyimage.com/300x80/000/fff&text=testing"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      MeasuredSize(
                        onChange: (Size size) {
                          setKycIndicatorHeight(size.height);
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              margin: EdgeInsets.only(top: 64),
                              child: KratosKycStatus(),
                            ),
                            Container(
                              child: KratosNavbar(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: kycIndicatorHeight),
              child: KratosKycCard(
                steps: widget.steps,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
