import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:b4together/page/homeProfile/editprofile_Page.dart';

class Homes extends StatefulWidget {
  @override
  _HomesState createState()  => _HomesState();

}
class _HomesState extends State<Homes>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        child: ListView(
          children: [
            CustomCard()
            ],
          ),
        ),
      );
  }
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
                      title:Center(
                        child: Text('PONGSIRI    KONGSANSEE',
                          style : GoogleFonts.mitr(color : Colors.black,fontSize: 18),
                        ),

                      ),
                      subtitle: Center(
                        child: Text(
                          'HR',style : GoogleFonts.mitr(color : Colors.black,fontSize: 13),
                        ),
                      ),
                      onTap: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(),
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
                  onTap: (){
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