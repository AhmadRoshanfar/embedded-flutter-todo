import 'package:flutter/material.dart';

class BuildTabBar extends StatefulWidget {
  const BuildTabBar({super.key});

  @override
  State<BuildTabBar> createState() => BuildTabBarState();
}

class BuildTabBarState extends State<BuildTabBar>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            unselectedLabelColor: Colors.black,
            labelColor: Colors.red,
            tabs: const [
              Tab(icon: Icon(Icons.person), text: "Today"),
              Tab(icon: Icon(Icons.add), text: "Week"),
              Tab(icon: Icon(Icons.deck), text: "Month"),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                Center(child: Text('')),
                Center(child: Text('')),
                Center(child: Text('')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
