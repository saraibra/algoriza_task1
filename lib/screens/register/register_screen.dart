import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task1/screens/login/login_screen.dart';

import '../../shared/constants.dart';
import '../../shared/utils.dart';
import '../../shared/widgets/default_button.dart';
import '../../shared/widgets/default_text_form_field.dart';
import '../../shared/widgets/outline_button.dart';

class RegiserScreen extends StatelessWidget {
  RegiserScreen({Key? key}) : super(key: key);
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.17,
                        child: SvgPicture.asset(
                            'assets/images/Computer_login_pana.svg')),
                    Positioned(
                        top: 40,
                        left: 10,
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.3),
                              shape: BoxShape.circle),
                          child: Center(
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  size: 16,
                                )),
                          ),
                        ))
                  ],
                ),
                const Text('welcome to Fashion Daily',
                    style: TextStyle(color: Colors.grey, fontSize: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Register',
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
                const Text('Email'),
                const SizedBox(
                  height: 8,
                ),
                DefaultTextFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                     validate: (value){
                      if(value.isEmpty){
                        return 'Please enter your email';
                      }
                    },
                    value: 'Eg, example@email.com'),
                const SizedBox(
                  height: 8,
                ),
                const Text('Phone Number'),
                const SizedBox(
                  height: 8,
                ),
                DefaultTextFormField(
                    prefix: CountryCodePicker(
                      
                      padding: const EdgeInsets.all(0),
                      showDropDownButton: true,
                      onChanged: print,
                      showFlag: false,
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'EG',
                      favorite: ['+20', 'EG'],
                      // optional. Shows only country name and flag
                      showCountryOnly: false,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: false,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,
                    ),
                    controller: phoneController,
                    type: TextInputType.phone,
                     validate: (value){
                      if(value.isEmpty){
                        return 'Please enter your phone';
                      }
                    },
                    value: 'Eg, 812345678'),
                const SizedBox(
                  height: 8,
                ),
                const Text('Password'),
                const SizedBox(
                  height: 8,
                ),
                DefaultTextFormField(
                    isPassword: true,
                    controller: emailController,
                    suffixIcon:Icons.visibility,
                    type: TextInputType.text,
                    validate: (value){
                      if(value.isEmpty){
                        return 'Please enter your password';
                      }
                    },
                    value: '******'),
                const SizedBox(
                  height: 20,
                ),
                DefaultButton(text: 'Register', onPressed: () {
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
                    const Text('Has an account?'),
                    TextButton(
                        onPressed: () {
                          navigateTo(context, LoginScreen());
                        },
                        child: const Text(
                          'Sign in Here',
                          style: TextStyle(color: accentColor),
                        ))
                  ],
                ),
                 const SizedBox(
                height: 30,
              ),
              const Text('By registering your account. you are agree with our ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey
              ),
              ),
               Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text('Terms and Conditions',
                  style: TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor
                  ),
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
