import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RewardHistory extends StatefulWidget {
  @override
  _RewardHistoryState  createState()  => _RewardHistoryState();

}

class _RewardHistoryState extends State<RewardHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(

                onPressed: () {
                  Navigator.pop(context);
                  print('back');
                },
                child: Text("Back",style : TextStyle(color: Color(-16),
                  fontFamily : 'Mali',fontSize: 18, ),
                ),
                // Text("Back",style : TextStyle(color: Color(-16),
                //   fontFamily : 'Mali',fontSize: 18, ),
              ),
            ],
          ),
        ],
        title: Center(
          child: Text('ประวัติการแลกของ',
            style : TextStyle(color: Color(-16),
                fontFamily : 'Mali'
            ),
          ),
        ),
      ),

    );
  }

}
