import 'dart:ui';

import 'package:flutter/material.dart';


class DrawingBoard extends StatefulWidget {
  const DrawingBoard({Key? key}) : super(key: key);

  @override
  State<DrawingBoard> createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  Color selectedColor = Colors.black;
  List<Color> colors = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.pink,
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.purple,
  ];
  List <DrawingPoint> drawingPoints = [];
  double strokeWidth = 5;
  var number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onPanStart: (details){
              setState(() {
                drawingPoints.add(DrawingPoint(
                    details.localPosition,
                    Paint()
                      ..color = selectedColor
                      ..isAntiAlias = true
                      ..strokeWidth = strokeWidth
                      ..strokeCap = StrokeCap.round
                ));
              });
            },
            onPanUpdate: (details){
              number = details.localPosition;
              print(number);
              setState(() {
                drawingPoints.add(DrawingPoint(
                    details.localPosition,
                    Paint()
                      ..color = selectedColor
                      ..isAntiAlias = true
                      ..strokeWidth = strokeWidth
                      ..strokeCap = StrokeCap.round
                ));
              });
            },
            onPanEnd: (details){
              setState(() {
                drawingPoints.add(DrawingPoint(
                   Offset.infinite,
                  Paint()
                    ..color = selectedColor
                    ..isAntiAlias = true
                    ..strokeWidth = strokeWidth
                    ..strokeCap = StrokeCap.round,
                ),
                );
              });
            },
            child: CustomPaint(
              painter: _DrawingPainter(drawingPoints) ,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,

              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 10,
              child: Row(
                children: [
                  Slider(
                      min: 3,
                      max: 25,
                      value: strokeWidth,
                      onChanged:(val)=> setState(() => strokeWidth = val),
                  ),
                  ElevatedButton.icon(
                    icon: Icon(Icons.clear),
                      onPressed: ()=> setState(() {
                        drawingPoints = [];
                      }),
                      label: Text("Clear Board"),
                      )
                ],
              ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.indigo[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(colors.length, (index) => pickColors(colors[index])),
          ),
        ),
      ),
    );
  }

  Widget pickColors(Color colorInclude){
    bool isSelected = selectedColor == colorInclude;
    return GestureDetector(
      onTap: () => setState(() => selectedColor = colorInclude),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: isSelected? 50 : 40,
          width: isSelected? 50 : 40,
          decoration: BoxDecoration(
            color: colorInclude,
            shape: BoxShape.circle,
            border: isSelected? Border.all(
              color: Colors.white,
              width: 3,
            ):isSelected? Border.all(
              color: Colors.white,
              width: 3,
            ): null,
          ),
        ),
      ),
    );
  }

}

class _DrawingPainter extends CustomPainter{
  final List <DrawingPoint> drawingPoints;
  _DrawingPainter(this.drawingPoints);

  List <Offset> offsetsList = [];
  @override
  void paint(Canvas canvas, Size size){
    for(int i = 0; i < drawingPoints.length; i++){
      if (drawingPoints[i] != null && drawingPoints[i + 1] != null){
        canvas.drawLine(drawingPoints[i].offset, drawingPoints[i+1].offset, drawingPoints[i].paint);
      }else if (drawingPoints[i] != null && drawingPoints[i + 1] == null){

      }offsetsList.clear();
      offsetsList.add(drawingPoints[i].offset);
      canvas.drawPoints(PointMode.points, offsetsList, drawingPoints[i].paint);
    }

  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


class DrawingPoint {
  Offset offset;
  Paint paint;
  DrawingPoint(this.offset, this.paint);
}

