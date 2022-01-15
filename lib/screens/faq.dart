import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screen_test/model_class/faq_model.dart';

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  FaqModel? faqModel;
  bool isLoading = false;
  int selectedFaq = -1;

  @override
  void initState() {
    super.initState();

    getFaq();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("FAQ", style: TextStyle(fontSize: 16, color: Colors.blue)), centerTitle: true, backgroundColor: Colors.white, elevation: 0, iconTheme: IconThemeData(color: Colors.blue)),
      body: isLoading
          ? Center(child: Text("Loading"))
          : Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [headingWidget(), faqListWidget()],
              ),
            ),
    );
  }

  headingWidget() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text("Frequently Asked Questions", style: TextStyle(color: Colors.blue, fontSize: 18)),
    );
  }

  faqListWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: [for (int i = 0; i < faqModel!.data!.length; i++) faqList(i)],
      ),
    );
  }

  faqList(int i) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(faqModel!.data![i].question.toString(), style: TextStyle(fontSize: 14, color: Colors.black))),
              SizedBox(width: 5),
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (selectedFaq == i)
                        selectedFaq = -1;
                      else
                        selectedFaq = i;
                    });
                  },
                  color: Colors.black.withOpacity(0.4),
                  icon: selectedFaq == i ? Icon(Icons.remove_circle) : Icon(Icons.add_circle))
            ],
          ),
          if (selectedFaq == i)
            Container(margin: EdgeInsets.only(top: 10, bottom: 10), child: Text(faqModel!.data![i].answer.toString(), style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.4)))),
          Container(height: 1, color: Colors.blue, padding: EdgeInsets.symmetric(vertical: 5))
        ],
      ),
    );
  }

  getFaq() async {
    setState(() {
      isLoading = true;
    });

    String faqData = await DefaultAssetBundle.of(context).loadString("assets/faq.json");
    final jsonResult = jsonDecode(faqData);
    faqModel = FaqModel.fromJson(jsonResult);

    setState(() {
      isLoading = false;
    });
  }
}
