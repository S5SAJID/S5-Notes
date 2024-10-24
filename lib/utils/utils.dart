import 'dart:io';

class Utils {
  static final bool isDesktop =
      Platform.isWindows | Platform.isMacOS | Platform.isLinux ? true : false;

  static String getFormatedDate(String dateString) {
    final date = DateTime.parse(dateString);
    const months = ['January', 'Febuary', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'Octobar', 'November', 'December'];
    return '${date.day} ${months[date.month-1]} ${date.year}';
  }
}
