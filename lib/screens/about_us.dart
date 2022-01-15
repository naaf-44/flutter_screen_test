import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screen_test/model_class/about_us_model.dart';
import 'package:flutter_screen_test/model_class/faq_model.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  AboutUsModel? aboutUsModel;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    getAboutUsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("About Us", style: TextStyle(fontSize: 16, color: Colors.blue)), centerTitle: true, backgroundColor: Colors.white, elevation: 0, iconTheme: IconThemeData(color: Colors.blue)),
      body: isLoading
          ? Center(child: Text("Loading"))
          : Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [aboutList()],
              ),
            ),
    );
  }

  aboutList() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          for (int i = 0; i < aboutUsModel!.data!.length; i++)
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(aboutUsModel!.data![i].heading.toString(), style: TextStyle(color: Colors.blue, fontSize: 20)),
                SizedBox(height: 10),
                Text(aboutUsModel!.data![i].details.toString(), style: TextStyle(color: Colors.black, fontSize: 12)),
                SizedBox(height: 20)
              ],
            ))
        ],
      ),
    );
  }

  getAboutUsData() async {
    setState(() {
      isLoading = true;
    });

    String aboutUsData = await DefaultAssetBundle.of(context).loadString("assets/about_us.json");
    final jsonResult = jsonDecode(aboutUsData);
    aboutUsModel = AboutUsModel.fromJson(jsonResult);

    setState(() {
      isLoading = false;
    });
  }
}
