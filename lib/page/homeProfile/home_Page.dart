import 'package:b4together/page/learnings/testStepper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:b4together/page/homeProfile/editprofile_Page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Homes extends StatefulWidget {
  Homes({Key? key}) : super(key: key);
  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      _profileCard(context),
      GridView.builder(
        shrinkWrap: true,
        itemCount: 2,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
        ),
        itemBuilder: (BuildContext context, int index) {
         return _buildChart();

        },
      ),
    ]));
  }
}

Widget _profileCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 55.0),
    child: Container(
      child: Stack(
        children: <Widget>[
          Card(
            child: Container(
              height: 100.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    title: Center(
                      child: Text(
                        'PONGSIRI    KONGSANSEE',
                        style:
                            GoogleFonts.mitr(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    subtitle: Center(
                      child: Text(
                        'HR',
                        style:
                            GoogleFonts.mitr(color: Colors.black, fontSize: 13),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => stepperr(),
                        ),
                      );
                      print("Profile");
                    },
                  ),
                ],
              ),
            ),
          ),
          FractionalTranslation(
            translation: Offset(0.0, -0.55),
            child: Align(
              child: GestureDetector(
                onTap: () {
                  print("Avtar");
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                  radius: 30.0,
                ),
              ),
              alignment: FractionalOffset(0.5, 0.0),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildChart() {
// [ ["name" : "oooo", "a":50, "color":],["name" : "oooo", "a":50]]
  // List<ChartData> chartData = [];
  // for (var item in data){
  //   chartData.add(ChartData(item["name"], item["value"], item["color"]));
  // }
  final List<ChartData> chartData = [
    ChartData('David', 62, Color.fromRGBO(9, 0, 136, 1)),
    ChartData('Steve', 38, Color.fromRGBO(230, 230, 230, 1)),
  ];
  return Center(
    child: Container(
      // color: Colors.amber,
      child: SfCircularChart(
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
              height: '100%',
              width: '100%',
              widget: PhysicalModel(
                shape: BoxShape.circle,
                elevation: 10,
                shadowColor: Colors.black,
                color: const Color.fromRGBO(230, 230, 230, 1),
                child: Container(),
              )),
          CircularChartAnnotation(
              widget: const Text('62%',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 25)))
        ],
        series: <CircularSeries>[
          DoughnutSeries<ChartData, String>(
              dataSource: chartData,
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              radius: '80%')
        ],
      ),
    ),
  );
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
