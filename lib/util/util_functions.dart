import 'package:benzy/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/report.dart';

class UtilFunctions {
  static List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  static int calculateFine(User user) {
    int total = 0;
    for (var i in user.reports) {
      if (i.breakfast == Status.pending) {
        total = total + 100;
      }
      if (i.lunch == Status.pending) {
        total = total + 100;
      }
      if (i.dinner == Status.pending) {
        total = total + 100;
      }
    }
    return total;
  }

  static Status convertStatusToEnum(String status) {
    if (status == 'Canceled') {
      return Status.canceled;
    } else if (status == 'Pending') {
      return Status.pending;
    } else if (status == 'Delivered') {
      return Status.delivered;
    } else {
      return Status.none;
    }
  }

  static TextStyle getBigText() {
    return const TextStyle(
        color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold);
  }

  static TextStyle getMediumText(Color color) {
    return TextStyle(color: color, fontSize: 23, fontWeight: FontWeight.bold);
  }

  static TextStyle getBoldSmallText(Color color) {
    return TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold);
  }
}
