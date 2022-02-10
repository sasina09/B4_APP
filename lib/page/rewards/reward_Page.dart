
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:b4together/page/rewards/history.dart';
import 'package:b4together/page/rewards/sentcoin_Page.dart';

import 'package:b4together/model/RewardMD/RewardModel.dart';



class Reward_Page extends StatefulWidget {
  @override
   _Reward_PageState createState()  =>  _Reward_PageState();

}

class _Reward_PageState extends State<Reward_Page>{
List<Rewards> _items = [];

  // Fetch content from the json file
  Future readJson() async {
    // final String response = await rootBundle.loadString('./lib/data/reward.json');
    final String response = await rootBundle.loadString('./lib/data/reward.json');
    // print(response);
    _items = rewardsFromJson(response);

    setState(() {
      
    });

    // print(_items);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("รางวัล", style: GoogleFonts.mitr(
                fontSize: 24
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                    height: 100.0,
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: (
                        Text('Coin ทั้งหมดของฉัน',style: GoogleFonts.mitr(fontSize: 20),)
                      ),
                    )
                  ),
                ),
                Card(
              child: Container(
                height: 100.0,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: (){
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sentcoin(),
                      ),
                    );
                    print('coin');
                  },
                  child:  Text('การส่ง Coin',style : GoogleFonts.mitr(),
                  ),
                ),
              ),
            ),
          ],
        ),
            SizedBox(height: 20,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20,),
                  Text('แลกของรางวัล',style :GoogleFonts.mitr( fontSize: 23.0 )),
                  SizedBox(width: 10,),
                  Image (
                    image : AssetImage("assets/images/gift-box.png"),
                    height: 30,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _items.length,             
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: (4 / 5),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(

                      child: InkWell(
                        onTap: (){
                          print(_items[index].name);
                        },
                        child: Card(
                          elevation: 3,
                          child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                            child: Padding(
                               padding: const EdgeInsets.all(10.0),
                              child: Column(                        
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Image.network(_items[index].image,
                                    height: MediaQuery.of(context).size.height*0.08,
                                    // height: 50,
                                    fit: BoxFit.contain,
                                    ),
                                  ),
                                  // SizedBox(height: 8,),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(

                                      padding: const EdgeInsets.only(top : 10.0),
                                      child: Text(_items[index].name,style :GoogleFonts.mitr( fontSize: 13.0 ),overflow: TextOverflow.ellipsis,maxLines: 1,),
                                    )),
                                  // SizedBox(height: 4,),
                                  Expanded(
                                    flex : 2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                         Text(_items[index].price,style :GoogleFonts.mitr(fontSize: 12.0 ,fontWeight: FontWeight.bold)),
                                        Image(image: AssetImage('assets/images/coin.png'),
                                        height: MediaQuery.of(context).size.height*0.04,) 
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}