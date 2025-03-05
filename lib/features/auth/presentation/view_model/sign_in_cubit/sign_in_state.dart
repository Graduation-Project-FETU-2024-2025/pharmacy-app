
sealed class SignInState {
  final String message;

  SignInState({required this.message});
}

final class SignInInitial extends SignInState {
  SignInInitial():super(message: "");
}

final class SignInLoading extends SignInState {
    SignInLoading():super(message: "");
}

final class SignInSuccess extends SignInState {
  SignInSuccess({required super.message});
  
}

final class SignInFailure extends SignInState {
  SignInFailure({required super.message});
}


