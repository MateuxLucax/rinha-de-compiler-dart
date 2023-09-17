import '../base_term.dart';

class StringTerm extends BaseTerm {
  final String value;

  StringTerm(this.value);

  factory StringTerm.parse(Map<String, dynamic> ast) {
    if (ast['kind'] != 'Str') throw Exception("Unknown term: ${ast['kind']}");

    return StringTerm(ast['value']);
  }

  @override
  String call() {
    return value;
  }
}
