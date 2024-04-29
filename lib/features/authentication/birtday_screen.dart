import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/view_models/signup_viewmodel.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_btn.dart';

class Birthday extends ConsumerStatefulWidget {
  const Birthday({super.key});

  @override
  ConsumerState<Birthday> createState() => _BirthdayState();
}

class _BirthdayState extends ConsumerState<Birthday> {
  final TextEditingController _birtdayContoller = TextEditingController();
  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    date = DateTime.now().subtract(const Duration(days: 365 * 10));
    _setTextField(date);
  }

  @override
  void dispose() {
    _birtdayContoller.dispose();
    super.dispose();
  }

  void _onEmail() {
    ref.read(signUpProvider.notifier).signUp(context);
  }

  void _setTextField(DateTime date) {
    final textDate = date.toString().split(' ').first;
    _birtdayContoller.value = TextEditingValue(text: textDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Sign Up',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              "When's your birtday?",
              style: TextStyle(
                fontSize: Sizes.size32,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v8,
            const Text(
              "Your birthday won't been shown publicly",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              enabled: false,
              controller: _birtdayContoller,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v20,
            GestureDetector(
              onTap: _onEmail,
              child: FormButton(
                disabled: ref.watch(signUpProvider).isLoading,
                text: 'Next',
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 300,
          child: CupertinoDatePicker(
            maximumDate: DateTime.now(),
            initialDateTime: date,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: _setTextField,
          ),
        ),
      ),
    );
  }
}
