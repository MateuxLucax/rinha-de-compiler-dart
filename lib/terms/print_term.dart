import '../base_term.dart';

class PrintTerm extends BaseTerm {
  final BaseTerm value;

  PrintTerm(this.value);

  @override
  factory PrintTerm.parse(Map<String, dynamic> ast) {
    if (ast['kind'] != 'Print') throw Exception("Unknown term: ${ast['kind']}");

    final valueTerm = ast['value']['kind'];
    final BaseTerm Function(Map<String, dynamic>)? term = BaseTerm.terms[valueTerm];
    if (term == null) throw Exception("Unknown term: $term");

    return PrintTerm(term(ast['value']));
  }

  @override
  dynamic call() {
    print(value());
  }
}
