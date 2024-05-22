import 'dart:async';

import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:logging/logging.dart';

class AudioController {
  static final Logger _log = Logger('AudioController');

  SoLoud? _soLoud;

  SoundHandle? _musicHandle;

  Future<void> initialize() async {
    _soLoud = SoLoud.instance;
    await _soLoud!.init();
  }

  void dispose() {
    _soLoud?.deinit();
  }

  Future<void> playSound(String assetKey) async {
    try {
      final source = await _soLoud!.loadAsset(assetKey);
      await _soLoud!.play(source);
    } catch (e) {
      _log.severe("Cannot play sound '$assetKey'. Ignoring.", e);
    }
  }

  Future<void> startMusic() async {
    if (_musicHandle != null) {
      if (_soLoud!.getIsValidVoiceHandle(_musicHandle!)) {
        _log.info('Music is already playing. Stopping first.');
        await _soLoud!.stop(_musicHandle!);
      }
    }
    final musicSource = await _soLoud!.loadAsset(
      'assets/music/looped-song.ogg',
      mode: LoadMode.disk,
    );
    musicSource.allInstancesFinished.first.then((_) {
      _soLoud!.disposeSource(musicSource);
      _log.info('Music source disposed');
      _musicHandle = null;
    });
    _musicHandle = await _soLoud!.play(
      musicSource,
      volume: 0.6,
      looping: true,
      loopingStartAt: const Duration(seconds: 25, milliseconds: 43),
    );
  }

  void fadeOutMusic() {
    if (_musicHandle == null) {
      _log.info('Nothing to fade out');
      return;
    }
    const length = Duration(seconds: 5);
    _soLoud!.fadeVolume(_musicHandle!, 0, length);
    _soLoud!.scheduleStop(_musicHandle!, length);
  }

  void applyFilter() {
    // TODO
  }

  void removeFilter() {
    // TODO
  }
}
