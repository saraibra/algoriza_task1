import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task1/shared/constants.dart';

import '../../shared/utils.dart';
import '../../shared/widgets/default_button.dart';
import '../../shared/widgets/default_text_form_field.dart';
import '../../shared/widgets/outline_button.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController phoneController = TextEditingController();
    var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: SvgPicture.asset('assets/images/Computer_login_pana.svg')),
              const Text('welcome to Fashion Daily',
                  style: TextStyle(color: Colors.grey, fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w900),
                  ),
                  TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Text(
                              'HELP',
                              style:
                                  TextStyle(color: accentColor, fontSize: 18),
                            ),
                            Icon(
                              Icons.question_mark_outlined,
                              color: accentColor,
                              size: 16,
                            )
                          ],
                        )),
                ],
              ),
              const Text('Phone Number'),
              const SizedBox(
                height: 12,
              ),
              DefaultTextFormField(
                prefix: CountryCodePicker(
                  padding: const EdgeInsets.all( 0),
                  showDropDownButton: true,
             onChanged: print,
             showFlag: false,
             // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
             initialSelection: 'EG',
             favorite: ['+20','EG'],
             // optional. Shows only country name and flag
             showCountryOnly: false,
             // optional. Shows only country name and flag when popup is closed.
             showOnlyCountryWhenClosed: false,
             // optional. aligns the flag and the Text left
             alignLeft: false,
           ),
              validate: (value){
                      if(value.isEmpty){
                        return 'Please enter your phone';
                      }
                    },
                  controller: phoneController,
                  type: TextInputType.phone,
                  value: 'Eg, 812345678'),
              const SizedBox(
                height: 20,
              ),
              DefaultButton(text: 'Sign In', onPressed: () {
                  if(formKey.currentState!.validate()){
                    
                  }
              }),
              const SizedBox(
                height: 12,
              ),
              const Center(child: Text('Or')),
              const SizedBox(
                height: 12,
              ),
              const DefaultOutLineButton(),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Doesn\'t has any account?'),
                  TextButton(
                      onPressed: () {
                        navigateTo(context, RegiserScreen());
                      },
                      child: const Text(
                        'Register Here',
                        style: TextStyle(color: accentColor),
                      ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('Use the application according to policy rules.Any\n kinds of violations will be subject to sanctions.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey
              ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
