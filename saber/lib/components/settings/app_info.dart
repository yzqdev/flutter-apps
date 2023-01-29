
import 'package:collapsible/collapsible.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:saber/data/flavor_config.dart';
import 'package:saber/data/version.dart' show buildNumber;
import 'package:saber/i18n/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';


class AppInfo extends StatefulWidget {
  const AppInfo({super.key});

  static final Uri sponsorUrl = Uri.parse("https://github.com/sponsors/adil192");
  static final Uri privacyPolicyUrl = Uri.parse("https://github.com/adil192/saber/blob/main/privacy_policy.md");
  static final Uri licenseUrl = Uri.parse("https://github.com/adil192/saber/blob/main/LICENSE.md");
  static final Uri releasesUrl = Uri.parse("https://github.com/adil192/saber/releases");

  @override
  State<AppInfo> createState() => _AppInfoState();
}
class _AppInfoState extends State<AppInfo> {
  @override
  void initState() {
    getInfo().then((info) {
      setState(() {
        this.info = info;
      });
    });
    super.initState();
  }

  String info = "v$buildNumber";
  Future<String> getInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    List<String> info = [
      "v${packageInfo.version}",
      FlavorConfig.flavor,
      FlavorConfig.dirty ? t.appInfo.dirty : "",
      kDebugMode ? t.appInfo.debug : "",
      "($buildNumber)",
    ];

    return info.where((s) => s.isNotEmpty).join(" ");
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _showAboutDialog,
      child: Text(info),
    );
  }

  _showAboutDialog() => showAboutDialog(
    context: context,
    applicationVersion: info,
    applicationIcon: Image.asset(
      "assets/icon/icon.png",
      width: 50,
      height: 50,
    ),
    applicationLegalese: t.appInfo.licenseNotice,
    children: [
      const SizedBox(height: 10),
      TextButton(
        onPressed: () => launchUrl(
          AppInfo.sponsorUrl,
          mode: LaunchMode.externalApplication,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Text(t.appInfo.sponsorButton)
        ),
      ),
      TextButton(
        onPressed: () => launchUrl(
          AppInfo.licenseUrl,
          mode: LaunchMode.externalApplication,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Text(t.appInfo.licenseButton),
        ),
      ),
      TextButton(
        onPressed: () => launchUrl(
          AppInfo.privacyPolicyUrl,
          mode: LaunchMode.externalApplication,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Text(t.appInfo.privacyPolicyButton)
        ),
      ),
    ],
  );
}
