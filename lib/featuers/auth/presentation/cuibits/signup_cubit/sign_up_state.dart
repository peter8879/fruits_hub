part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
final class LoadingSignUp extends SignUpState{}
final class SuccessSignUp extends SignUpState{
  final UserEntity userEntity;
  SuccessSignUp({required this.userEntity});
}
final class FailureSignUp extends SignUpState{
  final String message;

  FailureSignUp({required this.message});
}
