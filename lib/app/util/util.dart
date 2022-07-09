

import 'package:intl/intl.dart';

class Utils {
  static String getImagePath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  static String convertDate(int? timeStamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp!);
    var format = DateFormat.yMMMMd();
    var dateString = format.format(date);
    return dateString;
  }

  //return true if the decimal value is greater than 0 else return false
  static bool checkIfTheDecimalIsGreaterThanZero(String string) {
    RegExp reg1 = RegExp(r'(^[1-9](?:\.[1-9])?$)');
    if (reg1.stringMatch(string) != null) {
      return true;
    }
    return false;
  }
}
