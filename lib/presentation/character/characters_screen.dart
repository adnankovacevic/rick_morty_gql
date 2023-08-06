import 'package:flutter/material.dart';
import 'package:graphql_app/data/queries.dart';
import 'package:graphql_app/presentation/character/widgets/character_item.dart';
import 'package:graphql_app/presentation/providers/character_notifier.dart';
import 'package:graphql_app/shared/query_wraper.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    // Listen to scroll events
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
          // Top of the list
        } else {
          // Bottom of the list, load more characters
          CharacterNotifier.instance.loadMoreCharacters();
        }
      }
    });
    return Consumer<CharacterNotifier>(builder: (_, notifier, __) {
      Map<String, dynamic>? filterHelper;

      if (notifier.searchController.text.isNotEmpty) {
        filterHelper ??= {};
        filterHelper = {"name": '"${notifier.searchController.text}"'};
      }
      return Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: notifier.searchController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Search characters...',
            ),
            onChanged: (value) {
              notifier.resetState();
            },
          ),
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: notifier.currentPage,
              child: QueryWrapper(
                query: Queries.character(
                  name: notifier.searchController.text.isEmpty
                      ? null
                      : filterHelper,
                  page: notifier.currentPage,
                ),
                builder: (QueryResult result) {
                  final List<dynamic>? characters =
                      result.data?['characters']['results'];
                  if (characters == null) {
                    return const Center(child: Text('No data available'));
                  } else {
                    return ListView.builder(
                      controller: scrollController,
                      physics: const ClampingScrollPhysics(),
                      itemCount: characters.length,
                      itemBuilder: (context, index) {
                        final character = characters[index];
                        return CharacterItem(character: character);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        )),
      );
    });
  }
}
