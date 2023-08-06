import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GQLClientConfig {
  GQLClientConfig._() {
    _initializeGraphQLClient();
  }

  static final GQLClientConfig _instance = GQLClientConfig._();

  static GQLClientConfig get instance => _instance;

  final String _baseUrl = 'https://rickandmortyapi.com/graphql';
  late final ValueNotifier<GraphQLClient> clientNotifier;

  Future<void> _initializeGraphQLClient() async {
    final AuthLink authLink =
        AuthLink(getToken: () async => 'Bearer YOUR_BEARER_TOKEN');
    final HttpLink httpLink = HttpLink(_baseUrl);
    final Link link = authLink.concat(httpLink);

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );

    clientNotifier = ValueNotifier(client);
  }
}
