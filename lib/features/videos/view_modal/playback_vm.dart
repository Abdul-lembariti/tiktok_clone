import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/playback_config.dart';
import 'package:tiktok_clone/features/videos/repository/videoplayback_repository.dart';

class PlayBackConfigViewModal extends Notifier<PlayBackConfigModal> {
  final VideoPlayBackConfigRep _repository;

  PlayBackConfigViewModal(this._repository);

  void setMuted(bool value) {
    _repository.setMuted(value);
    state = PlayBackConfigModal(
      autoPlay: state.autoPlay,
      muted: value,
    );
  }

  void setAutoPlay(bool value) {
    _repository.setAutoPlay(value);
    state = PlayBackConfigModal(
      autoPlay: value,
      muted: state.muted,
    );
  }

  @override
  PlayBackConfigModal build() {
    return PlayBackConfigModal(
      autoPlay: _repository.isAutoPlay(),
      muted: _repository.isMuted(),
    );
  }
}

final playBackConfigProvider =
    NotifierProvider<PlayBackConfigViewModal, PlayBackConfigModal>(
  () => throw UnimplementedError(),
);
