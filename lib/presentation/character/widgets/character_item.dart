import 'package:flutter/material.dart';
import 'package:graphql_app/presentation/character_details/character_details.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    super.key,
    required this.character,
  });

  final dynamic character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetails(character: character),
          ),
        );
      },
      child: Hero(
        tag: character['name'],
        child: Container(
          height: 100,
          padding: const EdgeInsets.only(top: 20, left: 20),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black26, width: 0.4),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // CircleAvatar(
              //   radius: 50,
              //   backgroundImage:
              //       CachedNetworkImageProvider(film['image']),
              // ),
              Image.network(
                character['image'],
                height: 54,
                width: 54,
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(character['name']),
                  Text(character['status']),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
