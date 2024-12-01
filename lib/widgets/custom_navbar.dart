import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: deviceWidth(context) * 0.1 ),
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
      height: screenHeight * 0.09,
      width: screenWidth * 0.6,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildNaviBarItem(Icons.add, 0, (){}),
          buildNaviBarItem(Icons.camera_alt, 1, (){}),
          buildNaviBarItem(Icons.person, 2, (){
            Navigator.pushNamed(context, 'profileScreen');
          },),
        ],
      ),
    );
  }

  Widget buildNaviBarItem(IconData icon, int index, Function onPressed) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          onPressed();

        },);
      },
      child: Container(
        child: Icon(
          icon,
          color:
          index == _selectedIndex ? Colors.white : Colors.black,
          size: 38,
        ),
      ),
    );
  }
}
