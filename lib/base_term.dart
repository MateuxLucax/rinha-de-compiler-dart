import 'terms/binary_term.dart';
import 'terms/bool_term.dart';
import 'terms/call_term.dart';
import 'terms/function_term.dart';
import 'terms/if_term.dart';
import 'terms/int_term.dart';
import 'terms/let_term.dart';
import 'terms/print_term.dart';
import 'terms/string_term.dart';
import 'terms/var_term.dart';

abstract class BaseTerm {
  static const Map<String, BaseTerm Function(Map<String, dynamic>)> terms = <String, BaseTerm Function(Map<String, dynamic>)>{
    'Binary': BinaryTerm.parse,
    'Int': IntTerm.parse,
    'Print': PrintTerm.parse,
    'Str': StringTerm.parse,
    'Bool': BoolTerm.parse,
    'Let': LetTerm.parse,
    'Call': CallTerm.parse,
    'Var': VarTerm.parse,
    'Function': FunctionTerm.parse,
    'If': IfTerm.parse,
  };

  dynamic call();
}
