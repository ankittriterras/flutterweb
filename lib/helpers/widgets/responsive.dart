import 'package:flutter/material.dart';
import 'package:kratos_flutter/helpers/methods/responsive_breakpoints.dart';

class Responsive extends StatefulWidget {
  final Widget fallBackChild;
  final Widget extraSmall;
  final Widget small;
  final Widget medium;
  final Widget large;
  final Widget extraLarge;
  final Widget extraExtraLarge;
  final bool isClamped;

  Responsive({
    Key key,
    @required this.fallBackChild,
    this.extraSmall,
    this.small,
    this.medium,
    this.large,
    this.extraLarge,
    this.extraExtraLarge,
    this.isClamped = false,
  });

  @override
  _ResponsiveState createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Breakpoints detection = BreakpointsDetection(screenWidth).matchedBreakpoints;

    if (!widget.isClamped) {
      switch (detection) {
        case Breakpoints.extraSmall:
          return widget.extraSmall ?? widget.fallBackChild;
          break;
        case Breakpoints.small:
          return widget.small ?? widget.extraSmall ?? widget.fallBackChild;
          break;
        case Breakpoints.medium:
          return widget.medium ?? widget.small ?? widget.extraSmall ?? widget.fallBackChild;
          break;
        case Breakpoints.large:
          return widget.large ?? widget.medium ?? widget.small ?? widget.extraSmall ?? widget.fallBackChild;
          break;
        case Breakpoints.extraLarge:
          return widget.extraLarge ?? widget.large ?? widget.medium ?? widget.small ?? widget.extraSmall ?? widget.fallBackChild;
          break;
        case Breakpoints.extraExtraLarge:
          return widget.extraExtraLarge ?? widget.extraLarge ?? widget.large ?? widget.medium ?? widget.small ?? widget.extraSmall ?? widget.fallBackChild;
          break;
        default:
          return widget.fallBackChild;
      }
    } else {
      switch (detection) {
        case Breakpoints.extraSmall:
          return widget.extraSmall ?? widget.fallBackChild;
          break;
        case Breakpoints.small:
          return widget.small ?? widget.fallBackChild;
          break;
        case Breakpoints.medium:
          return widget.medium ?? widget.fallBackChild;
          break;
        case Breakpoints.large:
          return widget.large ?? widget.fallBackChild;
          break;
        case Breakpoints.extraLarge:
          return widget.extraLarge ?? widget.fallBackChild;
          break;
        case Breakpoints.extraExtraLarge:
          return widget.extraExtraLarge ?? widget.fallBackChild;
          break;
        default:
          return widget.fallBackChild;
      }
    }
  }
}
