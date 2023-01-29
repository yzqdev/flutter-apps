import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/student_repo.dart';

part 'student_event.dart';

part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc({required StudentRepository studentRepository})
      : _studentRepository = studentRepository,
        super(const StudentState.def()) {
    on<StudentViewChanged>(_onViewChanged);
    _studentViewSubscription = _studentRepository.status.listen(
      (view) => add(StudentViewChanged(view)),
    );
  }

  final StudentRepository _studentRepository;
  late StreamSubscription<StudentView> _studentViewSubscription;

  @override
  Future<void> close() {
    _studentViewSubscription.cancel();
    _studentRepository.dispose();
    return super.close();
  }

  Future<void> _onViewChanged(
    StudentViewChanged event,
    Emitter<StudentState> emit,
  ) async {
    switch (event.view) {
      case StudentView.def:
        return emit(const StudentState.def());
      case StudentView.Profile:
        return emit(const StudentState.Profile());
      case StudentView.Learner:
        return emit(const StudentState.Learner());
      case StudentView.QuestionBank:
        return emit(const StudentState.QuestionBank());
      case StudentView.Assets:
        return emit(const StudentState.Assets());
    }
  }
}
