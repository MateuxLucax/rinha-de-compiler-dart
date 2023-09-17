import '../base_term.dart';

class IfTerm extends BaseTerm {
  final BaseTerm condition;
  final BaseTerm then;
  final BaseTerm otherwise;

  IfTerm(this.condition, this.then, this.otherwise);

  factory IfTerm.parse(Map<String, dynamic> ast) {
    if (ast['kind'] != 'If') throw Exception("Unknown term: ${ast['kind']}");

    final Map<String, dynamic>? condition = ast['condition'];
    final Map<String, dynamic>? then = ast['then'];
    final Map<String, dynamic>? otherwise = ast['otherwise'];

    if (condition == null || then == null || otherwise == null) {
      throw Exception("Invalid if term: $ast");
    }

    final conditionTerm = BaseTerm.terms[condition['kind']];
    if (conditionTerm == null) throw Exception("Unknown term: ${condition['kind']}");

    final thenTerm = BaseTerm.terms[then['kind']];
    if (thenTerm == null) throw Exception("Unknown term: ${then['kind']}");

    final otherwiseTerm = BaseTerm.terms[otherwise['kind']];
    if (otherwiseTerm == null) throw Exception("Unknown term: ${otherwise['kind']}");

    return IfTerm(
      conditionTerm(ast['condition']),
      thenTerm(ast['then']),
      otherwiseTerm(ast['otherwise']),
    );
  }

  @override
  dynamic call() {
    final dynamic condition = this.condition();
    if (condition is bool) {
      if (condition) {
        return then();
      } else {
        return otherwise();
      }
    } else {
      throw Exception("Invalid condition: $condition");
    }
  }
}
