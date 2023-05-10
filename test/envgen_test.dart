import 'package:env2dart/env2dart.dart';
import 'package:test/test.dart';

void main() {
  test('test', () {
    parseAndGen(['-o', './example/env.g.dart', '-a', 'prod']);
  });
}
