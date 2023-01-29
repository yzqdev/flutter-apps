part of 'admin_bloc.dart';

class AdminState extends Equatable {
  const AdminState._({this.view = AdminView.def});

  const AdminState.def() : this._();

  const AdminState.Profile() : this._(view: AdminView.Profile);

  const AdminState.Settings() : this._(view: AdminView.Settings);

  const AdminState.Reports() : this._(view: AdminView.Reports);

  const AdminState.Assets() : this._(view: AdminView.Assets);

  final AdminView view;

  @override
  List<Object> get props => [view];
}
