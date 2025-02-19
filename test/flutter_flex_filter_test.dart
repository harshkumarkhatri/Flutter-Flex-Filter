import 'package:flutter_flex_filter/flutter_flex_filter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late QueryParameterBuilder builder;

  setUp(() {
    builder = QueryParameterBuilder();
  });

  group('QueryParameterBuilder', () {
    test('addFilter builds correct filter string', () {
      final result = builder.addFilter(
        logicalOperand: LogicalOperand.and,
        priorityOrder: 0,
        propertyName: 'age',
        relationalOperand: RelationalOperand.greaterThan,
        value: 18,
      );
      expect(result, 'filters[\$and][0][age][\$gt]=18');
    });

    test('addFilter with different operands', () {
      final result = builder.addFilter(
        logicalOperand: LogicalOperand.or,
        priorityOrder: 1,
        propertyName: 'name',
        relationalOperand: RelationalOperand.contains,
        value: 'John',
      );
      expect(result, 'filters[\$or][1][name][\$contains]=John');
    });

    test('addSort builds correct sort string', () {
      final result = builder.addSort(
        propertyName: 'createdAt',
        priorityOrder: 0,
        order: 'desc',
      );
      expect(result, 'sort[0][createdAt]=desc');
    });

    test('addSearch builds correct search string', () {
      final result = builder.addSearch(
        priorityOrder: 0,
        propertyName: 'title',
        value: 'Flutter',
      );
      expect(result, 'search[0][title]=Flutter');
    });

    test('setPagination builds correct pagination string', () {
      final result = builder.setPagination(pageNumber: 2, limit: 20);
      expect(result, 'page[\$number]=2&page[\$limit]=20');
    });

    test('addReportParam builds correct CSV report string', () {
      final result = builder.addReportParam(csv: true);
      expect(result, 'report[\$csv]=true');
    });

    test('addReportParam builds correct Excel report string', () {
      final result = builder.addReportParam(excel: true);
      expect(result, 'report[\$excel]=true');
    });

    test(
        'addReportParam returns empty string when both csv and excel are false',
        () {
      final result = builder.addReportParam();
      expect(result, '');
    });

    test('addSoftDeleteParam builds correct soft delete string', () {
      final result = builder.addSoftDeleteParam(show: true);
      expect(result, 'delete[\$show]=true');
    });

    test('addCustomParam builds correct custom parameter string', () {
      final result = builder.addCustomParam(
          paramName: 'customField', value: 'customValue');
      expect(result, 'custom[customField]=customValue');
    });

    test('addFilter handles different value types', () {
      final stringResult = builder.addFilter(
        logicalOperand: LogicalOperand.and,
        priorityOrder: 0,
        propertyName: 'name',
        relationalOperand: RelationalOperand.equal,
        value: 'John Doe',
      );
      expect(stringResult, 'filters[\$and][0][name][\$eq]=John Doe');

      final intResult = builder.addFilter(
        logicalOperand: LogicalOperand.and,
        priorityOrder: 1,
        propertyName: 'age',
        relationalOperand: RelationalOperand.greaterThan,
        value: 30,
      );
      expect(intResult, 'filters[\$and][1][age][\$gt]=30');

      final boolResult = builder.addFilter(
        logicalOperand: LogicalOperand.and,
        priorityOrder: 2,
        propertyName: 'isActive',
        relationalOperand: RelationalOperand.equal,
        value: true,
      );
      expect(boolResult, 'filters[\$and][2][isActive][\$eq]=true');
    });
  });
}
