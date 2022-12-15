import 'package:benzy/repository/orders_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/user_model.dart';
import '../../service/exceptions.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrdersRepository _ordersRepository = OrdersRepository();
  OrderBloc() : super(OrderInitial()) {
    on<LoadOrders>((event, emit) async {
      emit(OrdersLoading());
      try {
        User user = await _ordersRepository.fetchOrders(event.month);
        emit(OrdersLoaded(user));
      } catch (error) {
        emit(error is AppException
            ? OrdersError(error.toString())
            : OrdersError('something went wrong'));
      }
    });
  }
}
