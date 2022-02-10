import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class  CommentHR extends StatefulWidget {
  @override
  _CommentHRState createState()  => _CommentHRState();
}
class _CommentHRState extends State<CommentHR>{
  Widget _buildTextField() {
    final maxLines = 5;

    return Container(
      margin: EdgeInsets.all(12),
      height: maxLines * 25.0,
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: "Enter a message",
          fillColor: Colors.grey[300],
          filled: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            // Container(
            //   height: 100,
            //   child:  TextField(
            //     // obscureText: true,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'เขียนความคิดเห็น',
            //     ),
            //   ),
            // ),
            _buildTextField(),
            SizedBox(
        
               width: double.infinity,
              child: RaisedButton(
            
                  onPressed: (){
                    print('SEND Comment Button Pressed');
                  },
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                ),
                
              color: Color(0xFF0C2361),
              child: Text('ส่งความคิดเห็น',style: GoogleFonts.mitr(color: Colors.white),)
              ),
            ),
          ],
        ),
      ),

    );
  }

}