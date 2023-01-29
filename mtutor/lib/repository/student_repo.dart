import 'dart:async';

enum StudentView { def, Profile, Learner, QuestionBank, Assets }

class StudentRepository {
  final _controller = StreamController<StudentView>();

  Stream<StudentView> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield StudentView.Profile;
    yield* _controller.stream;
  }

  void ProfileOn() {
    _controller.add(StudentView.Profile);
  }

  void learnerOn() {
    _controller.add(StudentView.Learner);
  }

  void qbOn() {
    _controller.add(StudentView.QuestionBank);
  }

  void AssetsOn() {
    _controller.add(StudentView.Assets);
  }

  void dispose() => _controller.close();
}
