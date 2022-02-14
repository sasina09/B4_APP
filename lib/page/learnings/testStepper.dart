import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepProgressView extends StatelessWidget {

  StepProgressView({Key? key,
    required List<IconData> icons,
    required int curStep,
    required List<String> titles,
    required double width,
    required Color color}
    ) :
        _icons = icons,
        _titles = titles,
        _curStep = curStep,
        _width = width,
        _activeColor = color,
        assert(curStep > 0 == true && curStep <= icons.length),
        assert(width > 0),
        super(key: key);

  final double _width;
  final List<IconData> _icons;
  final List<String> _titles;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = Colors.grey;
  final double lineWidth = 4.0;

  List<Widget> _iconViews() {
  var list = <Widget>[];
  _icons.asMap().forEach((i, icon) {

    //colors according to state
    var circleColor = (i == 0 || _curStep > i + 1)
        ? _activeColor
        : _inactiveColor;

    var lineColor = _curStep > i + 1
        ? _activeColor
        : _inactiveColor;

    var iconColor = (i == 0 || _curStep > i + 1)
        ? _inactiveColor
        : _activeColor;

    list.add(

      //dot with icon view
      Container(
        width: 50.0,
        height: 50.0,
        padding: EdgeInsets.all(0),
        child: Icon(icon, color: iconColor,size: 15.0,),
        decoration: new BoxDecoration(
          color: circleColor,
          borderRadius: new BorderRadius.all(new Radius.circular(25.0)),
          border: new Border.all(
            color: _activeColor,
            width: 2.0,
          ),
        ),
      ),
    );

    //line between icons

    if (i != _icons.length - 1) {
      list.add(
          Container(height: 40, width: lineWidth, color: lineColor,)
      );
    }
  });

    return list;
  }

  List<Widget> _titleViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, text) {
      list.add(Text(text, style: TextStyle(color: _activeColor)));
    });
    return list;
  }

  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 32.0, left: 24.0, right: 24.0,),
      width: this._width,
      child: Column(
        children: _iconViews()
      ));
  }

}

class stepperr extends StatefulWidget {
  const stepperr({ Key? key }) : super(key: key);

  
  @override
  _stepperrState createState() => _stepperrState();
}

class _stepperrState extends State<stepperr> {


  List<IconData> stepIcons = [Icons.person, Icons.home, Icons.car_repair, Icons.card_travel,Icons.airplanemode_on];
  final List<String> titles = ["step1", "step2", "step3","step4","step5"];


  int _curStep = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StepProgressView(
            icons: stepIcons,
            width: MediaQuery.of(context).size.width,
            curStep: _curStep,
            color: Color(0xffe5649e), 
            titles: titles,
          ),

        ],),
      floatingActionButton: FloatingActionButton(onPressed: (){
          setState((){
            _curStep += 1;
          });
        }
      )
      
    );
  }
}