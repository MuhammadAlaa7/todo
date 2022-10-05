import 'package:flutter/material.dart';

import '../theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bluishClr,
        elevation: 0,
        title: const Text('title'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Hello, Alaa',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'You have a new reminder',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: bluishClr,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.text_format,
                          size: 30,
                          color: Colors.white,
                        ),
                         SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Title',
                          style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('this is the title', style: TextStyle(color: Colors.white),),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(

                      children: const [
                        Icon(
                          Icons.description,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Description',
                          style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('this is the description', style: TextStyle(color: Colors.white),),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.date_range,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Date',
                          style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('this is the date', style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
