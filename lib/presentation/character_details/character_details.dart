import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({
    super.key,
    required this.character,
  });
  final dynamic character;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: character['name'],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(character['name']),
        ),
        body: Column(
          children: [
            Center(
              child: Image.network(
                character['image'],
                height: 210,
                width: 210,
              ),
            ),
            Text('Name: ${character['name']}'),
            Text('Gender: ${character['gender']}'),
            Text('Status: ${character['status']}'),
          ],
        ),
      ),
    );
  }
}
