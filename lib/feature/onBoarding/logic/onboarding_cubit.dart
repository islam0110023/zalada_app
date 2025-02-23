import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  increment() => emit(state + 1);
}
