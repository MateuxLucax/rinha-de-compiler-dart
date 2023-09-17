import 'base_term.dart';

class TreeInterpreter {
  void call(final Map<String, dynamic> astJson) {
    final BaseTerm Function(Map<String, dynamic>)? term = BaseTerm.terms[astJson['kind']];
    if (term == null) throw Exception("Unknown term: ${astJson['kind']}");

    final BaseTerm firstTerm = term(astJson);
    firstTerm();
  }
}
