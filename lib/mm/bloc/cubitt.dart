/*
import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neww/mm/NEWA_APP/bbbbbbbbbbbbb.dart';
import 'package:neww/mm/NEWA_APP/scince.dart';
import 'package:neww/mm/NEWA_APP/sports.dart';
import 'package:neww/mm/bloc/stutess.dart';
import 'package:neww/mm/local/dio.dart';



class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndx = 0;
  List<BottomNavigationBarItem> BottomItem = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Science'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'business'),
  ];
  List<Widget> Screen = [
    sportsScreen(),
    scinceScreen(),
    bbbbbbScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndx = index;
    emit(NewChangeBottomNavState());
    if (index == 1) return getscience();
    if (index == 2) return getbbbbbbb();
  }

List<dynamic> busness = [];
  void getBesness() {
    emit(NewsLoudingBusiness());
    Diohlper.getData(url: "v2/top-headlines", quiry: {
      "country": "eg",
      "category": "business",
      "apiKey": "ff4d74e2d3b240a3b5c8da83443c00fb",
    }).then((value) {
      // print(value.data["articles"][0]["title"]);
      busness = value.data["articles"];
      emit(NewsGetBusinessSuccess());
    }).catchError((err()) {
      print(err.toString());
      emit(NewsGetBusinessError(err.toString()));
    });
  }


  List<dynamic> sports = [];
  void getsports() {
    emit(NewsLoudingSports());
    Diohlper.getData(url: "v2/top-headlines", quiry: {
      "country": "eg",
      "category": "sports",
      "apiKey": "ff4d74e2d3b240a3b5c8da83443c00fb",
    }).then((value) {
      // print(value.data["articles"][0]["title"]);
      sports = value.data["articles"];
      emit(NewsGetSportsSuccess());
    }).catchError(
          (err) {
        print(err.toString());
        emit(NewsGetSportsError(err.toString()));
      },
    );
  }

  List<dynamic> science = [];
  void getscience() {
    emit(NewsLoudingScience());
    if (science.length == 0) {
      Diohlper.getData(url: "v2/top-headlines", quiry: {
        "country": "eg",
        "category": "science",
        "apiKey": "ff4d74e2d3b240a3b5c8da83443c00fb",
      }).then((value) {
        science = value.data["articles"];
        emit(NewsGetScienceSuccess());
      }).catchError(
            (err) {
          print(err.toString());
          emit(NewsGetScienceError(err.toString()));
        },
      );
    } else {
      emit(NewsGetScienceSuccess());
    }
  }

  List<dynamic> bbbbbbb = [];
  void getbbbbbbb() {
    emit(NewsLoudingBusiness());
    if (bbbbbbb.length == 0) {
      Diohlper.getData(url: "v2/top-headlines", quiry: {
        "country": "eg",
        "category": "business",
        "apiKey": "ff4d74e2d3b240a3b5c8da83443c00fb",
      }).then((value) {
        // print(value.data["articles"][0]["title"]);
        bbbbbbb = value.data["articles"];
        emit(NewsGetBusinessSuccess());
      }).catchError((err()) {
        print(err.toString());
        emit(NewsGetBusinessError(err.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccess());
    }
  }

  List<dynamic> search = [];
  void getsearch(
      String value,
      ) {
    emit(NewsLoudingSearch());
    Diohlper.getData(url: "v2/everything",
        quiry: {
          "q": "$value",
          "apiKey": "ff4d74e2d3b240a3b5c8da83443c00fb",//
        }).then((value) {
      search = value.data["articles"];
      emit(NewsGetSearchSuccess());
    }).catchError((err()) {
      print(err.toString());
      emit(NewsGetSearchError(err.toString()));
    });
  }
}
*/
