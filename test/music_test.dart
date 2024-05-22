import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:codelabs_soloud/resources/resources.dart';

void main() {
  test('music assets test', () {
    expect(File(Music.loopedSong).existsSync(), isTrue);
  });
}
