import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it__service.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/featuers/auth/presentation/cuibits/signup_cubit/sign_up_cubit.dart';
import 'package:fruits_hub/featuers/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';

import '../../domin/repos/auth_repo.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const String routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(title: 'حساب جديد', context: context),
        body: const SignupViewBodyBlocConsumer()
      ),
    );
  }
}

