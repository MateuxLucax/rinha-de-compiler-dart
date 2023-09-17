class Cache {
  static final Map<String, dynamic> _variables = <String, dynamic>{};

  static get all => _variables.entries;

  static set(String key, dynamic value) {
    _variables[key] = value;
  }

  static get(String key) => _variables[key];
}
