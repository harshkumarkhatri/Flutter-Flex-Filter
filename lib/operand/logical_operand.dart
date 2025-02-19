class LogicalOperand {
  final String _value;

  const LogicalOperand._(this._value);

  static const LogicalOperand and = LogicalOperand._('and');
  static const LogicalOperand or = LogicalOperand._('or');

  @override
  String toString() => _value;
}
