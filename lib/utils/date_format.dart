import 'package:intl/intl.dart';

class DateFormatter {
  static getFormatedDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('MMMM dd, yyyy');
    return outputFormat.format(inputDate);
  }
}
