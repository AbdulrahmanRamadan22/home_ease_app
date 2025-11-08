import 'package:flutter/material.dart';
import 'package:home_service_app/features/history/widget/container_ongoing.dart';
import 'package:home_service_app/features/history/widget/container_past.dart';

import '../../core/theming/colors.dart';
import '../../core/theming/text_styles .dart';


class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: Durations.short3,
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        backgroundColor: ColorsApp.lightGreen,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('History', style: TextStyles.font18Black700),
          bottom: TabBar(
            dividerColor: ColorsApp.white,
            isScrollable: false,
            labelColor: ColorsApp.black,
            labelStyle: TextStyles.font16Black600,
            indicatorColor: ColorsApp.mainGreen,
            indicatorWeight: 4,
            tabs: const <Widget>[
              Tab(
                text: 'Ongoing',
              ),
              Tab(
                text: 'Past',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            NestedTabBarOngoing(),
            NestedTabBarPast(),
          ],
        ),
      ),
    );
  }
}
