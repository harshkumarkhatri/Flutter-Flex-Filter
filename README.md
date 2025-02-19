# Flutter Flex Filter

`flutter_flex_filter` is a Dart package that provides a flexible and type-safe way to construct query parameters for various filter, sort, search, pagination, and custom operations in your Flutter applications.

## Features

- **Flexible Filters:** Easily add filters to your queries with logical and relational operands.
- **Sorting:** Specify sort criteria to order your results.
- **Search:** Add search parameters to narrow down your data.
- **Pagination:** Handle pagination with ease by setting the page number and limit.
- **Report Parameters:** Generate CSV or Excel reports with simple parameters.
- **Soft Delete Handling:** Include soft delete parameters in your queries.
- **Custom Parameters:** Add any custom parameters to your queries as needed.

## Installation
### Install from pub.dev
Add `flutter_flex_filter` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_flex_filter: ^1.0.0
```

### Install through git
```yaml
dependencies:
  flutter_flex_filter:
    git:
      url: https://github.com/your-username/flutter_flex_filter.git
```
Replace your-username with the actual GitHub username.

Then, run flutter pub get to install the package.

## Usage
Import the package
```dart
import 'package:flutter_flex_filter/flutter_flex_filter.dart';
```

## Example Usage
#### Adding Filters
```dart
final queryBuilder = QueryParameterBuilder();
String filterQuery = queryBuilder.addFilter(
  logicalOperand: LogicalOperand.and,
  filterOrder: 0,
  propertyName: 'created_at',
  relationalOperand: RelationalOperand.between,
  value: '2023-08-05T17:40:00+05:30,2023-09-10T17:40:00+05:30',
);

print(filterQuery); 
// Output: filters[$and][0][created_at][$between]=2023-08-05T17:40:00+05:30,2023-09-10T17:40:00+05:30

```

#### Adding Sort Criteria
```dart
String sortQuery = queryBuilder.addSort(
  propertyName: 'created_at',
  sortOrder: 0,
  order: 'asc',
);

print(sortQuery); 
// Output: sort[0][created_at]=asc
```

#### Adding Search Parameters
```dart
String searchQuery = queryBuilder.addSearch(
  searchOrder: 0,
  propertyName: 'name',
  value: 'John Doe',
);

print(searchQuery); 
// Output: search[0][name]=John Doe
```

#### Pagination
```dart
String paginationQuery = queryBuilder.setPagination(
  pageNumber: 1,
  limit: 20,
);

print(paginationQuery); 
// Output: page[$number]=1&page[$limit]=20
```

#### Report Parameters
```dart
String reportQuery = queryBuilder.addReportParam(csv: true);

print(reportQuery); 
// Output: report[$csv]=true
```

#### Soft Delete
```dart
String softDeleteQuery = queryBuilder.addSoftDeleteParam(show: true);

print(softDeleteQuery); 
// Output: delete[$show]=true
```

#### Custom Parameters
```dart
String customQuery = queryBuilder.addCustomParam(
  paramName: 'customParam',
  value: 'customValue',
);

print(customQuery); 
// Output: custom[customParam]=customValue
```

## Contributing
Contributions are welcome! Please feel free to submit a pull request or open an issue.

## License
This project is licensed under the MIT License - see the LICENSE file for details.