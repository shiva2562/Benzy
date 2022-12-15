part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}

class LoadOrders extends OrderEvent {
  final int month;

  LoadOrders(this.month);
}
