import '../base_term.dart';
import '../cache.dart';

class LetTerm extends BaseTerm {
  final String name;
  final BaseTerm value;
  final BaseTerm next;

  LetTerm(this.name, this.value, this.next);

  factory LetTerm.parse(Map<String, dynamic> ast) {
    if (ast['kind'] != 'Let') throw Exception("Unknown term: ${ast['kind']}");

    final String? name = ast['name']['text'];
    if (name == null) throw Exception("Invalid let term: $ast");

    final LetTerm? cached = Cache.get(name);
    if (cached != null) {
      return cached;
    }

    final valueTermKey = ast['value']['kind'];
    final BaseTerm Function(Map<String, dynamic>)? valueTerm = BaseTerm.terms[valueTermKey];
    if (valueTerm == null) throw Exception("Unknown term: $valueTerm");

    final nextTermKey = ast['next']['kind'];
    final BaseTerm Function(Map<String, dynamic>)? nextTerm = BaseTerm.terms[nextTermKey];
    if (nextTerm == null) throw Exception("Unknown term: $nextTerm");

    final LetTerm letTerm = LetTerm(name, valueTerm(ast['value']), nextTerm(ast['next']));
    Cache.set(name, letTerm);

    return letTerm;
  }

  @override
  dynamic call() {
    Cache.set(name, value);
    return next();
  }
}
