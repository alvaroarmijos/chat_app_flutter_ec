import 'package:chat_app_flutter_ec/data/authentication/domain/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<void> {
  OnboardingCubit(
    this._authenticationRepository,
  ) : super(());

  final AuthenticationRepository _authenticationRepository;

  void signInWithGoogle() {
    _authenticationRepository.signInWithGoogle();
  }
}
