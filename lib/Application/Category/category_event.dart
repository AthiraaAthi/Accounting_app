part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.getCategory() = GetCategory;
  const factory CategoryEvent.addCategory() = AddCategory;
  const factory CategoryEvent.deleteCategory() = DeleteCategory;
}
