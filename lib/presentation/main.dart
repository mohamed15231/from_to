
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import '../app/app.dart';
import '../app/blocprovider.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp( MyApp());


}
