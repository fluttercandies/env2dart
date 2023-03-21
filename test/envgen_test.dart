import 'package:envgen/envgen.dart';
import 'package:test/test.dart';

void main() {
  test('test', () {
    parseAndGen(["-o", "env", "-a", "prod"]);
  });
}
