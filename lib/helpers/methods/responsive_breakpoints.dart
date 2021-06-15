enum Breakpoints {
  extraSmall,
  small,
  medium,
  large,
  extraLarge,
  extraExtraLarge,
}

class BreakpointsDetection {
  Breakpoints matchedBreakpoints;

  BreakpointsDetection(double deviceWidth) {
    if (deviceWidth < 576) {
      this.matchedBreakpoints = Breakpoints.extraSmall;
    } else if (deviceWidth >= 576 && deviceWidth < 768) {
      this.matchedBreakpoints = Breakpoints.small;
    } else if (deviceWidth >= 768 && deviceWidth < 992) {
      this.matchedBreakpoints = Breakpoints.medium;
    } else if (deviceWidth >= 992 && deviceWidth < 1200) {
      this.matchedBreakpoints = Breakpoints.large;
    } else if (deviceWidth >= 1200 && deviceWidth < 1400) {
      this.matchedBreakpoints = Breakpoints.extraLarge;
    } else if (deviceWidth >= 1400) {
      this.matchedBreakpoints = Breakpoints.extraExtraLarge;
    }
  }
}
