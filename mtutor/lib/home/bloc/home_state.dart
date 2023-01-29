part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState._({this.view = HomeView.def});

  const HomeState.def() : this._();

  const HomeState.Student() : this._(view: HomeView.Student);

  const HomeState.Teacher() : this._(view: HomeView.Teacher);

  const HomeState.Admin() : this._(view: HomeView.Admin);

  const HomeState.Reports() : this._(view: HomeView.Reports);

  final HomeView view;

  @override
  List<Object> get props => [view];
}
