import 'package:flutter/material.dart';
import 'package:host_booking_pitch/home_screen/add_mother_pitch/mother_pitch.dart';
import 'home_screen/addDetailPitch/son_pitch.dart';
import 'home_screen/calendar/main_screen.dart';
import 'home_screen/detail_pitch/main_screen.dart';
import 'home_screen/feedback/feedback.dart';
import 'home_screen/main_screen.dart';
import 'home_screen/notification/main_screen.dart';
import 'home_screen/profile/profile.dart';
import 'home_screen/updateMotherPitch/mother_pitch.dart';
import 'home_screen/update_son_pitch/update_son_pitch.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => CalendarToday());

      case '/account':
        return MaterialPageRoute(builder: (_) => ProfilePage());

      case '/detailPitch':
        return MaterialPageRoute(builder: (_) => MainScreenDetailPitch());

      case '/addMotherPitch':
        return MaterialPageRoute(builder: (_) => MotherPage());

      case '/addSonPitch':
        return MaterialPageRoute(builder: (_) => SonPage());

      case '/notification':
        return MaterialPageRoute(builder: (_) => NotificationPitch());

      case '/calendar':
        return MaterialPageRoute(builder: (_) => CalendarOfCustomer());

      case '/updateModerPitch':
        return MaterialPageRoute(builder: (_) => UpdateMotherPage());
      case '/updateSonPitch':
        return MaterialPageRoute(builder: (_) => UpdateSonPage());
      case '/feedback':
        return MaterialPageRoute(builder: (_) => ViewFeedback());
      default:
        return MaterialPageRoute(builder: (_) => CalendarToday());
    }
  }
}
