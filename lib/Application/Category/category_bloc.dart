import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:curved_nav/domain/failures/main_failure.dart';
import 'package:curved_nav/domain/models/category%20model/category_model.dart';
import 'package:curved_nav/domain/models/i_category_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository iCategoryRepository;
  CategoryBloc(this.iCategoryRepository) : super(CategoryState.initial()) {
    on<GetCategory>((event, emit) async {
      emit(state.copyWith(isLoading: false, getFailureOrSuccessState: none()));
      final Either<MainFailures, List<CategoryModel>> getCategoryNames =
          await iCategoryRepository.categoryGet();
      emit(getCategoryNames.fold(
          (failures) => state.copyWith(
              isLoading: true, getFailureOrSuccessState: some(failures)),
          (success) => state.copyWith(
              isLoading: false,
              getFailureOrSuccessState: some(success),
              categoryNames: success)));
    });
    // on<AddCategory>((event, emit) async {
    //   emit(state.copyWith(isLoading: true, getFailureOrSuccessState: none()));

    //   await iCategoryRepository.categoryAdd(event.values);

    //   final updatedList = await iCategoryRepository.categoryGet();
    //   emit(updatedList.fold(
    //     (failures) => state.copyWith(
    //       isLoading: false,
    //       getFailureOrSuccessState: some(failures),
    //     ),
    //     (success) => state.copyWith(
    //       isLoading: false,
    //       getFailureOrSuccessState: some(success),
    //       categoryNames: success,
    //     ),
    //   ));
    // });

    // on<DeleteCategory>((event, emit) async {
    //   emit(state.copyWith(isLoading: true, getFailureOrSuccessState: none()));

    //   log("Deleting category ID: ${event.id}");
    //   await iCategoryRepository.categoryDelete(event.id);

    //   final updatedList = await iCategoryRepository.categoryGet();
    //   updatedList.fold(
    //     (failures) => log("Failed to fetch categories: $failures"),
    //     (success) {
    //       log("Updated categories after delete: $success");
    //       emit(state.copyWith(
    //         isLoading: false,
    //         categoryNames: success.isEmpty ? [] : success,
    //         getFailureOrSuccessState: some(success),
    //       ));
    //     },
    //   );
    //   log(state.categoryNames.toString());
    // });
    on<AddCategory>((event, emit) async {
      emit(state.copyWith(isLoading: false, getFailureOrSuccessState: none()));
      final result = await iCategoryRepository.categoryGet();
      emit(result.fold(
          (failures) => state.copyWith(
              isLoading: true, getFailureOrSuccessState: some(failures)),
          (success) => state.copyWith(
              isLoading: false,
              getFailureOrSuccessState: some(success),
              categoryNames: success)));
    });
    on<DeleteCategory>((event, emit) async {
      emit(state.copyWith(isLoading: false, getFailureOrSuccessState: none()));

      final result = await iCategoryRepository.categoryGet();
      emit(result.fold(
          (failures) => state.copyWith(
              isLoading: true, getFailureOrSuccessState: some(failures)),
          (success) => state.copyWith(
              isLoading: false,
              getFailureOrSuccessState: some(success),
              categoryNames: success)));
      log(state.categoryNames.toString());
    });
  }
}
