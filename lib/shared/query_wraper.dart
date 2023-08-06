import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class QueryWrapper extends StatelessWidget {
  const QueryWrapper({
    super.key,
    required this.query,
    required this.builder,
    this.variables,
  });

  final String query; // Use the query variable here
  final Map<String, dynamic>? variables;
  final Widget Function(QueryResult) builder;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(query), // Use the query variable here
        variables: variables ??
            const {'page': 3}, // Use the provided variables or set default
        onError: (error) {
          print('Network Error: $error');
          // Implement error handling here (e.g., show a Snackbar).
        },
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        print('Result : ${result.data}');
        if (result.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (result.hasException) {
          final errors = result.exception?.graphqlErrors;
          if (errors != null && errors.isNotEmpty) {
            for (final error in errors) {
              print('GraphQL Error: ${error.message}');
            }
          } else {
            print('GraphQL Error: ${result.exception}');
          }
          return Center(child: Text('Error: ${result.exception}'));
        } else {
          return builder(result);
        }
      },
    );
  }
}
