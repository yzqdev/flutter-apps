part of 'teacher_bloc.dart';

class TeacherState extends Equatable {
  const TeacherState._({this.view = TeacherView.def});

  const TeacherState.def() : this._();

  const TeacherState.Profile() : this._(view: TeacherView.Profile);

  const TeacherState.Attendance() : this._(view: TeacherView.Attendance);

  const TeacherState.Syllabus() : this._(view: TeacherView.Syllabus);

  const TeacherState.Assets() : this._(view: TeacherView.Assets);

  final TeacherView view;

  @override
  List<Object> get props => [view];
}
