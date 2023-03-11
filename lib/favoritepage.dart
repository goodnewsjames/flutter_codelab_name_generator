import 'package:flutter/material.dart';
import 'package:name_generator/main.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favoriteWords = appState.favorites;

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${favoriteWords.length} favorite wordpairs:'),
        ),
        for (var words in favoriteWords)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(words.asLowerCase),
          ),
        // ...favoriteWords.map((e) => Text(e.toString())).toList()
      ],
    );
  }
}
