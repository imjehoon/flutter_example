import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';

//void main() => runApp(MyApp());
void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: RandomWord(),
    );
  }
}

class RandomWordsState extends State<RandomWord> {
  final _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>(); // 선택된 리스트를 저장하는 Set
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
            return ListTile(
              title: Text(
                pair.asCamelCase,
                style: _biggerFont,
              ),
            );
          });
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          // Add horizontal dividers, as shown below:
          return Scaffold(
            appBar: AppBar(
              title: Text('Save Suggestions'),
            ),
            body: ListView(
              children: divided,
            ),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair); // 이미 저장되었는지 확인

    debugPrint('movieTitle: $pair');

    ListTile a = ListTile(
      title: Text(
        pair.asCamelCase + ': 하이',
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
    debugPrint('movieTitle2: $a');

    return a;
  }
}

class RandomWord extends StatefulWidget {
  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   return RandomWordsState();
  // }

  @override
  State<StatefulWidget> createState() => RandomWordsState();
}
