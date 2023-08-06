import 'package:flutter/material.dart';
import 'package:graphql_app/presentation/character/characters_screen.dart';
import 'package:graphql_app/presentation/providers/character_notifier.dart';
import 'package:graphql_app/util/graphql_client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CharacterNotifier.instance),
      ],
      child: MaterialApp(
        title: 'Rick & Morty',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: GraphQLProvider(
          client: GQLClientConfig.instance.clientNotifier,
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
