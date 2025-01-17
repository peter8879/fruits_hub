import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domin/entites/user_entity.dart';
import '../../../domin/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  static SignUpCubit get(context)=>BlocProvider.of(context);

  Future<void> createUserWithEmailAndPassword({required String email,required String password,required String name})async
  {
    emit(LoadingSignUp());
    var result= await authRepo.createUserWithEmailAndPassword(email: email, password: password, name: name);
    result.fold((l) {
      emit(FailureSignUp(message: l.message));
    }, (r) {
      emit(SuccessSignUp(userEntity: r));
    });

  }
}
