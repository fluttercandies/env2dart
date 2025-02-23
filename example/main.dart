import 'package:env2dart/env2dart.dart';

import 'env.g.dart';

void main() {
  parseAndGen(
    [
      '-o',
      './example/env.g.dart',
    ],
  );
  print(Env.$active);
}
