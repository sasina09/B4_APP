// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:b4together/page/rewards/primarycolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:b4together/page/rewards/history.dart';
import 'package:b4together/page/rewards/sentcoin_Page.dart';

import 'package:b4together/model/RewardMD/RewardModel.dart';

class Reward_Page extends StatefulWidget {
  @override
  _Reward_PageState createState() => _Reward_PageState();
}

class _Reward_PageState extends State<Reward_Page> {
  List<Rewards> _items = [];

  // Fetch content from the json file
  Future readJson() async {
    // final String response = await rootBundle.loadString('./lib/data/reward.json');
    final String response =
        await rootBundle.loadString('./lib/data/reward.json');
    // print(response);
    _items = rewardsFromJson(response);

    setState(() {});

    // print(_items);
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    redempCard(data) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                  height: 400,
                  padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          alignment: Alignment.topRight,
                            child: Icon(Icons.close),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Image.network(
                          data.image,
                          height: MediaQuery.of(context).size.height * 0.18,
                          // height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        data.name,
                        style: GoogleFonts.mitr(fontSize: 20.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('          1',
                                style: TextStyle(fontSize: 20.0)),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Image(
                                image: AssetImage('assets/images/coin.png'),
                                height: 50,
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: FloatingActionButton(
                              mini: true,
                              onPressed: () {},
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 30,
                              ),
                              backgroundColor: kPrimaryColor,
                            ),
                          ),
                          Text('1', style: TextStyle(fontSize: 20.0)),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: FloatingActionButton(
                              mini: true,
                              onPressed: () {},
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                              backgroundColor: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('แลกของรางวัล',
                            style: GoogleFonts.mitr(
                              fontSize: 14,
                              //fontWeight: FontWeight.w700,
                              color: Colors.white,
                            )),
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: kPrimaryColor,
            padding: const EdgeInsets.fromLTRB(20, 40, 15, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "รางวัล",
                  style: GoogleFonts.mitr(fontSize: 28, color: Colors.white),
                ),
                Material(
                  type: MaterialType.card,
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    onTap: () {
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        Icons.history_rounded,
                        color: kPrimaryColor,
                        size: 28,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: Card(
                    child: Container(
                        height: 120.0,
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'คอยน์ของฉัน ',
                                style: GoogleFonts.mitr(fontSize: 24),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '20 ',
                                    style: GoogleFonts.mitr(fontSize: 24),
                                  ),
                                  Image(
                                    image: AssetImage('assets/images/coin.png'),
                                    height: 50,
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Card(
                    child: Container(
                      height: 120.0,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.black,
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Sentcoin(),
                            ),
                          );
                          print('coin');
                        },
                        child: Column(
                          children: [
                            Text(
                              'ส่งให้เพื่อน',
                              style: GoogleFonts.mitr(fontSize: 24),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '2 ',
                                  style: GoogleFonts.mitr(fontSize: 24),
                                ),
                                Image(
                                  image: AssetImage('assets/images/coin.png'),
                                  height: 50,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('แลกของรางวัล', style: GoogleFonts.mitr(fontSize: 23.0)),
                SizedBox(
                  width: 10,
                ),
                Image(
                  image: AssetImage("assets/images/gift-box.png"),
                  height: 30,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
              child: GridView.builder(
                  padding: EdgeInsets.all(0),
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
                        onTap: () {
                          redempCard(_items[index]);
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
                                    child: Image.network(
                                      _items[index].image,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      // height: 50,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  // SizedBox(height: 8,),
                                  Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          _items[index].name,
                                          style:
                                              GoogleFonts.mitr(fontSize: 13.0),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      )),
                                  // SizedBox(height: 4,),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(_items[index].price,
                                            style: GoogleFonts.mitr(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold)),
                                        Image(
                                          image: AssetImage(
                                              'assets/images/coin.png'),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                        )
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
    );
  }
}
