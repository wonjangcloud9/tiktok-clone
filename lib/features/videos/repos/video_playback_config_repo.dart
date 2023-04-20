import 'package:shared_preferences/shared_preferences.dart';

class VideoPlaybackConfigRepository {
  static const String _autoplay = "autoplay";
  static const String _muted = "muted";

  SharedPreferences _preferences;

  VideoPlaybackConfigRepository(this._preferences);

  Future<void> setMute(bool value) async {
    await _preferences.setBool(_muted, value);
  }

  Future<void> setAutoplay(bool value) async {
    await _preferences.setBool(_autoplay, value);
  }

  bool isMuted(){
    return _preferences.getBool(_muted) ?? false;
  }

  bool isAutoplay(){
    return _preferences.getBool(_autoplay) ?? false;
  }
}
