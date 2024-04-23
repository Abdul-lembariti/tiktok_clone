import 'package:flutter/foundation.dart';
import 'package:tiktok_clone/features/videos/models/playback_config.dart';
import 'package:tiktok_clone/features/videos/repository/videoplayback_repository.dart';

class PlayBackConfigViewModal extends ChangeNotifier {
  final VideoPlayBackConfigRep _repository;

  late final PlayBackConfigModal _modal = PlayBackConfigModal(
    autoPlay: _repository.isAutoPlay(),
    muted: _repository.isMuted(),
  );

  PlayBackConfigViewModal(this._repository);

  bool get muted => _modal.muted;
  bool get autoPlay => _modal.autoPlay;

  void setMuted(bool value) {
    _repository.setMuted(value);
    _modal.muted = value;
    notifyListeners();
  }

  void setAutoPlay(bool value) {
    _repository.setAutoPlay(value);
    _modal.autoPlay = value;
    notifyListeners();
  }
}
