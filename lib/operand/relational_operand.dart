class RelationalOperand {
  final String _value;

  const RelationalOperand._(this._value);

  static const RelationalOperand equal = RelationalOperand._('eq');
  static const RelationalOperand notEqual = RelationalOperand._('neq');
  static const RelationalOperand greaterThan = RelationalOperand._('gt');
  static const RelationalOperand greaterThanOrEqual =
      RelationalOperand._('gte');
  static const RelationalOperand lessThan = RelationalOperand._('lt');
  static const RelationalOperand lessThanOrEqual = RelationalOperand._('lte');
  static const RelationalOperand contains = RelationalOperand._('contains');
  static const RelationalOperand csvContains =
      RelationalOperand._('csvcontains');
  static const RelationalOperand listContains =
      RelationalOperand._('listcontains');
  static const RelationalOperand listNotContains =
      RelationalOperand._('listnotcontains');
  static const RelationalOperand notContains =
      RelationalOperand._('notcontains');
  static const RelationalOperand startsWith = RelationalOperand._('startswith');
  static const RelationalOperand endsWith = RelationalOperand._('endswith');
  static const RelationalOperand isNull = RelationalOperand._('isnull');
  static const RelationalOperand isNotNull = RelationalOperand._('isnotnull');
  static const RelationalOperand between = RelationalOperand._('between');
  static const RelationalOperand overlaps = RelationalOperand._('overlaps');
  static const RelationalOperand notOverlaps =
      RelationalOperand._('notoverlaps');

  @override
  String toString() => _value;
}
