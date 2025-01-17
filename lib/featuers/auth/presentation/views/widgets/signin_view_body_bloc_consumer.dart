import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_function/build_error_bar.dart';
import 'package:fruits_hub/core/widgets/custom_indicator.dart';
import 'package:fruits_hub/featuers/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:fruits_hub/featuers/home/presentation/views/main_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../cuibits/signin_cubit/sign_in_cubit.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit,SignInState>(
      builder: (context,state){
        return  ModalProgressHUD(
          progressIndicator: const CustomIndicator(),
          inAsyncCall: state is SignInLoading? true:false,
            child: const SignInViewBody()
        );
      },
      listener: (context,state){
        if(state is SignInSuccess)
          {
            Navigator.pushReplacementNamed(context, MainView.routeName);

          }
        else if(state is SignInFailure)
          {
            buildErrorBar(context, state.message);
          }

      },

    );
  }
}


