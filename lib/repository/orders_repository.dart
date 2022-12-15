import 'package:benzy/model/user_model.dart';

import '../service/orders_api_handler.dart';

class OrdersRepository {
  final ApiHandler _helper = ApiHandler();
  Future<User> fetchOrders(int month) async {
    final response = await _helper.post("customer/report?month=$month");
    return User.fromJson(response);
  }
}
