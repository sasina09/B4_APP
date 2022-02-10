import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:b4together/page/learnings/course_Page.dart';
import 'package:b4together/model/LearningMD/courseModel.dart'; 

class Learning extends StatefulWidget {
  // late Course course;
  @override
  _LearningState createState() => _LearningState();
}

class _LearningState extends State<Learning> {
  List<Course> _items = [];

  // Fetch content from the json file
  Future readJson() async {
    final String response =
        await rootBundle.loadString('./lib/data/course.json');
    _items = courseFromJson(response);
    setState(() {});

    print(_items);
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
      child: Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "เรียนรู้",
                style: GoogleFonts.mitr(fontSize: 24),
              ),
            ),
            Expanded(
              
              child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                Course_Page(course: _items[index])));
                        print('List$index');
                      },
                      child: Card(
                        elevation: 5, // กำหนดเงาให้กับ Card ค่า default คือ 1 นะ
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                5) // กำหนดความโค้งของขอบ ถ้าไม่ให้โค้งเลยคือ default = BorderRadius.zero
                            ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          height: 120,
                          // width: double.infinity, // ให้แสดงผลจนสุดจอ
                           width: MediaQuery.of(context).size.width,
                    
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    _items[index].imageUrl,
                                    width: 135,
                                    fit: BoxFit.contain,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${_items[index].name}",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: GoogleFonts.mitr(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              if (_items[index].statused != "Not Started") ...[
                                Container(
                                  alignment: Alignment.bottomRight,
                                  //  height: 30,

                                  child: Chip(
                                      label: Text(
                                        _items[index].statused,
                                        style: GoogleFonts.mitr(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: _items[index].statused ==
                                                    "Learning"
                                                ? Colors.black
                                                : Colors.white),
                                      ),
                                      backgroundColor:
                                          _items[index].statused == "Learning"
                                              ? Colors.yellow[700]
                                              : Colors.green[900]),
                                )
                              ] else ...[
                                Container()
                              ]
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
