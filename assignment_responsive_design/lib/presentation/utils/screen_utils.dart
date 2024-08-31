enum DeviceType { mobile, tablet, desktop }

class ScreenUtils {
  static const double mobileMaxSize = 639;
  static const double tabletMaxSize = 1007;
  static const double desktopMinSize = 1008;

  static DeviceType getDeviceType(double width) {
    if (width <= mobileMaxSize) {
      return DeviceType.mobile;
    } else if (width <= tabletMaxSize) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }
}
