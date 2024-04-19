// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign up for {nameOfApp} {when}`
  String signUpTitle(String nameOfApp, Object when) {
    return Intl.message(
      'Sign up for $nameOfApp $when',
      name: 'signUpTitle',
      desc: 'The title people see when they open the app.',
      args: [nameOfApp, when],
    );
  }

  /// `Sign in for {nameOfApp} account`
  String loginTitle(String nameOfApp, DateTime when) {
    final DateFormat whenDateFormat = DateFormat.y(Intl.getCurrentLocale());
    final String whenString = whenDateFormat.format(when);

    return Intl.message(
      'Sign in for $nameOfApp account',
      name: 'loginTitle',
      desc: 'The title people see when they open the login screen.',
      args: [nameOfApp, whenString],
    );
  }

  /// `Create a profile, follow other accounts, make your own {videoCount, plural, =0{no videos} =1{video} other{videos}}, and more`
  String signUpSubTitle(num videoCount) {
    return Intl.message(
      'Create a profile, follow other accounts, make your own ${Intl.plural(videoCount, zero: 'no videos', one: 'video', other: 'videos')}, and more',
      name: 'signUpSubTitle',
      desc: '',
      args: [videoCount],
    );
  }

  /// `Use email & password`
  String get emailPasswordButton {
    return Intl.message(
      'Use email & password',
      name: 'emailPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Apple`
  String get continueWithAppleButon {
    return Intl.message(
      'Continue with Apple',
      name: 'continueWithAppleButon',
      desc: '',
      args: [],
    );
  }

  /// `Already have an Account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an Account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log in {gender, select, male{sir} female{madam} other{human}}`
  String logIn(String gender) {
    return Intl.message(
      'Log in ${Intl.gender(gender, male: 'sir', female: 'madam', other: 'human')}',
      name: 'logIn',
      desc: '',
      args: [gender],
    );
  }

  /// `{value}`
  String likeCount(int value) {
    final NumberFormat valueNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      '$valueString',
      name: 'likeCount',
      desc: 'Any thing u want',
      args: [valueString],
    );
  }

  /// `{value}`
  String commentCount(int value) {
    final NumberFormat valueNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      '$valueString',
      name: 'commentCount',
      desc: 'Any thing u want',
      args: [valueString],
    );
  }

  /// `{value}`
  String totalComment(int value) {
    final NumberFormat valueNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      '$valueString',
      name: 'totalComment',
      desc: 'Any thing u want',
      args: [valueString],
    );
  }

  /// `{value}`
  String commentLike(int value) {
    final NumberFormat valueNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      '$valueString',
      name: 'commentLike',
      desc: 'Any thing u want',
      args: [valueString],
    );
  }

  /// `Hello nice factory factory factory factory factory facto facto fy..`
  String get comment {
    return Intl.message(
      'Hello nice factory factory factory factory factory facto facto fy..',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `This is very long cap for the tiktok video uploadded currenty..... ereererre`
  String get discover {
    return Intl.message(
      'This is very long cap for the tiktok video uploadded currenty..... ereererre',
      name: 'discover',
      desc: '',
      args: [],
    );
  }

  /// `Inbox`
  String get inbox {
    return Intl.message(
      'Inbox',
      name: 'inbox',
      desc: '',
      args: [],
    );
  }

  /// `Activity`
  String get activity {
    return Intl.message(
      'Activity',
      name: 'activity',
      desc: '',
      args: [],
    );
  }

  /// `New followers`
  String get newFollowers {
    return Intl.message(
      'New followers',
      name: 'newFollowers',
      desc: '',
      args: [],
    );
  }

  /// `Message from your followers will appear here`
  String get messageFromYourFollowersWillAppearHere {
    return Intl.message(
      'Message from your followers will appear here',
      name: 'messageFromYourFollowersWillAppearHere',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
