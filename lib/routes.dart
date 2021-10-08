import 'package:flutter/material.dart';
import 'package:personal_expenses/screens/fixes_screen.dart';
import 'package:personal_expenses/screens/home_screen.dart';
import 'package:personal_expenses/screens/month_screen.dart';
import 'package:personal_expenses/screens/objective_screen.dart';

class AppScreens {
  final String path;
  final Widget screen;
  final String title;
  final Icon icon;

  AppScreens({
    required this.path,
    required this.screen,
    required this.title,
    required this.icon,
  });
}

final pages = [
  AppScreens(
    path: "/home",
    screen: const HomeScreen(),
    title: "Geral",
    icon: const Icon(Icons.bar_chart),
  ),
  AppScreens(
    path: "/months",
    screen: const MonthScreen(),
    title: "Meses",
    icon: const Icon(Icons.calendar_today),
  ),
  AppScreens(
    path: "/fixes",
    screen: const FixesScreen(),
    title: "Fixos",
    icon: const Icon(Icons.lock_clock),
  ),
  AppScreens(
    path: "/objective",
    screen: const ObjectiveScreen(),
    title: "Objetivo",
    icon: const Icon(Icons.mode_standby),
  ),
];
