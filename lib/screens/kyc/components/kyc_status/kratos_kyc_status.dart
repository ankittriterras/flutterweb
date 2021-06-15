import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class _IKycStatusIndicators {
  String title;
  String subtitle;
  bool isActive;
  double indicatorWidth;

  _IKycStatusIndicators({this.title, this.subtitle, this.isActive = false, this.indicatorWidth = 180});
}

class KratosKycStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: constraints.maxWidth),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _KycStatusHeader(),
              Container(
                height: 90,
                child: _KycStatusIndicators(),
              ),
            ],
          ),
        ),
      );
    });
  }
}

// Header
class _KycStatusHeader extends StatelessWidget {
  const _KycStatusHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ONBOARDING - KYC DETAILS",
            style: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 24,
            ),
          ),
          // RichText(
          //   text: TextSpan(
          //     style: TextStyle(
          //       fontFamily: "OpenSans",
          //       fontSize: 24,
          //     ),
          //     children: [
          //       TextSpan(
          //         text: "ONBOARDING - KYC",
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       TextSpan(
          //         text: " DETAILS",
          //       ),
          //     ],
          //   ),
          // ),
          Text(
            "Please fill in required information for the onboarding process",
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}

// Status Indicators
class _KycStatusIndicators extends StatefulWidget {
  @override
  __KycStatusIndicatorsState createState() => __KycStatusIndicatorsState();
}

class __KycStatusIndicatorsState extends State<_KycStatusIndicators> {
  List<_IKycStatusIndicators> _indicators = [
    _IKycStatusIndicators(title: "KYC", subtitle: "Details Pending", isActive: true),
    _IKycStatusIndicators(title: "KYC", subtitle: "Under Review", indicatorWidth: 140),
    _IKycStatusIndicators(title: "KYC", subtitle: "Cleared", indicatorWidth: 100),
    _IKycStatusIndicators(title: "Subscription", subtitle: "Agreement Pending"),
    _IKycStatusIndicators(title: "Subscription", subtitle: "Agreement Under Review"),
    _IKycStatusIndicators(title: "Platform access", subtitle: "Granted", indicatorWidth: 140),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _buildIndicators(_indicators),
    );
  }

  List<Widget> _buildIndicators(List<_IKycStatusIndicators> indicators) {
    return indicators.asMap().entries.map((entry) {
      int index = entry.key;
      _IKycStatusIndicators indicator = entry.value;

      return CustomPaint(
        painter: KycIndicatorBackgroundPainer(
          indicator.isActive ? Colors.teal[50] : Colors.transparent,
        ),
        child: Container(
          width: indicator.indicatorWidth,
          padding: EdgeInsets.only(top: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.grey[300], width: 1),
                    right: BorderSide(
                      color: Colors.grey[300],
                      width: (index == indicators.length - 1) ? 1 : 0,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      indicator.title,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      indicator.subtitle,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 3),
                width: double.infinity,
                height: 36,
                child: CustomPaint(
                  painter: KycIndicatorPainter(Colors.teal),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}

// Background Painter
class KycIndicatorBackgroundPainer extends CustomPainter {
  final Color _baseColor;

  KycIndicatorBackgroundPainer(this._baseColor);

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width - 10;
    double height = size.height;

    Rect bounds = new Rect.fromLTRB(10.0, 0.0, width, height);

    final paint = Paint()..color = _baseColor;

    canvas.drawRect(bounds, paint);
  }

  @override
  bool shouldRepaint(KycIndicatorBackgroundPainer oldDelegate) {
    return (_baseColor != oldDelegate._baseColor);
  }
}

// Indicator Painter
class KycIndicatorPainter extends CustomPainter {
  final Color _baseColor;

  KycIndicatorPainter(Color baseColor)
      : assert(baseColor != null),
        this._baseColor = baseColor;

  @override
  void paint(Canvas canvas, Size size) {
    _drawLine(canvas, size);
    _drawTranslucentCircle(canvas, size);
    _drawOpaqueCircle(canvas, size);
  }

  // Rectangle Shape
  void _drawLine(Canvas canvas, Size size) {
    final topOffset = (size.height ~/ 2).toDouble();
    final start = Offset(0, topOffset);
    final end = Offset(size.width, topOffset);

    final paint = Paint()
      ..color = _baseColor
      ..strokeWidth = 2;

    canvas.drawLine(start, end, paint);
  }

  void _drawTranslucentCircle(Canvas canvas, Size size) {
    final topOffset = (size.height ~/ 2).toDouble();
    final leftOffset = (size.width ~/ 2).toDouble();
    final start = Offset(leftOffset, topOffset);

    final paint = Paint()..color = _baseColor.withAlpha(30);

    canvas.drawCircle(start, 14, paint);
  }

  void _drawOpaqueCircle(Canvas canvas, Size size) {
    final topOffset = (size.height ~/ 2).toDouble();
    final leftOffset = (size.width ~/ 2).toDouble();
    final start = Offset(leftOffset, topOffset);

    final paint = Paint()..color = _baseColor;
    canvas.drawCircle(start, 6, paint);
  }

  @override
  bool shouldRepaint(KycIndicatorPainter oldDelegate) {
    return (_baseColor != oldDelegate._baseColor);
  }
}
