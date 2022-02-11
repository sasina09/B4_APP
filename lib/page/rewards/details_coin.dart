import 'dart:ui';

import 'package:b4together/page/rewards/primarycolor.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Createdetails extends StatefulWidget {
  Createdetails({Key? key}) : super(key: key);

  @override
  State<Createdetails> createState() => _CreatedetailsState();
}

class _CreatedetailsState extends State<Createdetails> {
  TextEditingController textarea = TextEditingController();

  mesDialog(data) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: Container(
              height: 530,
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            print(data[index]);
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Container(
                              height: 70,
                              //color:Colors.black,
                              child: Text(
                                data[index],
                                style: GoogleFonts.mitr(
                                    color:
                                        const Color.fromARGB(255, 94, 94, 94),
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0 ,vertical: 5.0),
                          child: Container(
                            height: 1.0,
                            width: double.infinity,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    );
                  }),
            ));
      }
      );


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
          //change your color here
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
                  "3",
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
                      MaterialPageRoute(builder: (context) => Createdetails()),
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
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.message_outlined),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "หัวข้อความรู้สึก",
                      style: GoogleFonts.mitr(
                          color: const Color.fromARGB(255, 94, 94, 94),
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownSearch<String>(
                  
                  // dropdownSearchBaseStyle:
                  //     GoogleFonts.mitr(color: kPrimaryColor, fontSize: 16),
                  //mode of dropdown
                  mode: Mode.MENU,
                  dropdownSearchDecoration: InputDecoration(
                   
                    labelText: "ค่านิยมหลัก*",
                    labelStyle:
                        GoogleFonts.mitr(color: Colors.redAccent, fontSize: 16),
                    // helperText: 'positionCallback example usage',
                    hintStyle:
                        GoogleFonts.mitr(color: kPrimaryColor, fontSize: 16),
                    //helperText: 'positionCallback example usage',

                    
                    filled: true,

                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                  ),
                  
                  popupItemBuilder: (context, item, isSelected) {
                    return Container(
                      
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      // decoration: !isSelected
                      //     ? null
                      //     : BoxDecoration(
                      //         border: Border.all(color: Theme.of(context).primaryColor),
                      //         borderRadius: BorderRadius.circular(5),
                      //         color: Colors.white,
                      //       ),
                      child: ListTile(
                        selected: isSelected,
                        title: Text(
                                item,
                                style:  GoogleFonts.mitr(color: kPrimaryColor, fontSize: 16),
                        ),
                        
                      ),
                    );
                  },
                  
                  //to show search box
                  showSearchBox: false,
                  showSelectedItem: true,
                  //dropDownButton: const Icon(Icons.highlight_remove_rounded,color: Colors.red,),
                  selectedItem: "กรุณาเลือกเหตุผลในการให้ดาว" ,
                  searchBoxStyle:
                      GoogleFonts.mitr(color: kPrimaryColor, fontSize: 16),

                  dropdownBuilder:(context, selectedItem, itemAsString) {
                    return Container(
                      child: Text(
                        itemAsString.toString(),
                        style:  GoogleFonts.mitr(color: kPrimaryColor, fontSize: 16),
                      ),
                    );
                  },
                  //list of dropdown items
                  items: const [
                    "เหนือกว่าความเป็นเลิศ",
                    "สร้างให้เกิดความเข้าใจ",
                    "จรรยาบรรณธำรงไว้",
                    "คงเอกลักษณ์ไทยด้วยหัวใจบริการ",
                  ],
                  // label: "ค่านิยมหลัก",
                  onChanged: (mes) {
                    const data = [
                      "ยกระดับคุณภาพชีวิตของผู้ใช้บริการด้วยนวัตกรรมที่ล้ำหน้า และบริการที่จริงใจ",
                      "เสนอแนะสู่การพัฒนาอย่างไม่หยุดยั้งเพื่อความสำเร็จของโรงพยาบาล",
                      "ปฏิบัติงานด้วยความมุ่งมั่นสู่ความเป็นเลิศในทุกด้าน ยึดมั่นต่อคุณภาพ  ประสิทธิภาพและความเชี่ยวชาญ",
                      "ตอบสนองอย่างทันท่วงทีและสร้างผลงานที่มีคุณภาพสูง",
                      "คำนึงถึงความปลอดภัยของผู้ใช้บริการตลอดเวลา",
                    ];
                    mesDialog(data);
                  },
                  //show selected item
                  //selectedItem: "กรุณาเลือกเหตุผลในการให้ดาว",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.text_fields_rounded),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "ข้อความ",
                          style: GoogleFonts.mitr(
                              color: const Color.fromARGB(255, 94, 94, 94),
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: textarea,
                            style: GoogleFonts.mitr(
                              fontSize: 16,
                              color: kPrimaryColor,
                            ),
                            keyboardType: TextInputType.multiline,
                            minLines: 2,
                            maxLines: 10,
                            //textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText: "เขียนข้อความ . . .",
                                hintStyle: GoogleFonts.mitr(
                                    color: kbuttongray, fontSize: 16),
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                      color: Color(0xFF0C2361),
                                      width: 2,
                                    ))),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              height: 45,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // Color(0xFF7CA5FF),
                    // Color(0xFF426BDB),
                    // Color(0xFF294EB6),
                    Color(0xFF0C2361),
                    Color(0xFF0C2361),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                //border: Border.all(width: 2.0, color: const Color(0xFFA2B4E7)),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'ส่ง',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.mitr(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      letterSpacing: 0.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}