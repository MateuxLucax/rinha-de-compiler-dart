import 'dart:convert';
import 'dart:io';

import 'package:dartify_rinha/tree_interpretor.dart';

/// If you wish to provide a custom path to the source file, you can do so by
/// passing it as the first argument to the program.
void main(List<String> arguments) {
  exitCode = 0;

  if (arguments.isEmpty) {
    arguments.add('/var/rinha/source.rinha.json');
  }

  final File file = File(arguments.first);
  final String content = file.readAsStringSync();
  final Map<String, dynamic> astJson = jsonDecode(content);

  final TreeInterpreter interpreter = TreeInterpreter(ast: astJson);
  interpreter();
}
