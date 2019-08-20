import "package:flutter/material.dart"; 

// Creating our own custom widget reutilizable  
class ReusableCard extends StatelessWidget { 

// Constructor for the class, making the color optional. 
ReusableCard({@required this.colour, this.cardChild, this.onPress}); 

// Instance variable or  field or property 
final Color colour; 
final Widget cardChild; 
final Function onPress;

@override 
Widget build (BuildContext context) {
return GestureDetector(
    onTap: onPress, 
    child: Container( 
        child:cardChild,  
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour, 
          borderRadius: BorderRadius.circular(10.0),
          ),
      ),   
    ); 
}
}