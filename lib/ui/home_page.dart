import 'package:flutter/material.dart';
import 'package:local_notif/main.dart';
import 'package:local_notif/routes/routes.dart';
import 'package:local_notif/utils/notification_helper.dart';
import '../widgets/custom_button.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _notificationHelper.configureSelectNotificationSubject(
        context, Routes.detail);
    _notificationHelper.configureDidReceiveLocalNotificationSubject(
        context, Routes.detail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Notification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              text: 'Show plain notification with payload',
              onPressed: () async {
                await _notificationHelper
                    .showNotifiacation(flutterLocalNotificationsPlugin);
              },
            ),
            CustomButton(
              text: 'Detail',
              onPressed: ()  {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const DetailPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    selectNotifictionSubject.close();
    didReceiveLocalNotificationSubject.close();
  }
}
