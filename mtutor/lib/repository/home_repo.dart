import 'dart:async';

enum HomeView { def, Student, Teacher, Admin, Reports }

class HomeRepository {
  final _controller = StreamController<HomeView>();

  Stream<HomeView> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield HomeView.Student;
    yield* _controller.stream;
  }

  void studentOn() {
    _controller.add(HomeView.Student);
  }

  void teacherOn() {
    _controller.add(HomeView.Teacher);
  }

  void adminOn() {
    _controller.add(HomeView.Admin);
  }

  void ReportsOn() {
    _controller.add(HomeView.Reports);
  }

  void dispose() => _controller.close();
}
