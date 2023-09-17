import '../base_term.dart';

class BoolTerm extends BaseTerm {
  final bool value;

  BoolTerm(this.value);

  factory BoolTerm.parse(Map<String, dynamic> ast) {
    if (ast['kind'] != 'Bool') throw Exception("Unknown expression: ${ast['kind']}");

    final bool? value = ast['value'];
    if (value == null) throw Exception("Invalid bool expression: $ast");

    return BoolTerm(value);
  }

  @override
  bool call() {
    return value;
  }
}
