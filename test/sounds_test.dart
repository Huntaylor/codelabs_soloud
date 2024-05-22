import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:codelabs_soloud/resources/resources.dart';

void main() {
  test('sounds assets test', () {
    expect(File(Sounds.pew1).existsSync(), isTrue);
    expect(File(Sounds.pew2).existsSync(), isTrue);
    expect(File(Sounds.pew3).existsSync(), isTrue);
  });
}
