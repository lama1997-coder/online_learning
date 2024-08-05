import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning/configration/themedata.dart';
import 'package:online_learning/core/constans.dart';
import 'package:online_learning/data/model/course_overview_model.dart';
import 'package:online_learning/data/model/learning_plan.dart';
import 'package:online_learning/presention/bloc/login/login_bloc.dart';
import 'package:online_learning/presention/bloc/login/login_event.dart';

class HomeData {
  final List<CourseOverviewModel> courseOverview = [
    CourseOverviewModel(
        subtitle: '',
        title: 'What do you\nwant to learn\n today ?',
        image: Images.overview1,
        color: ThemeDataProvider.blueLightColor),
    CourseOverviewModel(
        subtitle: '',
        title: 'What do you\nwant to learn\n today ?',
        image: Images.overview2,
        color: ThemeDataProvider.greenLightColor)
  ];

  final List<LearningPlanModel> learningPlan = [
    LearningPlanModel(
      name: 'Packaging Design',
      total: '48',
      complate: '40',
    ),
    LearningPlanModel(name: 'Product Design', total: '24', complate: '6')
  ];

 
}
