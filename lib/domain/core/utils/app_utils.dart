import 'dart:ui';

class AppUtils {
  static hexToColor(String hex) {
    hex = hex.replaceAll('#', ''); // Remove '#' if it exists
    if (hex.length == 6) {
      hex = 'FF$hex'; // Add the alpha value if not provided
    }
    return Color(int.parse(hex, radix: 16));
  }
}
