import 'package:doctor_app/screens/appoinment_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class ScheduleAppoinment extends StatefulWidget {
  const ScheduleAppoinment({
    super.key,
  });

  @override
  State<ScheduleAppoinment> createState() => _ScheduleAppoinmentState();
}

class _ScheduleAppoinmentState extends State<ScheduleAppoinment>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2); // Two tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = context.read<ThemeProvider>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Schedule",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notification_important,
                ),
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: const Color(0xffF7F8FD),
                  borderRadius: BorderRadius.circular(30.0),
                ), // Grey container color
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // Shadow color
                        spreadRadius: 1, // Spread radius
                        blurRadius: 3, // Blur radius
                        offset: const Offset(
                            0, 3), // Offset in the vertical direction
                      ),
                    ],
                    borderRadius:
                        BorderRadius.circular(30.0), // Rounded corners
                  ),
                  tabs: const [
                    Tab(text: 'Upcoming'),
                    Tab(text: 'Past'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            buildTab1Child(themeProvider),
            const Center(
              child: Text("No appoinments"),
            )
          ],
        ));
  }

  Padding buildTab1Child(ThemeProvider themeProvider) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              themeProvider.toggleTheme();
            },
            child: const Text('Toggle Theme'),
          ),
          ListView.builder(
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppoinmentCard(lineColor: Colors.green),
              );
            },
          ),
        ],
      ),
    );
  }
}
