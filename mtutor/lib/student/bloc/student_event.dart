part of 'student_bloc.dart';

abstract class StudentEvent extends Equatable {
  const StudentEvent();

  @override
  List<Object> get props => [];
}

class StudentViewChanged extends StudentEvent {
  const StudentViewChanged(this.view);

  final StudentView view;

  @override
  List<Object> get props => [view];
}

class AuthLogoutRequested extends StudentEvent {}
