import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/featuers/auth/presentation/cuibits/signin_cubit/sign_in_cubit.dart';
import 'package:fruits_hub/featuers/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:fruits_hub/featuers/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_hub/featuers/auth/presentation/views/widgets/social_login_button.dart';

import '../../../../../core/utils/assets.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late String email,password;
  bool isObsucred=true;
  AutovalidateMode autoValidateMode=AutovalidateMode.disabled;
  GlobalKey<FormState> globalKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          autovalidateMode: autoValidateMode,
          key: globalKey,
          child: Column(
            children:[
              const SizedBox(height: 24),
               CustomTextFormField(
                 onSaved: (value){
                   email=value!;
                 },
                hint: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16,),
              CustomTextFormField(
                onSaved: (value){
                  password=value!;
                },
                hint: 'كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  onPressed: (){
                    isObsucred=!isObsucred;
                    setState(() {

                    });
                  },
                  icon: const Icon(
                      Icons.remove_red_eye,
                    color: Color(0xffc9cecf),
                  ),
                ),
                obscureText: isObsucred,
              ),
              const SizedBox(height: 16,),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'نسيت كلمة المرور؟',
                  style: AppTextStyles.semiBold16.copyWith(color: AppColors.lightPrimaryColor ),
                ),
              ),
              const SizedBox(height: 33,),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: CustomButton(
                  text: 'تسجيل الدخول',
                      onPressed: (){
                    if(globalKey.currentState!.validate()) {
                      globalKey.currentState!.save();
                      SignInCubit.get(context).signInWithEmailAndPassword(
                          email: email, password: password);
                    }
                    else
                      {
                        autoValidateMode=AutovalidateMode.always;
                      }

                      },
                ),
              ),
              const SizedBox(height: 33,),
              const DontHaveAnAccountWidget(),
              const SizedBox(height: 33,),
              const OrDivider(),
              const SizedBox(height: 16,),
              SocialLoginButton(
                onPressed: (){
                  SignInCubit.get(context).signInWithGoogle();

                },
                image: Assets.imagesGoogleIcon,
                title: 'تسجيل بواسطة جوجل',
              ),
              const SizedBox(height: 16,),
              if(Platform.isIOS)
              SocialLoginButton(
                onPressed: (){
                  SignInCubit.get(context).signInWithApple();

                },
                image: Assets.imagesAppleIcon,
                title: 'تسجيل بواسطة أبل',
              ),
              if(Platform.isIOS)
              const SizedBox(height: 16,),
              SocialLoginButton(
                onPressed: (){
                  SignInCubit.get(context).signInWithFacebook();

                },
                image: Assets.imagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
              ),






            ]
          ),
        ),
      )
    );
  }
}

