import 'package:hasura_connect/hasura_connect.dart';

class Api {
  HasuraConnect? hasuraConnect;

  graphqlConnect() {
    hasuraConnect = HasuraConnect(
        'https://swapi-graphql.netlify.com/.netlify/functions/index');
  }

  // Future<dynamic> mutation(String doc,
  //     {Map<String, dynamic> variables, bool tryAgain = true}) async {
  //   return hasuraConnect.mutation(doc,
  //       variables: variables, tryAgain: tryAgain);
  // }

  Future<dynamic> query(String doc, {Map<String, dynamic>? variables}) async {
    return hasuraConnect?.query(doc, variables: variables);
  }
}
