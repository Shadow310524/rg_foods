import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';
import 'package:rg_foods/common_widget/bottom_icon.dart';
import 'package:rg_foods/view/home/home_view.dart';

class MaintabView extends StatefulWidget {
  const MaintabView({super.key});

  @override
  State<MaintabView> createState() => _MaintabViewState();
}

class _MaintabViewState extends State<MaintabView> {
  int selectTab = 2;
  PageStorageBucket storageBucket = PageStorageBucket();
  Widget selectPage = HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffDfDfD),
      body: SafeArea(
          child: PageStorage(bucket: storageBucket, child: selectPage)),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          onPressed: () {
            if (selectTab != 2) {
              selectTab = 2;
            }
            if (mounted) {
              setState(() {});
            }
          },
          shape: CircleBorder(),
          backgroundColor: selectTab == 2 ? Tcolor.primary : Tcolor.placeholder,
          child: Image.asset(
            "assets/images/tab_home.png",
            width: 35,
            height: 35,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Tcolor.white,
        surfaceTintColor: Tcolor.placeholder,
        notchMargin: 12,
        elevation: 12,
        height: 70,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomIcon(
                title: "Menu",
                onTap: () {
                  if (selectTab != 0) {
                    selectTab = 0;
                    selectPage = Container();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                icon: "assets/images/menu.png",
                isSelected: selectTab == 0),
            const Spacer(),
            BottomIcon(
                title: "Offers",
                onTap: () {
                  if (selectTab != 1) {
                    selectTab = 1;
                    selectPage = Container();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                icon: "assets/images/shopping-bag.png",
                isSelected: selectTab == 1),
            const Spacer(),
            BottomIcon(
                title: "Profile",
                onTap: () {
                  if (selectTab != 3) {
                    selectTab = 3;
                    selectPage = Container();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                icon: "assets/images/profile.png",
                isSelected: selectTab == 3),
            const Spacer(),
            BottomIcon(
                title: "More",
                onTap: () {
                  if (selectTab != 4) {
                    selectTab = 4;
                    selectPage = Container();
                  }
                  if (mounted) {
                    setState(() {});
                  }
                },
                icon: "assets/images/more.png",
                isSelected: selectTab == 4),
          ],
        ),
      ),
    );
  }
}
