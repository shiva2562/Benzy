import 'package:benzy/model/report.dart';

class User {
  final int _id;
  final String _fname;
  final String _lname;
  final String _phone;
  final String _email;
  final List<Report> _reports;

  User(this._id, this._fname, this._lname, this._phone, this._email,
      this._reports);

  factory User.fromJson(Map<String, dynamic> json) {
    int id = json['user']['id'];
    String fname = json['user']['f_name'];
    String lname = json['user']['l_name'];
    String phone = json['user']['phone'];
    String email = json['user']['email'];
    List<Report> reports = [];
    var items = json['reports'] as List;
    for (var element in items) {
      reports.add(Report.fromJson(element));
    }
    return User(id, fname, lname, phone, email, reports);
  }

  int get id => _id;
  String get fname => _fname;
  String get lname => _lname;
  String get phone => _phone;
  String get email => _email;
  List<Report> get reports => _reports;
}
