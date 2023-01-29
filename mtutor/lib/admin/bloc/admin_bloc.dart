import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/admin_repo.dart';

part 'admin_event.dart';

part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc({required AdminRepository adminRepository})
      : _adminRepository = adminRepository,
        super(const AdminState.def()) {
    on<AdminViewChanged>(_onViewChanged);
    _adminViewSubscription = _adminRepository.status.listen(
      (view) => add(AdminViewChanged(view)),
    );
  }

  final AdminRepository _adminRepository;
  late StreamSubscription<AdminView> _adminViewSubscription;

  @override
  Future<void> close() {
    _adminViewSubscription.cancel();
    _adminRepository.dispose();
    return super.close();
  }

  Future<void> _onViewChanged(
    AdminViewChanged event,
    Emitter<AdminState> emit,
  ) async {
    switch (event.view) {
      case AdminView.def:
        return emit(const AdminState.def());
      case AdminView.Profile:
        return emit(const AdminState.Profile());
      case AdminView.Settings:
        return emit(const AdminState.Settings());
      case AdminView.Reports:
        return emit(const AdminState.Reports());
      case AdminView.Assets:
        return emit(const AdminState.Assets());
    }
  }
}
