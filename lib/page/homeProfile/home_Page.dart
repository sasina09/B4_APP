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
final List<ChartData> chartData = [
            ChartData('David', 62, Color.fromRGBO(9,0,136,1)),

        ];
    return Scaffold(
        body: Container(
      child: Column(children: [
        CustomCard(),
        SfCircularChart(annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
              widget: Container(
                  child: PhysicalModel(
                      child: Container(),
                      shape: BoxShape.circle,
                      elevation: 10,
                      shadowColor: Colors.black,
                      color: const Color.fromRGBO(230, 230, 230, 1)))),
          CircularChartAnnotation(
              widget: Container(
                  child: const Text('62%',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 25))))
        ], series: <CircularSeries>[
          DoughnutSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              // Radius of doughnut
              radius: '50%')
        ])
      ]),
    ));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color,);
  final String x;
  final double y;
  final Color color;
}

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                          style: GoogleFonts.mitr(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                      subtitle: Center(
                        child: Text(
                          'HR',
                          style: GoogleFonts.mitr(
                              color: Colors.black, fontSize: 13),
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
}
