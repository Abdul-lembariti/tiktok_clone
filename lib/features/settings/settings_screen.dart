import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/common/widgets/video_config/video_config.dart';
import 'package:tiktok_clone/features/authentication/repos/authenticationrepo.dart';
import 'package:tiktok_clone/features/videos/view_modal/playback_vm.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Localizations.override(
      context: context,
      locale: const Locale('ko'),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(
          children: [
            SwitchListTile.adaptive(
              value: ref.watch(playBackConfigProvider).muted,
              onChanged: (value) => {
                ref.read(playBackConfigProvider.notifier).setMuted(value),
              },
              title: const Text('Mute Video'),
              subtitle: const Text('Video will be muted by default '),
            ),
            SwitchListTile.adaptive(
              value: ref.watch(playBackConfigProvider).autoPlay,
              onChanged: (value) =>
                  ref.read(playBackConfigProvider.notifier).setAutoPlay(value),
              title: const Text('AutoPlay'),
              subtitle: const Text('enable autoplay in ur videos'),
            ),
            ValueListenableBuilder(
              valueListenable: themeConfig,
              builder: (context, value, child) => SwitchListTile.adaptive(
                value: value,
                onChanged: (newValue) {
                  themeConfig.value = newValue;
                },
                title: const Text('Enable Darkmode'),
                subtitle: const Text('enable dark theme'),
              ),
            ),
            SwitchListTile.adaptive(
              value: false,
              onChanged: (value) {},
              title: const Text('Enable Notification'),
              subtitle: const Text('enable sound notification'),
            ),
            CheckboxListTile(
              value: false,
              onChanged: (value) {},
              title: const Text(
                'Social Mails',
              ),
              activeColor: Colors.black,
            ),
            ListTile(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2030),
                );
                if (kDebugMode) {
                  print(date);
                }
                final time = await showTimePicker(
                  // ignore: use_build_context_synchronously
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (kDebugMode) {
                  print(time);
                }
              },
              title: const Text(
                'Whats ur birtday?',
              ),
            ),
            ListTile(
              title: const Text('Log out (iOS)'),
              textColor: Colors.red,
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('Are you sure'),
                    content: const Text('Plz dont go'),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('No'),
                      ),
                      CupertinoDialogAction(
                        onPressed: () {
                          ref.read(authRepo).signOut();
                          context.go('/');
                        },
                        isDestructiveAction: true,
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Log out (Android)'),
              textColor: Colors.red,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Are you sure'),
                    content: const Text('Plz dont go'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Yex'),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Log out (iOS/Bottom)'),
              textColor: Colors.red,
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    title: const Text('Are you sure'),
                    actions: [
                      CupertinoActionSheetAction(
                        isDefaultAction: true,
                        onPressed: () {},
                        child: const Text('No'),
                      ),
                      CupertinoActionSheetAction(
                        isDefaultAction: true,
                        onPressed: () {},
                        child: const Text('Yex'),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              onTap: () => showAboutDialog(
                  context: context,
                  applicationVersion: '1.0',
                  applicationLegalese: 'All right reserved, Please dont copy'),
              title: const Text(
                'About',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: const Text(
                'About this app',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
