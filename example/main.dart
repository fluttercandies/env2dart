import 'package:env2dart/env2dart.dart';

import 'env.g.dart';

void main() => parseAndGen(["-o", "./lib/env.g.dart"]);

a(){
  var env = Env();
}
