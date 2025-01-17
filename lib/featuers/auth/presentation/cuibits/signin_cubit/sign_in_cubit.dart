import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruits_hub/featuers/auth/domin/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../domin/entites/user_entity.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;
  static SignInCubit get(context)=>BlocProvider.of(context);
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async{
    emit(SignInLoading());
    var result= await authRepo.signInWithEmailAndPassword(email: email, password: password);
    result.fold((l) {
      emit(SignInFailure(l.message));
    }, (r) {
      emit(SignInSuccess(r));
    });
  }
  Future<void>signInWithGoogle() async{
    emit(SignInLoading());
    var result= await authRepo.signInWithGoogle();
    result.fold((l) {
      emit(SignInFailure(l.message));
    }, (r) {
      emit(SignInSuccess(r));
    });
  }
  Future<void> signInWithFacebook()async{
    emit(SignInLoading());
    var result= await authRepo.signInWithFaceBook();
    result.fold(
        (l){
          emit(SignInFailure(l.message));
        },

          (r){
          emit(SignInSuccess(r));
    }

    );
  }
  Future<void> signInWithApple()async{
    emit(SignInLoading());
    var result= await authRepo.signInWithApple();
    result.fold(
            (l){
          emit(SignInFailure(l.message));
        },

            (r){
          emit(SignInSuccess(r));
        }

    );
  }
}
