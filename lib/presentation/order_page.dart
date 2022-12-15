import 'package:benzy/bloc/order_bloc/order_bloc.dart';
import 'package:benzy/presentation/order_card.dart';
import 'package:benzy/util/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    BlocProvider.of<OrderBloc>(context).add(LoadOrders(1));
    super.initState();
  }

  String monthValue = 'January';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Monthly Report"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Month:",
                    style: UtilFunctions.getBigText(),
                  ),
                  DropdownButton(
                      items: UtilFunctions.months
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style:
                                      UtilFunctions.getMediumText(Colors.blue),
                                ),
                              ))
                          .toList(),
                      value: monthValue,
                      onChanged: (val) {
                        setState(() {
                          monthValue = val ?? "";
                        });
                        BlocProvider.of<OrderBloc>(context).add(LoadOrders(
                            UtilFunctions.months.indexOf(monthValue) + 1));
                      }),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Center(
                  child: BlocBuilder<OrderBloc, OrderState>(
                      builder: ((context, state) {
                    if (state is OrdersLoaded) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Total Fine for this month: ",
                                style:
                                    UtilFunctions.getMediumText(Colors.black),
                              ),
                              Text(
                                UtilFunctions.calculateFine(state.user)
                                    .toString(),
                                style: UtilFunctions.getMediumText(Colors.red),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: ListView(
                              children: state.user.reports
                                  .map((e) => OrderCard(e))
                                  .toList(),
                            ),
                          ),
                        ],
                      );
                    } else if (state is OrdersError) {
                      return Text(state.error);
                    }
                    return const CircularProgressIndicator();
                  })),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
