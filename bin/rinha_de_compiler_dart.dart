import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:rinha_de_compiler_dart/tree_interpretor.dart';

const String source = 'source';

void main(List<String> arguments) {
  exitCode = 0;
  final parser = ArgParser()..addFlag(source, negatable: false, abbr: 's');

  final ArgResults argResults = parser.parse(arguments);
  if (argResults[source] == null) {
    print('Usage: rinha_de_compiler_dart -s <source>');
    exitCode = 2;
    return;
  }

  final File file = File(argResults[source]);
  final String content = file.readAsStringSync();
  final Map<String, dynamic> astJson = jsonDecode(content);

  final TreeInterpreter interpreter = TreeInterpreter();
  interpreter(astJson);
}
