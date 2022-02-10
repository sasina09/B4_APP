import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:b4together/page/activitys/announcement_Page.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SubAnnouncement extends StatefulWidget {
  @override
  _SubAnnouncementState createState()  => _SubAnnouncementState();
}
class _SubAnnouncementState extends State<SubAnnouncement>{
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('lib/data/announcement.json');
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
                            print('id : ,$index');
                          },
                          child: Card(
                            margin: const EdgeInsets.all(10),
                            child: Container(
                              child: ListTile(
                                leading: Image(image: AssetImage('assets/images/announcement.png'),height: 40,),
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
