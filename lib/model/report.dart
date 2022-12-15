import 'package:benzy/util/util_functions.dart';

class Report {
  final String _date;
  final Status _breakfast;
  final Status _lunch;
  final Status _dinner;

  Report(this._date, this._breakfast, this._lunch, this._dinner);

  factory Report.fromJson(Map<String, dynamic> json) {
    String date = json['date'];
    if (json['opt_ins'] is Map) {
      Status breakfast =
          UtilFunctions.convertStatusToEnum(json['opt_ins']["breakfast"]);
      Status lunch =
          UtilFunctions.convertStatusToEnum(json['opt_ins']["lunch"]);
      Status dinner =
          UtilFunctions.convertStatusToEnum(json['opt_ins']["dinner"]);
      return Report(date, breakfast, lunch, dinner);
    } else {
      return Report(date, Status.none, Status.none, Status.none);
    }
  }

  String get date => _date;
  Status get breakfast => _breakfast;
  Status get lunch => _lunch;
  Status get dinner => _dinner;
}

enum Status { delivered, canceled, pending, none }
