part of 'teacher_bloc.dart';

abstract class TeacherEvent extends Equatable {
  const TeacherEvent();

  @override
  List<Object> get props => [];
}

class TeacherViewChanged extends TeacherEvent {
  const TeacherViewChanged(this.view);

  final TeacherView view;

  @override
  List<Object> get props => [view];
}

class AuthLogoutRequested extends TeacherEvent {}
