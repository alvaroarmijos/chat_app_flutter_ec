part of 'home_bloc.dart';

sealed class HomeEvent {}

class GetContactsEvent extends HomeEvent {}

class UpdateUserStatusEvent extends HomeEvent {
  final bool status;

  UpdateUserStatusEvent({required this.status});
}

class LogOutEvent extends HomeEvent {}
