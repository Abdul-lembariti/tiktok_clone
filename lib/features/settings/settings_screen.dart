import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/common/widgets/video_config/video_config.dart';
import 'package:tiktok_clone/features/videos/view_modal/playback_vm.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notification = false;

  void _onNotification(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notification = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              value: context.watch<PlayBackConfigViewModal>().muted,
              onChanged: (value) =>
                  context.read<PlayBackConfigViewModal>().setMuted(value),
              title: const Text('Mute Video'),
              subtitle: const Text('Video will be muted by default '),
            ),
            SwitchListTile.adaptive(
              value: context.watch<PlayBackConfigViewModal>().autoPlay,
              onChanged: (value) =>
                  context.read<PlayBackConfigViewModal>().setAutoPlay(value),
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
              value: _notification,
              onChanged: _onNotification,
              title: const Text('Enable Notification'),
              subtitle: const Text('enable sound notification'),
            ),
            CheckboxListTile(
              value: _notification,
              onChanged: _onNotification,
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
                if (!mounted) return;
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
                        onPressed: () => Navigator.of(context).pop(),
                        isDestructiveAction: true,
                        child: const Text('Yex'),
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
