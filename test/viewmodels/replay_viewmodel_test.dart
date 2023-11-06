import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ReplayViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
