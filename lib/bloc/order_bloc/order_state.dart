part of 'order_bloc.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrdersLoading extends OrderState {}

class OrdersLoaded extends OrderState {
  final User user;

  OrdersLoaded(this.user);
}

class OrdersError extends OrderState {
  final String error;

  OrdersError(this.error);
}
