library flutter_flex_filter;

import 'package:flutter_flex_filter/operand/logical_operand.dart';
import 'package:flutter_flex_filter/operand/relational_operand.dart';

export 'package:flutter_flex_filter/operand/logical_operand.dart';
export 'package:flutter_flex_filter/operand/relational_operand.dart';

class QueryParameterBuilder {
  /// Adds a filter to the query using logical and relational operands.
  String addFilter({
    required LogicalOperand logicalOperand,
    required int priorityOrder,
    required String propertyName,
    required RelationalOperand relationalOperand,
    // dynamic as it could be a string, int, bool etc.
    required dynamic value,
  }) {
    return 'filters[\$$logicalOperand][$priorityOrder][$propertyName][\$$relationalOperand]=$value';
  }

  /// Adds sorting criteria to the query.
  String addSort({
    required String propertyName,
    required int priorityOrder,
    // order values: asc or desc
    required String order,
  }) {
    return 'sort[$priorityOrder][$propertyName]=$order';
  }

  /// Adds a search parameter to the query.
  String addSearch({
    required int priorityOrder,
    required String propertyName,
    required String value,
  }) {
    return 'search[$priorityOrder][$propertyName]=$value';
  }

  /// Sets pagination parameters in the query.
  String setPagination({required int pageNumber, required int limit}) {
    return 'page[\$number]=$pageNumber&page[\$limit]=$limit';
  }

  /// Adds report parameters (CSV or Excel) to the query.
  String addReportParam({bool csv = false, bool excel = false}) {
    if (csv) {
      return 'report[\$csv]=true';
    } else if (excel) {
      return 'report[\$excel]=true';
    }
    return '';
  }

  /// Adds a soft delete parameter to the query.
  String addSoftDeleteParam({required bool show}) {
    return 'delete[\$show]=$show';
  }

  /// Adds custom parameters to the query.
  String addCustomParam({required String paramName, required dynamic value}) {
    return 'custom[$paramName]=$value';
  }
}
