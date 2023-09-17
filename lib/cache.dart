import 'base_term.dart';

class Cache {
  static final Map<String, dynamic> variables = <String, dynamic>{};

  static final List<BaseTerm> _callStack = <BaseTerm>[];

  static void push(BaseTerm term) {
    _callStack.add(term);
  }

  static BaseTerm pop() {
    return _callStack.removeLast();
  }

  static BaseTerm peek() {
    return _callStack.last;
  }

  static bool get isNotEmpty => _callStack.isNotEmpty;
}
