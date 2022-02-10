import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:b4together/page/rewards/rewardhistory_Page.dart';
import 'package:b4together/page/rewards/coinhistory_Page.dart';

class History extends StatefulWidget {
  @override
  _HistoryState  createState()  => _HistoryState();

}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        child: ListView(
          children: [
            Card(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: Image (
                          image : AssetImage("assets/images/historyreward.png"),
                          height: 70,
                        ),
                        title:Text('ประวัติการแลกของรางวัล',style : TextStyle(color: Color(-16766118) ,fontFamily : 'Mali'),),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RewardHistory(),
                            ),
                          );
                          print("Reward History");
                        },
                      ),
                    ],
                  ),
                )
            ),
            Card(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: Image (
                          image : AssetImage("images/sendcoin.png"),
                          height: 50,
                        ),
                        title:Text(' ประวัติการให้และรับเหรียญ',style : TextStyle(color: Color(-16766118) ,fontFamily : 'Mali'),),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CoinHistory(),
                            ),
                          );
                          print("Coin History");
                        },
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

}
