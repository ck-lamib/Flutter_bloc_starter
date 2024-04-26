import 'package:clean_folder_str/screens/home/views/home_screen.dart';
import 'package:clean_folder_str/utils/helpers/snackbar.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = "/dashboard-screen";
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardView();
  }
}

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with TickerProviderStateMixin {
  TabController? con;

  @override
  void initState() {
    con = TabController(vsync: this, length: 5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: con,
        children: const [
          HomeScreen(),
          Center(
            child: Text("Task Screen"),
          ),
          SizedBox.shrink(),
          Center(
            child: Text("Service Screen"),
          ),
          Center(
            child: Text("Profile Screen"),
          ),
          // TaskScreen(),
        ],
      ),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CustomSnackBar.success(
            context: context,
            title: "Demo success",
            message: "This is for demo success snackbar.",
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(360),
        ),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        child: TabBar(
          controller: con,
          indicatorSize: TabBarIndicatorSize.tab,
          splashBorderRadius: BorderRadius.circular(10),
          indicatorWeight: 3,
          onTap: (value) {
            if (value == 2) {
              return con?.animateTo(1);
            }
          },
          tabs: const [
            Tooltip(
              message: "Home",
              child: Tab(
                icon: Icon(
                  Icons.home,
                ),
                text: 'Home',
              ),
            ),
            Tab(
              icon: Icon(
                Icons.add_task_rounded,
              ),
              text: 'Tasks',
            ),
            SizedBox(
              height: 0,
            ),
            Tab(
              icon: Icon(
                Icons.widgets_rounded,
              ),
              text: 'Services',
            ),
            Tab(
              icon: Icon(
                Icons.person_2_rounded,
              ),
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
