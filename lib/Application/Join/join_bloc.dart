import 'package:bloc/bloc.dart';
import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';
import 'package:curved_nav/domain/models/i_join_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'join_event.dart';
part 'join_state.dart';
part 'join_bloc.freezed.dart';

@injectable
class JoinBloc extends Bloc<JoinEvent, JoinState> {
  final IJoinRepository iJoinRepository;
  JoinBloc(this.iJoinRepository) : super(JoinState.initial()) {
    on<_Started>((event, emit) async {
      emit(state.copyWith(
          isLoading: true, getFailureOrSuccess: none(), isError: false));
      final Either<MainFailures, List<LendingModel>> getLenderDetails =
          await iJoinRepository.getJoinCard();
      emit(getLenderDetails.fold((failures) {
        return state.copyWith(
            isLoading: false,
            isError: true,
            getFailureOrSuccess: some(failures));
      }, (success) {
        success.sort((a, b) => b.datetime!.compareTo(a.datetime!));
        return state.copyWith(
            isLoading: false,
            isError: false,
            getFailureOrSuccess: some(success),
            joinData: success);
      }));
    });
  }
}
