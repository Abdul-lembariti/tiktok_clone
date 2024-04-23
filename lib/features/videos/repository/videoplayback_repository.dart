import 'package:shared_preferences/shared_preferences.dart';

class VideoPlayBackConfigRep {
  static const String _autoPlay = 'autoplay';
  static const String _muted = 'muted';

  final SharedPreferences _preferences;

  VideoPlayBackConfigRep(this._preferences);

  Future<void> setMuted(bool value) async {
    _preferences.setBool(_muted, value);
  }

  Future<void> setAutoPlay(bool value) async {
    _preferences.setBool(_autoPlay, value);
  }

  bool isMuted(){
    return _preferences.getBool(_muted) ?? false;
  }

  bool isAutoPlay(){
    return _preferences.getBool(_autoPlay) ?? false;
  }
}
