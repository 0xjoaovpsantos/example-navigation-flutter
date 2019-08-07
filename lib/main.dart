import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  int index_page = 0;

  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  void pageChanged(int index) {
    setState(() {
      index_page = index;
    });
  }

  void onTapped(int index) {
    setState(() {
      index_page = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  Widget _pageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[Red(), Green(), Blue()],
    );
  }

  Widget _getBottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: index_page,
        onTap: (index) {
          onTapped(index);
        },
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.lightBlueAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text('Menu'),
              backgroundColor: Colors.lightBlueAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text('About'),
              backgroundColor: Colors.lightBlueAccent)
        ]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example Navigation with Flutter')),
      body: _pageView(),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }
}

class Red extends StatefulWidget {
  _Red createState() => _Red();
}

class _Red extends State<Red> {
  Widget build(BuildContext context) {
    return Container(color: Colors.red);
  }
}

class Green extends StatefulWidget {
  _Green createState() => _Green();
}

class _Green extends State<Green> {
  Widget build(BuildContext context) {
    return Container(color: Colors.green);
  }
}

class Blue extends StatefulWidget {
  _Blue createState() => _Blue();
}

class _Blue extends State<Blue> {
  Widget build(BuildContext context) {
    return Container(color: Colors.blue);
  }
}
