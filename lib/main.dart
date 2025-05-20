import 'package:curved_nav/Application/Advertisment/ad_bloc.dart';
import 'package:curved_nav/Application/Calender/calender_bloc.dart';
import 'package:curved_nav/Application/Category/category_bloc.dart';
import 'package:curved_nav/Application/Expense/expense_bloc.dart';
import 'package:curved_nav/Application/Join/join_bloc.dart';
import 'package:curved_nav/Application/Lender/lender_bloc.dart';
import 'package:curved_nav/Infrastructure/User/user_repository.dart';
import 'package:curved_nav/domain/Advertisement/ad_helper.dart';
import 'package:curved_nav/domain/core/d_i/injectable.dart';
import 'package:curved_nav/domain/models/Expense%20model/expense_model.dart';
import 'package:curved_nav/domain/models/category%20model/category_model.dart';
import 'package:curved_nav/firebase_options.dart';
import 'package:curved_nav/view/utils/Introduction%20screen/onBoarding_screen.dart';
import 'package:curved_nav/view/utils/Navigation/nav_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  loadAd();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await configInjectable();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(ExpenseModelAdapter().typeId)) {
    Hive.registerAdapter(ExpenseModelAdapter());
  }
  await UserRepository().handleUserRegistration();

  await GetStorage.init();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarContrastEnforced: false,
      systemStatusBarContrastEnforced: false,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    bool isFirstTime = box.read('first_time') ?? true;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getit<CategoryBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<ExpenseBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<LenderBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<JoinBloc>(),
        ),
        BlocProvider(
          create: (context) => CalenderBloc(),
        ),
        BlocProvider(
          create: (context) => AdBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: white),
        debugShowCheckedModeBanner: false,
        home: isFirstTime ? OnboardingScreen() : NavScreen(),
      ),
    );
  }
}
