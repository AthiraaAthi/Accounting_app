// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:curved_nav/Application/Category/category_bloc.dart' as _i402;
import 'package:curved_nav/Application/Expense/expense_bloc.dart' as _i1062;
import 'package:curved_nav/Application/Lender/lender_bloc.dart' as _i203;

import 'package:curved_nav/domain/functions/user_detection.dart' as _i155;
import 'package:curved_nav/domain/models/i_category_repository.dart' as _i794;
import 'package:curved_nav/domain/models/i_expense_repository.dart' as _i338;
import 'package:curved_nav/domain/models/i_help_repository.dart' as _i512;
import 'package:curved_nav/domain/models/i_history_repository.dart' as _i2;
import 'package:curved_nav/domain/models/i_join_repository.dart' as _i988;
import 'package:curved_nav/domain/models/i_lender_repository.dart' as _i367;

import 'package:curved_nav/Infrastructure/Category/category_repository.dart'
    as _i660;
import 'package:curved_nav/Infrastructure/Expense/expense_repository.dart'
    as _i360;
import 'package:curved_nav/Infrastructure/Help/help_repository.dart' as _i650;
import 'package:curved_nav/Infrastructure/Lender/details.repository.dart'
    as _i559;
import 'package:curved_nav/Infrastructure/Lender/join_repository.dart' as _i241;
import 'package:curved_nav/Infrastructure/Lender/lender_repository.dart'
    as _i783;
import 'package:curved_nav/Infrastructure/User/user_repository.dart' as _i572;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i988.IJoinRepository>(() => _i241.JoinFunctions());
    gh.lazySingleton<_i512.IHelpRepository>(() => _i650.HelpRepository());
    gh.lazySingleton<_i794.ICategoryRepository>(
        () => _i660.CategoryFunctions());
    gh.lazySingleton<_i2.IHistoryRepository>(() => _i559.HistoryFunctions());
    gh.lazySingleton<_i155.IUserDetection>(() => _i572.UserRepository());
    gh.lazySingleton<_i338.IExpenseRepository>(() => _i360.ExpenseFunctions());

    gh.lazySingleton<_i367.ILenderRepository>(() => _i783.LenderFunctions());
    gh.factory<_i1062.ExpenseBloc>(
        () => _i1062.ExpenseBloc(gh<_i338.IExpenseRepository>()));
    gh.factory<_i402.CategoryBloc>(
        () => _i402.CategoryBloc(gh<_i794.ICategoryRepository>()));
    gh.factory<_i203.LenderBloc>(() => _i203.LenderBloc(
          gh<_i367.ILenderRepository>(),
          gh<_i988.IJoinRepository>(),
          gh<_i2.IHistoryRepository>(),
        ));
    return this;
  }
}
