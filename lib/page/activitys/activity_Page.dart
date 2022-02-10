import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:b4together/page/activitys/announcement_Page.dart';
import 'package:b4together/page/activitys/survey_Page.dart';

class Announcement extends StatefulWidget {
  @override
  _AnnouncementState  createState()  => _AnnouncementState();

}

class _AnnouncementState extends State<Announcement> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // centerTitle: true,
          title: Text(
            "กิจกรรม",
             style: GoogleFonts.mitr(fontSize: 25),
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          bottom: TabBar(
            indicatorColor: Color.fromARGB(255, 5, 10, 95),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            tabs: [
              Tab(
                child: Text("ประกาศ", style: GoogleFonts.mitr(fontSize: 16),
                ),
              ),
              Tab(
                child: Text("แบบสำรวจ", style: GoogleFonts.mitr(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        body: Navigator(
            onGenerateRoute: (_) => MaterialPageRoute(
                builder: (_) => TabBarView(controller: _tabController,
                    children: [
                      SubAnnouncement(),
                      Survey(),
                    ])
              )
          )
      ),
    );
  }
}


