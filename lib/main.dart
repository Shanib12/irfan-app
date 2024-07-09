import 'package:flutter/material.dart';

import 'new page/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showImage = false;

  void _toggleImage() {
    setState(() {
      _showImage = !_showImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(221, 0, 0, 0),
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Named Routes'),
      ),
      body: Column(
        children: [
          _showImage
              ? Image.asset(
                  'assets/flutter_img.jpg', 
                  width: 350,
                )
              : Container(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Newscreen()),
              );
            },
            child: Text('Product Page'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleImage,
        child: Icon(Icons.image),
      ),
    );
  }
}

class Newscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
      ),
      body: Center(
        child: Text('Welcome to the product page!'),
      ),
    );
  }
}
