import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {           
    return MaterialApp(
      title: 'Startup name generator',
      home: RandomWords(),
      routes: <String, WidgetBuilder> {
				'/a': (BuildContext context) => SecondRoute(),
			});
  }
}

class SecondRoute extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page')
      ),
      body: Center(child: RaisedButton(
        onPressed: () {
            Navigator.push(
            context, new MaterialPageRoute(
            builder: (context) => new RandomWords()));
        },
        child: Text('Go back home')
      ),),
    );
  }
}


class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  TabController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                title: Text('Startup Name Generator'),
                bottom: TabBar(
                  controller: controller,
                  tabs: <Widget>[
                  Tab(icon: Icon(Icons.cloud_download)),
                  Text('Second Tab')
                ],)
              ),
              body: TabBarView(
                controller: controller,
                children: <Widget>[
                  _buildSuggestions(),
                  SecondRoute(), 
                  ],
                )
            ),
    );
    }
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i) {
        if (i.isOdd) return Divider();
        final index = i~/2;
        if(index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

