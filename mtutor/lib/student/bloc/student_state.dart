part of 'student_bloc.dart';

class StudentState extends Equatable {
  const StudentState._({this.view = StudentView.def});

  const StudentState.def() : this._();

  const StudentState.Profile() : this._(view: StudentView.Profile);

  const StudentState.Learner() : this._(view: StudentView.Learner);

  const StudentState.QuestionBank() : this._(view: StudentView.QuestionBank);

  const StudentState.Assets() : this._(view: StudentView.Assets);

  final StudentView view;

  @override
  List<Object> get props => [view];
}
