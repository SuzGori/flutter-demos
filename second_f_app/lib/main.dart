import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: PageA(),
    ),
  );
}

class PageA extends StatelessWidget {
  String gotoBData = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A画面'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'B画面に渡す値',
              ),
              onChanged: (text) {
                gotoBData = text;
              },
            ),
            ElevatedButton(
              child: Text('B画面に値渡し'),
              onPressed: () {
                // Navigator.of(context).push(_createRoute(nextVal));
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageB(gotoBData)))
                    .then((result) => {print(result)});
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Route _createRoute(String textData) {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => PageB(textData),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return child;
//     },
//   );
// }

class PageB extends StatelessWidget {
  // イニシャライザ
  PageB(this.paramText);
  // 以下を実装、受け渡し用のプロパティを定義
  final String paramText;
  String gotoAData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('A画面からいただいた値：' + paramText),
          TextField(
            decoration: InputDecoration(
              hintText: 'A画面に渡す値',
            ),
            onChanged: (text) {
              gotoAData = text;
            },
          ),
          RaisedButton(
            child: Text('A画面に値渡し'),
            onPressed: () {
              // Navigator.of(context).push(_createRoute(nextVal));
              // Navigator.pop(gotoAData);
              Navigator.of(context).pop(gotoAData);
            },
          ),
        ],
      ),
    );
  }
}
