import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/password_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_btn.dart';

class Email extends StatefulWidget {
  const Email({super.key});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final TextEditingController _emailController = TextEditingController();
  String _email = '';

  @override
  void initState() {
    super.initState();
    _emailController.addListener(
      () {
        setState(() {
          _email = _emailController.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;
    //validation of email
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return 'Email not  Valid';
    }
    return null;
  }

  void _onScafoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_email.isEmpty || _isEmailValid() != null) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Password(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScafoldTap,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
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
                "What's your Email?",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                onEditingComplete: _onSubmit,
                decoration: InputDecoration(
                  hintText: 'Email',
                  errorText: _isEmailValid(),
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
                onTap: _onSubmit,
                child: FormButton(
                  disabled: _email.isEmpty || _isEmailValid() != null,
                  text: 'Next',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
