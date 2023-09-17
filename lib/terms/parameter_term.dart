import '../base_term.dart';

class ParameterTerm extends BaseTerm {
  final String key;

  ParameterTerm(this.key);

  factory ParameterTerm.parse(Map<String, dynamic> ast) {
    if (ast['kind'] != 'Parameter') throw Exception("Unknown expression: ${ast['kind']}");

    final String? key = ast['text'];
    if (key == null) throw Exception("Invalid parameter expression: $ast");

    return ParameterTerm(key);
  }

  @override
  String call() {
    return key;
  }
}
