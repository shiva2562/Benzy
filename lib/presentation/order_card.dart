import 'package:benzy/model/report.dart';
import 'package:benzy/util/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderCard extends StatelessWidget {
  final Report report;
  const OrderCard(this.report, {super.key});

  Widget getStatusCard(Status status) {
    if (status == Status.canceled) {
      return const Text(
        "Cancelled",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      );
    } else if (status == Status.delivered) {
      return const Text(
        "Delivered",
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      );
    } else if (status == Status.pending) {
      return const Text(
        "Pending..",
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      );
    } else {
      return const Text(
        "No Order",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      );
    }
  }

  Widget buildStatusCard(String title, Status status) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title: ",
          style: UtilFunctions.getBoldSmallText(Colors.black),
        ),
        getStatusCard(status)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              report.date,
              style: UtilFunctions.getMediumText(Colors.black),
            ),
            const SizedBox(
              height: 15,
            ),
            buildStatusCard("breakfast", report.breakfast),
            buildStatusCard("lunch", report.lunch),
            buildStatusCard("dinner", report.dinner)
          ],
        ),
      ),
    );
  }
}
