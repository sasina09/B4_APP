import 'package:flutter/cupertino.dart';
import 'package:b4together/model/LearningMD/courseModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Course_Page extends StatefulWidget {
  final Course course;

  Course_Page({Key? key, required this.course}) : super(key: key);
  @override
  _Course_PageState createState() => _Course_PageState();
}

class _Course_PageState extends State<Course_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 350,
                  child: Image.network(
                    widget.course.imageUrl, //height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                     height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            stops: [
                              0.1,
                              0.2,
                              0.4,
                              0.7,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xCC000000).withOpacity(0.0),
                              Color(0xCC000000).withOpacity(0.2),
                              Color(0xCC000000).withOpacity(0.4),
                              Color(0xCC000000).withOpacity(0.6),
                            ])),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 12),
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: Text(
                              widget.course.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.mitr(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(

                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.70,
                                      margin: EdgeInsets.only(bottom: 12),
                                      child: Text(
                                        widget.course.description,
                                        maxLines: 3,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.mitr(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    if (widget.course.statused !=
                                        "Not Started") ...[
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        child: Chip(
                                            label: Text(
                                              widget.course.statused,
                                              style: GoogleFonts.mitr(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      widget.course.statused ==
                                                              "Learning"
                                                          ? Colors.yellow[800]
                                                          : Colors.green[800]),
                                            ),
                                            backgroundColor: Colors.white),
                                      )
                                    ] else ...[
                                      Container()
                                    ]
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
