part of 'admin_bloc.dart';

abstract class AdminEvent extends Equatable {
  const AdminEvent();

  @override
  List<Object> get props => [];
}

class AdminViewChanged extends AdminEvent {
  const AdminViewChanged(this.view);

  final AdminView view;

  @override
  List<Object> get props => [view];
}

class AuthLogoutRequested extends AdminEvent {}
