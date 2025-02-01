import 'package:bloc/bloc.dart';
import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';
import 'package:curved_nav/domain/models/history%20and%20others%20model/history_model.dart';
import 'package:curved_nav/domain/models/i_history_repository.dart';
import 'package:curved_nav/domain/models/i_join_repository.dart';
import 'package:curved_nav/domain/models/i_lender_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'lender_event.dart';
part 'lender_state.dart';
part 'lender_bloc.freezed.dart';

@injectable
class LenderBloc extends Bloc<LenderEvent, LenderState> {
  final ILenderRepository iLenderRepository;
  final IJoinRepository iJoinRepository;
  final IHistoryRepository iHistoryRepository;
  LenderBloc(
      this.iLenderRepository, this.iJoinRepository, this.iHistoryRepository)
      : super(LenderState.initial()) {
    on<GetData>((event, emit) async {
      emit(state.copyWith(isLoading: true, getFailureOrSuccess: none()));
      final Either<MainFailures, List<LendingModel>> getLenderDetails =
          await iLenderRepository.getDetails();
      emit(getLenderDetails.fold(
          (failures) => state.copyWith(
              isLoading: false,
              getFailureOrSuccess: some(failures)), (success) {
        // success.sort((first, second) => second.id!.compareTo(first.id!));
        return state.copyWith(
            isLoading: false,
            getFailureOrSuccess: some(success),
            joinData: state.joinData,
            data: success);
      }));
    });
    on<JoinGetData>((event, emit) async {
      emit(state.copyWith(isLoading: true, getFailureOrSuccess: none()));
      final Either<MainFailures, List<LendingModel>> getLenderDetails =
          await iJoinRepository.getJoinCardInformation(event.code);
      emit(getLenderDetails.fold(
          (failures) => state.copyWith(
              isLoading: false,
              getFailureOrSuccess: some(failures)), (success) {
        // success.sort((first, second) => second.id!.compareTo(first.id!));
        return state.copyWith(
            isLoading: false,
            getFailureOrSuccess: some(success),
            data: state.data,
            joinData: success);
      }));
    });
    on<History>((event, emit) async {
      emit(
        state.copyWith(
            isLoading: true, getFailureOrSuccess: none(), historyData: []),
      );
      final Either<MainFailures, List<HistoryModel>> getHistory =
          await iHistoryRepository.getDetails(event.id);
      emit(getHistory.fold(
          (failure) => state.copyWith(
              isLoading: false, getFailureOrSuccess: some(failure)),
          (success) => state.copyWith(
              isLoading: false,
              getFailureOrSuccess: some(success),
              historyData: success)));
    });
    on<Search>((event, emit) async {
      emit(state.copyWith(isLoading: true, getFailureOrSuccess: none()));
      final Either<MainFailures, List<LendingModel>> getLenderDetails =
          await iLenderRepository.searchResult(event.query);
      emit(getLenderDetails.fold(
          (failures) => state.copyWith(
              isLoading: false,
              getFailureOrSuccess: some(failures)), (success) {
        // success.sort((first, second) => second.id!.compareTo(first.id!));
        return state.copyWith(
            isLoading: false,
            getFailureOrSuccess: some(success),
            joinData: state.joinData,
            data: state.data,
            searchData: success);
      }));
    });
  }
}
