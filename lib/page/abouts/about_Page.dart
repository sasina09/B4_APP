import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:b4together/page/abouts/commentHR_Page.dart';
import 'package:b4together/page/abouts/dataCompany_Page.dart';

class Company extends StatefulWidget {
  @override
  _CompanyState createState()  => _CompanyState();

}

class _CompanyState extends State<Company> with SingleTickerProviderStateMixin{
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
              "เพิ่มเติม",
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
                  child: Text("ส่งความคิดเห็นถึงHR", style: GoogleFonts.mitr(fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text("ข้อมูลบริษัท", style: GoogleFonts.mitr(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          body: Navigator(
              onGenerateRoute: (_) => MaterialPageRoute(
                  builder: (_) => TabBarView(controller: _tabController,
                      children: [
                        CommentHR(),
                        DataCompany(),
                      ])
              )
          )
      ),
    );
  }

}