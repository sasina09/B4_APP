import 'package:b4together/model/Rewardmodel_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:b4together/page/rewards/primarycolor.dart';

import 'package:b4together/page/rewards/details_coin.dart';
String horseUrl = 'https://i.stack.imgur.com/Dw6f7.png';

class Sentcoin extends StatefulWidget {
  @override
  _SentcoinState  createState()  => _SentcoinState();

}

class _SentcoinState extends State<Sentcoin> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();

  String department = "All";
  int _count = 0;

  int _coin = 2;

  static List<String> mainDataList = [
    "นิติวุธ หันไชยเนาว์",
    "บุณยเกียรติ สุขสำโรง",
    "ปณชัย เทพรักษ์",
    "ปัณณธร ผาใต้",
    "ปิยะพงษ์ สันโดด",
    "พรนิภา มายา",
    "พัสกร แซ่ฮ้อ",
    "ภัทรวดี สีดำ",
    "ลลิตา ศรีวะรมย์",
    "ศิขรินทร์ บริบาล",
    "ศิริภัทร ดำนิน",
    "อัยยรัชฌ์ ภูพันธ์เว่อ",
    "สงกรานต์ เทียบสม",
    "ไอลดา สุรินทร์",
    "พงศกร ไสยะกิจ",
    "รชต คัมภิรานนท์",
    "วุฒิภัทร อุดมดี",
    "อธิราช กุลเมือง"
  ];

  static List<String> departmentList = [
    "Follow",
    "HR",
    "Nurse",
    "Noona",
    "Doctor",
    "Secuerity"
  ];

  List<String> newDataList = List.from(mainDataList);
  List<bool> _checkedValue = List.filled(mainDataList.length, false);

  List<String> newDataList2 = List.from(departmentList);

  late Department departmentdata ;
  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
      _checkedValue = List.filled(newDataList.length, false);
      // print(_checkedValue.length);
    });
  }

  addNewContactRow() {
    setState(() {
      _count = _count + 1;
    });
  }
  removeContactRow() {
    setState(() {
      _count = _count - 1;
    });
  }
  
  Future<void> readJson() async {
    String response = await rootBundle.loadString('lib/data/depart_coin.json');
    departmentdata = departmentFromJson(response);
}

  @override
  void initState() {
    readJson();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(_checkedValue.length);
    List<Widget> _contatos =
        new List.generate(_count, (int i) => const ContactRow());

    department_dialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              //search department
              return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Container(
                    height: 300,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _textController2,
                          style: GoogleFonts.mitr(
                            fontSize: 14,
                            color: kPrimaryColor,
                          ),
                          decoration: InputDecoration(
                            labelText: "ค้นหาแผนก",
                            // hintText: "ค้นหา",
                            hintStyle: GoogleFonts.mitr(color: Colors.grey),
                            // fillColor: kbuttonblue,
                            filled: true,
                            border: const OutlineInputBorder(
                              // borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: SvgPicture.asset(
                                      'assets/icons/Search.svg',
                                      color: Colors.blue)),
                            ),
                          ),
                          onChanged: (s) {
                            newDataList2 = departmentList
                                .where((string) => string
                                    .toLowerCase()
                                    .contains(s.toLowerCase()))
                                .toList();
                            setState(() {});
                          },
                        ),
                        Expanded(
                            child: ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                itemCount: (newDataList2.length),
                                itemBuilder: (context, index) {
                                  return ListTile(
                                      //Icon(Icons.person_pin_rounded),
                                      title: Text(
                                        newDataList2[index],
                                        style: GoogleFonts.mitr(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        this.setState(() {
                                          department = newDataList2[index];
                                        });
                                      });
                                })),
                      ],
                    ),
                  ));
            },
          );
        });

    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return  SafeArea(
          child: Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.black, //change your color here
              ),
              backgroundColor: Colors.white,
              title: Text(
                "ส่งเหรียญ",
                style: GoogleFonts.mitr(
                    color: const Color.fromARGB(255, 94, 94, 94),
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      
                      Text(
                        _coin.toString(),
                        style: GoogleFonts.mitr(
                            color: const Color.fromARGB(255, 94, 94, 94),
                            fontSize: 17),
                      ),
                      CircleAvatar(
                          radius: (15),
                          backgroundColor: Colors.white,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset("assets/images/coin.png"),
                          )),
                      FlatButton(
                        textColor: Colors.white,
                        onPressed: () {
                          print("ส่งเหรียญ");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Createdetails()),
                          );
                        },
                        child: Text(
                          "เลือก",
                          style: GoogleFonts.mitr(
                              color: const Color.fromARGB(255, 94, 94, 94),
                              fontSize: 17),
                        ),
                        shape: const CircleBorder(
                            side: BorderSide(color: Colors.transparent)),
                      ),
                    ],
                  ),
                )
              ],
            ),
            //search name
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextField(
                    controller: _textController,
                    style: GoogleFonts.mitr(
                      fontSize: 14,
                      color: kPrimaryColor,
                    ),
                    decoration: InputDecoration(
                      labelText: "ค้นหารายชื่อ",
                      // hintText: "ค้นหา",
                      hintStyle: GoogleFonts.mitr(color: Colors.grey),
                      // fillColor: kbuttonblue,
                      filled: true,
                      border: const OutlineInputBorder(
                        // borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {},
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: SvgPicture.asset('assets/icons/Search.svg',
                                color: Colors.blue)),
                      ),
                    ),
                    onChanged: onItemChanged,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: RaisedButton(
                        onPressed: () {
                          print("ค้นหาแผนก");
                          department_dialog();
                        },
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              department,
                              style: GoogleFonts.mitr(
                                fontSize: 14,
                                //fontWeight: FontWeight.w700,
                                color: kPrimaryColor,
                              ),
                            ),
                            const Icon(
                              Icons.filter_alt_rounded,
                              color: kPrimaryColor,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        itemCount: (newDataList.length),
                        itemBuilder: (context, index) {
                          return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/3135/3135768.png"),
                              ), //Icon(Icons.person_pin_rounded),
                              title: Text(
                                newDataList[index],
                                style: GoogleFonts.mitr(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              trailing: _checkedValue[index]
                                  ? Icon(
                                      Icons.check_box,
                                      color: Colors.blue[200],
                                    )
                                  :  Icon(Icons.check_box_outline_blank),
                              onTap: () {
                                if(_checkedValue[index]){
                                  print("oooo");
                                  _checkedValue[index] = false;
                                  removeContactRow();
                                  
                                  print(_checkedValue[index]);
                                  setState(() {
                                    _coin = _coin + 1;
                                    
                                  });
                                  print(_coin);
                                }
                                if(_coin>0){
                                  addNewContactRow();
                                  setState(() {
                                    _coin = _coin - 1;
                                    _checkedValue[index] = !_checkedValue[index];
                                  });
                                }
                                // print(newDataList[index]);
                                
                              });
                        })),
                Container(
                  color: Colors.grey[300],
                  height: 60.0,
                  child: new ListView(
                    children: _contatos,
                    scrollDirection: Axis.horizontal,
                  ),
                )
              ],
            ),
          ),
        );
      });
  }
}

class ContactRow extends StatefulWidget {
  const ContactRow({Key? key}) : super(key: key);

  @override
  _ContactRowState createState() => _ContactRowState();
}

class _ContactRowState extends State<ContactRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset("assets/images/profile.png"),
              )
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                // padding: const EdgeInsets.all(7.5),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90.0),
                color: Colors.redAccent
                
                ),
                child: Icon(Icons.close_rounded,color: Colors.white,size: 15,),
              )
            )
          ]
        )
        
      );
  }
}
