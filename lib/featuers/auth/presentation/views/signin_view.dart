import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it__service.dart';
import 'package:fruits_hub/featuers/auth/presentation/cuibits/signin_cubit/sign_in_cubit.dart';
import 'package:fruits_hub/featuers/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../domin/repos/auth_repo.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(title: 'تسجيل الدخول', context: context),
        body: const SignInViewBodyBlocConsumer(),
      ),
    );
  }


}

