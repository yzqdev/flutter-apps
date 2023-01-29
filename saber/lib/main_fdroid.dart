
import 'package:saber/data/flavor_config.dart';
import 'main_common.dart' as common;

void main() {
  FlavorConfig.setup(
    flavor: "F-Droid",
    appStore: "F-Droid",
    shouldCheckForUpdatesByDefault: false,
  );

  common.main();
}
