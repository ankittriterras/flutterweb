import 'package:flutter/material.dart';

class KycUiSection extends StatefulWidget {
  final RichText sectonTitle;
  final String sectionSubtitle;
  final Widget sectionContentWidget;
  const KycUiSection({Key key, this.sectonTitle, this.sectionSubtitle, this.sectionContentWidget}) : super(key: key);
  @override
  _KycUiSectionState createState() => _KycUiSectionState();
}

class _KycUiSectionState extends State<KycUiSection> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _KycUiSectionDecoration(Colors.grey[400]),
      child: Container(
        padding: EdgeInsets.fromLTRB(25, 0, 0, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.sectonTitle,
            (() {
              if (widget.sectionSubtitle != null && widget.sectionSubtitle != "") {
                return Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    widget.sectionSubtitle,
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                );
              } else
                return SizedBox.shrink();
            }()),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(top: 15),
              child: Container(
                child: widget.sectionContentWidget,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Indicator Painter
class _KycUiSectionDecoration extends CustomPainter {
  final Color _baseColor;

  _KycUiSectionDecoration(Color baseColor)
      : assert(baseColor != null),
        this._baseColor = baseColor;

  @override
  void paint(Canvas canvas, Size size) {
    _drawLine(canvas, size);
    _drawOpaqueCircle(canvas, size);
  }

  // Rectangle Shape
  void _drawLine(Canvas canvas, Size size) {
    final start = Offset(0, 10);
    final end = Offset(0, size.height);

    final paint = Paint()
      ..color = _baseColor
      ..strokeWidth = 1;

    canvas.drawLine(start, end, paint);
  }

  void _drawOpaqueCircle(Canvas canvas, Size size) {
    final start = Offset(0, 10);

    final paint = Paint()..color = _baseColor;
    canvas.drawCircle(start, 10, paint);
  }

  @override
  bool shouldRepaint(_KycUiSectionDecoration oldDelegate) {
    return (_baseColor != oldDelegate._baseColor);
  }
}
