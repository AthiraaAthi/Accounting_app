part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState({
    required bool isLoading,
    required List<CategoryModel> categoryNames,
    required Option getFailureOrSuccessState,
  }) = _CategoryState;
  factory CategoryState.initial() {
    return CategoryState(
        isLoading: false, categoryNames: [], getFailureOrSuccessState: none());
  }
}
