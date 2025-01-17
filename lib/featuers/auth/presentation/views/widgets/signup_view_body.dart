import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/helper_function/build_error_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/featuers/auth/presentation/cuibits/signup_cubit/sign_up_cubit.dart';
import 'package:fruits_hub/featuers/auth/presentation/views/widgets/have_an_account.dart';
import 'package:fruits_hub/featuers/auth/presentation/views/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email,userName,password;
  bool isObscure = true;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24,),
               CustomTextFormField(
                onSaved: (value){
                  userName = value!;
                },
                hint:'الاسم كامل',
                keyboardType: TextInputType.name,

              ),
              const SizedBox(height: 16,),
               CustomTextFormField(
                hint:'البريد الإلكترونى',
                keyboardType: TextInputType.emailAddress,
                 onSaved: (value){
                   email = value!;
                 },



              ),
              const SizedBox(height: 16,),
               CustomTextFormField(
                 onSaved: (value){
                   password = value!;
                 },
                hint:'كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
                obscureText: isObscure,
                suffixIcon: IconButton(
                  onPressed: (){
                    isObscure=!isObscure;
                    setState(() {

                    });

                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Color(0xffc9cecf),
                  ),
                ),


              ),
              const SizedBox(height: 16,),
               TermsAndConditions(
                 onChanged: (value){
                   isChecked = value;
                 },
               ),
              const SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: CustomButton(
                  text: 'إنشاء حساب جديد',
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      if(isChecked) {
                        SignUpCubit.get(context).createUserWithEmailAndPassword(
                            email: email, password: password, name: userName);
                      }
                      else
                        {
                          buildErrorBar(context, 'يجب الموافقة على الشروط والأحكام');
                        }
                    }
                    else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }

                  },
                ),
              ),
              const SizedBox(height: 26,),
              const HaveAnAccountWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
