import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';
import 'package:rg_foods/common_widget/round_button.dart';
import 'package:rg_foods/view/main_tab/maintab_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int selectpage = 0;
  PageController controller = PageController();
  List Arr_page = [
    {
      "title": "Find Food You Love",
      "subtitle":
          "Discover the best foods from over 1,000\nrestaurants and fast delivery to your\ndoorstep",
      "image": "assets/images/onboarding1.png",
    },
    {
      "title": "Fast Delivery",
      "subtitle": "Fast food delivery to your home, office\nwherever you are",
      "image": "assets/images/onboarding2.png",
    },
    {
      "title": "Live Tracking",
      "subtitle":
          "Real time tracking of your food on the app\nonce you placed the order",
      "image": "assets/images/onboarding3.png",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      setState(() {
        selectpage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        PageView.builder(
            controller: controller,
            itemCount: Arr_page.length,
            itemBuilder: (context, index) {
              var pObj = Arr_page[index] as Map? ?? {};
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: size.width,
                    width: size.width,
                    alignment: Alignment.center,
                    child: Image.asset(
                      pObj["image".toString()],
                      width: size.width * 0.65,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: size.width * 0.2),
                  Text(
                    pObj["title".toString()],
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Tcolor.primaryText,
                    ),
                  ),
                  SizedBox(height: size.width * 0.05),
                  Text(
                    pObj["subtitle".toString()],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Tcolor.secondaryText),
                  ),
                  SizedBox(
                    height: size.width * 0.20,
                  ),
                ],
              );
            }),
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.6),
            // Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: Arr_page.map(
                (e) {
                  var index = Arr_page.indexOf(e);
                  return Container(
                    margin: EdgeInsets.all(4),
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      color: selectpage == index
                          ? Tcolor.primary
                          : Tcolor.placeholder,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                },
              ).toList(),
            ),
            SizedBox(
              height: size.height * 0.23,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RoundButton(
                  onPressed: () {
                    if (selectpage >= 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MaintabView()));
                    } else {
                      setState(() {
                        selectpage++;
                        controller.animateToPage(selectpage,
                            duration: Duration(milliseconds: 600),
                            curve: Curves.easeInOut);
                      });
                    }
                  },
                  title: "Next"),
            ),
          ],
        )
      ]),
    );
  }
}
