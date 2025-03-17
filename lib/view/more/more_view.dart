import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';
import 'package:rg_foods/view/more/payment_view.dart';

class MoreView extends StatefulWidget {
  const MoreView({super.key});

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  List<Map<String, dynamic>> more_arr = [
    {
      "index": 1,
      "image": "assets/images/payment_details.png",
      "name": "Payment Details",
      "notifications": 0,
    },
    {
      "index": 2,
      "image": "assets/images/my_orders.png",
      "name": "My Orders",
      "notifications": 0,
    },
    {
      "index": 3,
      "image": "assets/images/notifications.png",
      "name": "Notifications",
      "notifications": 0,
    },
    {
      "index": 4,
      "image": "assets/images/inbox.png",
      "name": "Inbox",
      "notifications": 100,
    },
    {
      "index": 5,
      "image": "assets/images/info.png",
      "name": "About Us",
      "notifications": 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "More",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset("assets/images/shopping-cart.png",
                        width: 22.76, height: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: more_arr.length,
                itemBuilder: (context, index) {
                  var more_items = more_arr[index];
                  return GestureDetector(
                    onTap: () {
                      switch (more_items["index"]) {
                        case 1:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentView()));
                          break;
                        case 2:
                          break;
                        case 3:
                          break;
                        case 4:
                          break;
                        case 5:
                          break;
                        default:
                      }
                    },
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          margin:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                          decoration: BoxDecoration(
                              color: Tcolor.textfield,
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Image.asset(
                                more_items["image"],
                                height: 25,
                                width: 25,
                              ),
                            ),
                            title: Text(
                              more_items["name"],
                              style: TextStyle(
                                  color: Tcolor.primaryText,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Positioned(
                            top: size.width * 0.07,
                            right: size.width * 0.03,
                            child: Container(
                              padding: EdgeInsets.symmetric(),
                              decoration: BoxDecoration(
                                  color: Tcolor.textfield,
                                  shape: BoxShape.circle),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios)),
                            )),
                        if (more_items["notifications"] > 0)
                          Positioned(
                              top: size.width * 0.095,
                              right: size.width * 0.18,
                              child: Container(
                                  constraints: BoxConstraints(
                                    minWidth: 25,
                                    minHeight: 25,
                                  ),
                                  width: 30,
                                  height: 30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    more_items["notifications"] < 99
                                        ? more_items["notifications"].toString()
                                        : "99+",
                                    style: TextStyle(
                                        color: Tcolor.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  )))
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
