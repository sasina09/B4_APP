// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:b4together/page/rewards/primarycolor.dart';
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

    static List<String> StatusLearning = [
    "Learning",
    "Not Started",
    "Successed"
  ];
  List<String> newListStatus = List.from(StatusLearning);

  bool _folded = true; // serchAnimation

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

  cardDialog() {

    return showDialog(
      context: context, 
      builder: (BuildContext context){
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState){
            return Dialog(
              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
              ),
            child: Container(
              height: 100,
              child: Text('ohhhhhhhh')),
            );
          }
          );
      }
    );
  } 




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: kPrimaryColor,
            padding: const EdgeInsets.fromLTRB(20, 40, 15, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "เรียนรู้",
                  style: GoogleFonts.mitr(fontSize: 28, color: Colors.white),
                ),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: _folded ? 40 : 280,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: _folded ? Colors.white38 : Colors.white),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 15),
                                  child: !_folded
                                      ? TextField(
                                          decoration: InputDecoration(
                                              hintText: "ค้นหาคอร์สเรียน",
                                              // hintStyle:
                                              border: InputBorder.none),
                                        )
                                      : null)),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            child: Material(
                              type: MaterialType.transparency,
                              child: InkWell(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(_folded ? 32 : 0),
                                  topRight: Radius.circular(32),
                                  bottomLeft: Radius.circular(_folded ? 32 : 0),
                                  bottomRight: Radius.circular(32),
                                ),
                                onTap: () {
                                  setState(() {
                                    _folded = !_folded;
                                    print(_folded);
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Icon(
                                    _folded
                                        ? Icons.search_rounded
                                        : Icons.close,
                                    color:
                                        _folded ? Colors.white : kPrimaryColor,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // Material(
                    //   type: MaterialType.card,
                    //   borderRadius: BorderRadius.all(Radius.circular(32)),
                    //   child: InkWell(
                    //     borderRadius: BorderRadius.all(Radius.circular(32)),
                    //     onTap: () {
                    //       setState(() {});
                    //     },
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(5),
                    //       child: Icon(
                    //         Icons.history_rounded,
                    //         color: kPrimaryColor,
                    //         size: 28,
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                )
              ],
            ),
          ),
          InkWell(
              onTap: () {
                cardDialog();
                print("dddd");
              },
              child: Card(
                elevation: 2,
                margin: EdgeInsets.all(0),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ทั้งหมด",
                        style: GoogleFonts.mitr(
                          fontSize: 14,
                          //fontWeight: FontWeight.w700,
                          color: kPrimaryColor,
                        ),
                      ),
                      Icon(
                        Icons.filter_alt_rounded,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                ),
              )),
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
                        padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        height: 120,
                        // width: double.infinity, // ให้แสดงผลจนสุดจอ
                        width: MediaQuery.of(context).size.width,

                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 150,
                                  child: Image.network(
                                    _items[index].imageUrl,
                                    // width: 150,
                                    height: 100,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
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
    ));
  }
}

