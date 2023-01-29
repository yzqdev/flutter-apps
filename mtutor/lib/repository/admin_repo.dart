import 'dart:async';

enum AdminView { def, Profile, Settings, Reports, Assets }

class AdminRepository {
  final _controller = StreamController<AdminView>();

  Stream<AdminView> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AdminView.Profile;
    yield* _controller.stream;
  }

  void ProfileOn() {
    _controller.add(AdminView.Profile);
  }

  void SettingsOn() {
    _controller.add(AdminView.Settings);
  }

  void ReportsOn() {
    _controller.add(AdminView.Reports);
  }

  void AssetsOn() {
    _controller.add(AdminView.Assets);
  }

  void dispose() => _controller.close();
}
