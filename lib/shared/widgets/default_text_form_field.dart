import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  DefaultTextFormField(
      {Key? key,
      required this.controller,
      required this.type,
      this.validate,
      required this.value,
      this.prefix,
      this.suffixIcon,
      this.suffixPressed,
      this.isPassword = false})
      : super(key: key);
  final TextEditingController controller;
  final TextInputType type;
  final String? value;
  bool isPassword ;
  final validate;
  IconData? suffixIcon;
  Widget? prefix;
  Function? suffixPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
        controller: controller,
        //  initialValue: value,
        
        keyboardType: type,
        validator: validate,
        obscureText: isPassword,
        expands:false ,
        decoration: InputDecoration(
          isCollapsed: false,
          isDense: true,
          contentPadding: EdgeInsets.all(8),
         
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(),
            prefixIcon: prefix,
            hintText: value,
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {
                      suffixPressed!();
                    },
                    icon: Icon(
                      suffixIcon,
                    ),
                  )
                : const SizedBox(),
            labelStyle: TextStyle(
              color: Colors.black,
            )));
  }
}
