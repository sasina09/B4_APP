import 'package:b4together/page/rewards/primarycolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Detail_course_Page extends StatefulWidget {
  @override
  _Detail_course_PageState createState() => _Detail_course_PageState();
}

class _Detail_course_PageState extends State<Detail_course_Page> {
  late PdfViewerController _pdfViewerController;
  
 int p = 0;


  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SfPdfViewer.network(
                'http://www.africau.edu/images/default/sample.pdf',
                canShowScrollHead: false,
                pageSpacing: 10,
                controller: _pdfViewerController,
                onPageChanged: (details)  {
                  if(details.newPageNumber == _pdfViewerController.pageCount){
                     setState((){
                       p = 10;
                     }); 
                  }
                  else{
                    setState((){
                       p = 0;
                     });
                  }
                },
              ),
             
              Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: p == 10 
                ? Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary : Colors.amber
                        ),
                      onPressed: () { },
                      child: Text('จบบทเรียน'),
                    ),
                  )) 
                : Container(),
              ),
            ],
          ),
        ),
      );
      },
    );
  }
}
