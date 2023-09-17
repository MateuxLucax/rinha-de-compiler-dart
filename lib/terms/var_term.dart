import '../base_term.dart';
import '../cache.dart';

class VarTerm extends BaseTerm {
  final String key;

  VarTerm(this.key);

  factory VarTerm.parse(Map<String, dynamic> ast) {
    if (ast['kind'] != 'Var') throw Exception("Unknown term: ${ast['kind']}");

    final String? key = ast['text'];
    if (key == null) throw Exception("Invalid variable term: $ast");

    final dynamic value = Cache.get(key);

    if (value == null) {
      Cache.set(key, null);
    }

    return VarTerm(key);
  }

  @override
  dynamic call() {
    final dynamic value = Cache.get(key);
    if (value == null) throw Exception("Unknown variable: $key");
    return value;
  }
}
