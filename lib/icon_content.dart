import "package:flutter/material.dart"; 
import "constants.dart"; 

class IconContent extends StatelessWidget {

//constr 
IconContent({this.label, this.icon}); 

// field
final String label; 
final IconData icon; 

// return 
@override 
Widget build (BuildContext context) {
  return Column( 
            children: <Widget> [ 
                Icon(
                icon,
                      size: 80.0,
                ), 
                SizedBox(
                      height: 15.0,
                ),
      Text (label,
           style: kLabelTextStyle,  
            )], 
        );  
  }
}