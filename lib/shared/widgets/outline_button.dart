import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

class DefaultOutLineButton extends StatelessWidget {
  const DefaultOutLineButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: OutlinedButton(
        
        style:OutlinedButton.styleFrom(
          side: BorderSide(
            color: accentColor
          )
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:const [
          SizedBox(
            height: 30,
            width: 20,
            child: Image(image: AssetImage('assets/images/google.png'))),
            SizedBox(width: 10,),
           Text('Sign in with google',
              style: TextStyle(color: accentColor))
        ]),
      ),
    );
  }
}
