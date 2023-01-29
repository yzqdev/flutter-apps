part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeViewChanged extends HomeEvent {
  const HomeViewChanged(this.view);

  final HomeView view;

  @override
  List<Object> get props => [view];
}

class HomeLogoutRequested extends HomeEvent {}
