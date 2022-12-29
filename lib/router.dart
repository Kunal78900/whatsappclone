import 'dart:io';

import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/widgets/error.dart';
import 'package:whatsapp_ui/features/auth/screens/login_screen.dart';
import 'package:whatsapp_ui/features/auth/screens/user_information_screen.dart';
import 'package:whatsapp_ui/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:whatsapp_ui/features/chat/screens/mobile_chat_screen.dart';
import 'package:whatsapp_ui/features/status/screens/confirm_status_screen.dart';

import 'features/auth/screens/otp_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: ((context) => const LoginScreen()));
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
          builder: ((context) => OTPScreen(
                verificationId: verificationId,
              )));
    case UserInformationSCreen.routeName:
      return MaterialPageRoute(
          builder: ((context) => const UserInformationSCreen()));
    case SelectContactsScreen.routeName:
      return MaterialPageRoute(
          builder: ((context) => const SelectContactsScreen()));
    case MobileChatScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];

      return MaterialPageRoute(
          builder: ((context) =>  MobileChatScreen(name: name,uid: uid,)));
      case ConfirmStatusScreen.routeName:
      final file  = settings.arguments as File;
     

      return MaterialPageRoute(
          builder: ((context) => ConfirmStatusScreen(file: file,) ));
    default:
      return MaterialPageRoute(
          builder: ((context) => const Scaffold(
                body: ErrorScreen(error: 'This Page does not exist'),
              )));
  }
}
