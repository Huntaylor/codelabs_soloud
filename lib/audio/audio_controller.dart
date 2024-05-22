import 'dart:async';

import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:logging/logging.dart';

class AudioController {
  static final Logger _log = Logger('AudioController');

  SoLoud? _soLoud;

  Future<void> initialize() async {
    _soLoud = SoLoud.instance;
    await _soLoud!.init();
  }

  void dispose() {
    _soLoud?.deinit();
  }

  Future<void> playSound(String assetKey) async {
    _log.warning('Not implemented yet.');
  }

  Future<void> startMusic() async {
    _log.warning('Not implemented yet.');
  }

  void fadeOutMusic() {
    _log.warning('Not implemented yet.');
  }

  void applyFilter() {
    // TODO
  }

  void removeFilter() {
    // TODO
  }
}
