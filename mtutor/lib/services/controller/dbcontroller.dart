import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DbController extends GetxController {
  final dbStore = GetStorage();

  bool get isLogged => dbStore.read('isLogged') ?? false;

  String get usrName => dbStore.read('UserName') ?? '';
}
