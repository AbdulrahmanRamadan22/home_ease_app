import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_service_app/features/home/ui/home_screen.dart';
import 'package:home_service_app/features/home_layout/logic/state.dart';
import 'package:home_service_app/features/categorie/ui/categories_scraan.dart';

import '../../history/history_screen.dart';
import '../../profile/ui/profile_screen.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  int currentIndex = 0;

  // ProfileCubit profileCubit = ProfileCubit();

  List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const HistoryScreen(),
    const ProfileScreen(),

    // const ProfileScreen(),
  ];
  void changeBottomNav(int index) {
    currentIndex = index;

    emit(BottomNavigationBarChange());

    // if(currentIndex==2){

    //   profileCubit.getUser();
    // }
  }
}
