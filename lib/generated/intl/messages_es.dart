// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(value) => "${value}";

  static String m1(value) => "${value}";

  static String m2(value) => "${value}";

  static String m3(gender) => "Acceso";

  static String m5(videoCount) =>
      "Crea un perfil, sigue otras cuentas, crea tus propios videos y más";

  static String m6(nameOfApp) => "Regístrate en ${nameOfApp}";

  static String m7(value) => "${value}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "activity": MessageLookupByLibrary.simpleMessage("Actividad"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("¿Ya tienes una cuenta?"),
        "comment": MessageLookupByLibrary.simpleMessage(
            "Hola linda fábrica fábrica fábrica fábrica fábrica facto facto fy.."),
        "commentCount": m0,
        "commentLike": m1,
        "continueWithAppleButon":
            MessageLookupByLibrary.simpleMessage("Continuar con Apple"),
        "discover": MessageLookupByLibrary.simpleMessage(
            "Este es un límite muy largo para el video de Tiktok subido actualmente..... ereererre"),
        "emailPasswordButton": MessageLookupByLibrary.simpleMessage(
            "Usar correo electrónico y contraseña"),
        "inbox": MessageLookupByLibrary.simpleMessage("Bandeja de entrada"),
        "likeCount": m2,
        "logIn": m3,
        "messageFromYourFollowersWillAppearHere":
            MessageLookupByLibrary.simpleMessage(
                "El mensaje de tus seguidores aparecerá aquí."),
        "newFollowers":
            MessageLookupByLibrary.simpleMessage("Nuevos seguidores"),
        "signUpSubTitle": m5,
        "signUpTitle": m6,
        "totalComment": m7
      };
}
