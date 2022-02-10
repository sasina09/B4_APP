import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class  DataCompany extends StatefulWidget {
  @override
  _DataCompanyState createState()  => _DataCompanyState();
}
class _DataCompanyState extends State<DataCompany>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[0],
      body: Container(

        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Center(
                child: Image (
                  image : AssetImage("assets/images/BDMS.png"),
                  height:150,
                ),
              ),
              SizedBox(height: 20,),
              Text('    บริษัท กรุงเทพดุสิตเวชการ จำกัด (มหาชน) หรือ BDMS หนึ่งในเครือข่ายโรงพยาบาลที่มีชื่อเสียงที่สุดในภูมิภาคเอเชียแปซิฟิก บริหารงานโรงพยาบาลทั้งหมด 49 แห่ง ซึ่งหลายแห่งได้รับการรับรองคุณภาพระดับสากลให้บริการทางการแพทย์แก่ผู้ป่วยชาวต่างชาติราว 2 ล้านคนต่อปี ด้วยเทคโนโลยีทางการแพทย์อันทันสมัยพร้อมทีมแพทย์ผู้เชี่ยวชาญกว่า 12,000 คน ที่ผ่านการฝึกอบรมจากสถาบันการแพทย์ชั้นนำการร่วมมือกับศูนย์การแพทย์ชั้นนำทั้งในสหรัฐอเมริกา ยุโรปตะวันตก และญี่ปุ่น ส่งผลให้คุณภาพของการบริการของเราพัฒนาก้าวหน้ายิ่งขึ้น เรามุ่งหวังที่จะสร้างความเชื่อมั่นให้ผู้ป่วยว่าจะได้รับการดูแลรักษา ด้วยมาตรฐานระดับสากลตั้งแต่การนัดหมายครั้งแรกจนถึงช่วงเวลาที่ก้าวออกจากโรงพยาบาล',style: GoogleFonts.mitr(),)
            ],
          ),
        ),
      ),
    );
  }

}