import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_function/build_error_bar.dart';
import 'package:fruits_hub/core/widgets/custom_indicator.dart';
import 'package:fruits_hub/featuers/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:fruits_hub/featuers/home/presentation/views/main_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../cuibits/signup_cubit/sign_up_cubit.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit,SignUpState>
      (
      builder: (context, state) {
        return  ModalProgressHUD(
          progressIndicator: const CustomIndicator(),
          inAsyncCall: state is LoadingSignUp?true:false,
            child:  const SignupViewBody(),
        );
      },
      listener: (context, state) {
        if(state is SuccessSignUp){
        Navigator.pushReplacementNamed(context, MainView.routeName);
        }
        else if(state is FailureSignUp)
          {
            buildErrorBar(context, state.message);
          }

      },

    );
  }


}
