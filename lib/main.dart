import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:neww/mm/local/cach_helper.dart';
import 'package:neww/mm/local/dio.dart';
import 'package:neww/mm/shared/coponents/bloc_observal.dart';
import 'package:neww/progect/shop_app/Screens/Lodin_ShopAppScreen.dart';
import 'package:neww/progect/shop_app/Screens/onPordingScreen.dart';
import 'package:neww/progect/shop_app/Screens/shop_Home_screen.dart';
import 'package:neww/progect/shop_app/blocSerch/cubit.dart';
import 'package:neww/progect/shop_app/bloc_All_ShopAPP/cubit.dart';

import 'mm/NETWORK/END_point.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  /*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  await CachHealper.init();
  Diohlper.init();
  //dynamic onBoardingFinish = false;
 dynamic onBoardingFinish = CachHealper.getDBoollen(key: 'onBoarding');
  token = CachHealper.getDBoollen(key: 'token');
  print(token);
   Widget start;

   if (onBoardingFinish !=null)
   {
     if(token !=null) start=shop_Home_screen();
     else start=Lodin_ShopAPP();
   }else{

     start=OnBrrdingScreen();
   }

/*  if (onBoardingFinish != null) {
    if (token == null) {
      start = Lodin_ShopAPP();
    } else {
      start = const shop_Home_screen();
    }
  } else {
    start = OnBrrdingScreen();
  }*/

  runApp(MyApp( startApp:  start));
}

class MyApp extends StatelessWidget {
  Widget startApp;

  MyApp({required this.startApp});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (BuildContext context) => ShopCubit()
            ..getHomeData()
            ..getCategoriesData()
            ..getChangeFavouretsData()
            ..getUserData(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: Colors.white,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark),
            backgroundColor: Colors.white,
            elevation: 0.0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        darkTheme: ThemeData(
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: HexColor("333739"),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: HexColor("333739"),
                statusBarIconBrightness: Brightness.dark),
            backgroundColor: HexColor("333739"),
            elevation: 0.0,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            backgroundColor: HexColor("333739"),
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        themeMode: ThemeMode.light,
        home: startApp,
      ),
    );
  }
}
