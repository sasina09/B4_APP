import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Survey extends StatefulWidget {
  @override
  _SurveyState createState()  => _SurveyState();
}
class _SurveyState extends State<Survey>{
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('lib/data/survey.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
return Scaffold(
        body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            print('id : $index');
                          },
                          child: Card(
                            margin: const EdgeInsets.all(10),
                            child: Container(
                              child: ListTile(
                                leading: Image(image: AssetImage('assets/images/survey.png'),height: 40,),
                                title: Text(_items[index]["name"],style: GoogleFonts.mitr()),
                                subtitle: Text(_items[index]["description"],style: GoogleFonts.mitr()),                          
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                  )
                : Container()
          ],
        ),
      ),
    );
  }

}