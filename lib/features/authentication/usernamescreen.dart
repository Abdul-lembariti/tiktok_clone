import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_btn.dart';

class Username extends StatefulWidget {
  const Username({super.key});

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  final TextEditingController _usernameContoller = TextEditingController();
  String _username = '';

  @override
  void initState() {
    super.initState();
    _usernameContoller.addListener(
      () {
        setState(() {
          _username = _usernameContoller.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _usernameContoller.dispose();
    super.dispose();
  }

  void _onEmail() {
    if (_username.isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Email(username: _username),
      ),
    );
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Gaps.v40,
            const Text(
              'Create a username',
              style: TextStyle(
                fontSize: Sizes.size32,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v8,
            const Text(
              'You can always change this later',
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: _usernameContoller,
                decoration: InputDecoration(
                  hintText: 'Username',
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
            ),
            Gaps.v20,
            GestureDetector(
              onTap: _onEmail,
              child: FormButton(
                disabled: _username.isEmpty,
                text: 'Next',
              ),
            )
          ],
        ),
      ),
    );
  }
}
