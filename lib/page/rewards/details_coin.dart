
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
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print(data[index]);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            height: 70,
                            child: Text(data[index],style: GoogleFonts.mitr(
                        color: const Color.fromARGB(255, 94, 94, 94),
                        fontSize: 16),),
                          ),
                        ),
                      );
                    }),
              ),
            ));
      });

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
      body: Column(
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownSearch<String>(
              //mode of dropdown
              mode: Mode.MENU,
              dropdownSearchDecoration:  InputDecoration(
                hintText: "กรุณาเลือกเหตุผลในการให้ดาว",hintStyle: GoogleFonts.mitr(),
                labelStyle: GoogleFonts.mitr(),
                labelText: "ค่านิยมหลัก",
                // helperText: 'positionCallback example usage',
                
                //helperText: 'positionCallback example usage',
                filled: true,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
              ),
              //to show search box
              showSearchBox: false,
              showSelectedItem: true,
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
              selectedItem: "กรุณาเลือกเหตุผลในการให้ดาว",
            ),
          ),
          SizedBox(height: 15,),
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
               padding: const EdgeInsets.symmetric(horizontal: 10),
               child: Column(
                 children: [
                     TextFormField(
                        controller: textarea,
                        style: GoogleFonts.mitr(),
                        keyboardType: TextInputType.multiline,
                        maxLines: 2,
                        decoration:  InputDecoration( 
                           hintText: "เขียนข้อความ . . .",
                           hintStyle: GoogleFonts.mitr(),
                           focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: kPrimaryColor)
                           )
                        ),
                         
                     ),
                 ],
               ),
             ),
          )
            ],
          )
        ],
      ),
    ));
  }
}