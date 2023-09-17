import '../base_term.dart';
import '../cache.dart';

class VarTerm extends BaseTerm {
  final String key;

  VarTerm(this.key);

  factory VarTerm.parse(Map<String, dynamic> ast) {
    if (ast['kind'] != 'Var') throw Exception("Unknown expression: ${ast['kind']}");

    final String? key = ast['text'];
    if (key == null) throw Exception("Invalid variable expression: $ast");

    Cache.variables[key] = null;

    return VarTerm(key);
  }

  @override
  dynamic call() {
    print(Cache.variables[key].runtimeType);
    return Cache.variables[key];
  }
}
