import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_test/screens/about_us.dart';
import 'package:flutter_screen_test/screens/faq.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', debugShowCheckedModeBanner: false, theme: ThemeData(primarySwatch: Colors.blue), home: MyHomePage(title: 'Flutter Demo Home Page'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double fullWidth = 0;

  @override
  Widget build(BuildContext context) {
    fullWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[faqButton(), aboutUsButton()]),
      ),
    );
  }

  faqButton() {
    return Container(
      child: InkWell(
        onTap: handleFaqPage,
        child: Container(
          width: fullWidth * 0.5,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: Colors.blue)),
          child: Text("FAQ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18)),
        ),
      ),
    );
  }

  aboutUsButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: handleAboutUs,
        child: Container(
          width: fullWidth * 0.5,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: Colors.blue)),
          child: Text("About Us", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18)),
        ),
      ),
    );
  }

  void handleFaqPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FAQ()));
  }

  void handleAboutUs() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
  }
}
