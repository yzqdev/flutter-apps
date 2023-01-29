
class FlavorConfig {
  FlavorConfig._();

  static late final String _flavor;
  static String get flavor => _flavor;

  static late final String? _appStore;
  static String? get appStore => _appStore;

  static late final bool _shouldCheckForUpdatesByDefault;
  static bool get shouldCheckForUpdatesByDefault => _shouldCheckForUpdatesByDefault;

  static late final bool _dirty;
  /// If a build is dirty, it has commits that are ahead of the latest release.
  static bool get dirty => _dirty;

  static setup({
    String? flavor,
    String? appStore,
    bool? shouldCheckForUpdatesByDefault,
    bool? dirty,
  }) {
    _flavor = flavor ?? "";
    _appStore = appStore;
    _shouldCheckForUpdatesByDefault = shouldCheckForUpdatesByDefault ?? true;
    _dirty = dirty ?? false;
  }

}
