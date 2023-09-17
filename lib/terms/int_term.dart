import '../base_term.dart';

class IntTerm extends BaseTerm {
  final int value;

  IntTerm(this.value);

  factory IntTerm.parse(Map<String, dynamic> ast) {
    if (ast['kind'] != 'Int') throw Exception("Unknown expression: ${ast['kind']}");

    return IntTerm(ast['value']);
  }

  @override
  int call() {
    return value;
  }
}
