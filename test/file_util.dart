import 'dart:convert';
import 'dart:io';

enum Resources {
  sum('sum.rinha.json');

  final String fileName;

  const Resources(this.fileName);

  String get path => 'test/resources/$fileName';

  Map<String, dynamic> get asJson {
    final File file = File(path);
    final String content = file.readAsStringSync();
    return jsonDecode(content);
  }
}
