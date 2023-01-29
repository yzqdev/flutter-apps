import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/teacher_repo.dart';

part 'teacher_event.dart';

part 'teacher_state.dart';

class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  TeacherBloc({required TeacherRepository teacherRepository})
      : _teacherRepository = teacherRepository,
        super(const TeacherState.def()) {
    on<TeacherViewChanged>(_onViewChanged);
    _teacherViewSubscription = _teacherRepository.status.listen(
      (view) => add(TeacherViewChanged(view)),
    );
  }

  final TeacherRepository _teacherRepository;
  late StreamSubscription<TeacherView> _teacherViewSubscription;

  @override
  Future<void> close() {
    _teacherViewSubscription.cancel();
    _teacherRepository.dispose();
    return super.close();
  }

  Future<void> _onViewChanged(
    TeacherViewChanged event,
    Emitter<TeacherState> emit,
  ) async {
    switch (event.view) {
      case TeacherView.def:
        return emit(const TeacherState.def());
      case TeacherView.Profile:
        return emit(const TeacherState.Profile());
      case TeacherView.Attendance:
        return emit(const TeacherState.Attendance());
      case TeacherView.Syllabus:
        return emit(const TeacherState.Syllabus());
      case TeacherView.Assets:
        return emit(const TeacherState.Assets());
    }
  }
}
