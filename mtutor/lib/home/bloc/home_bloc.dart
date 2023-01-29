import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/home_repo.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(const HomeState.def()) {
    on<HomeViewChanged>(_onViewChanged);
    _homeViewSubscription = _homeRepository.status.listen(
      (view) => add(HomeViewChanged(view)),
    );
  }

  final HomeRepository _homeRepository;
  late StreamSubscription<HomeView> _homeViewSubscription;

  @override
  Future<void> close() {
    _homeViewSubscription.cancel();
    _homeRepository.dispose();
    return super.close();
  }

  Future<void> _onViewChanged(
    HomeViewChanged event,
    Emitter<HomeState> emit,
  ) async {
    switch (event.view) {
      case HomeView.def:
        return emit(const HomeState.def());
      case HomeView.Student:
        return emit(const HomeState.Student());
      case HomeView.Teacher:
        return emit(const HomeState.Teacher());
      case HomeView.Admin:
        return emit(const HomeState.Admin());
      case HomeView.Reports:
        return emit(const HomeState.Reports());
    }
  }
}
