import 'dart:async';

enum TeacherView { def, Profile, Attendance, Syllabus, Assets }

class TeacherRepository {
  final _controller = StreamController<TeacherView>();

  Stream<TeacherView> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield TeacherView.Profile;
    yield* _controller.stream;
  }

  void ProfileOn() {
    _controller.add(TeacherView.Profile);
  }
  void attendanceOn() {
    _controller.add(TeacherView.Attendance);
  }
  void syllabusOn() {
    _controller.add(TeacherView.Syllabus);
  }
  void AssetsOn() {
    _controller.add(TeacherView.Assets);
  }

  void dispose() => _controller.close();
}
