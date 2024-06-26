// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(value) => "${value}";

  static String m1(value) => "${value}";

  static String m2(value) => "${value}";

  static String m3(gender) =>
      "Log in ${Intl.gender(gender, female: 'madam', male: 'sir', other: 'human')}";

  static String m4(nameOfApp) => "Sign in for ${nameOfApp} account";

  static String m5(videoCount) =>
      "Create a profile, follow other accounts, make your own ${Intl.plural(videoCount, zero: 'no videos', one: 'video', other: 'videos')}, and more";

  static String m6(nameOfApp) => "Sign up for ${nameOfApp}";

  static String m7(value) => "${value}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "activity": MessageLookupByLibrary.simpleMessage("Activity"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an Account?"),
        "comment": MessageLookupByLibrary.simpleMessage(
            "Hello nice factory factory factory factory factory facto facto fy.."),
        "commentCount": m0,
        "commentLike": m1,
        "continueWithAppleButon":
            MessageLookupByLibrary.simpleMessage("Continue with Apple"),
        "discover": MessageLookupByLibrary.simpleMessage(
            "This is very long cap for the tiktok video uploadded currenty..... ereererre"),
        "emailPasswordButton":
            MessageLookupByLibrary.simpleMessage("Use email & password"),
        "inbox": MessageLookupByLibrary.simpleMessage("Inbox"),
        "likeCount": m2,
        "logIn": m3,
        "loginTitle": m4,
        "messageFromYourFollowersWillAppearHere":
            MessageLookupByLibrary.simpleMessage(
                "Message from your followers will appear here"),
        "newFollowers": MessageLookupByLibrary.simpleMessage("New followers"),
        "signUpSubTitle": m5,
        "signUpTitle": m6,
        "totalComment": m7
      };
}
