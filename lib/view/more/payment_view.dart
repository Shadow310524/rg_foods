import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';
import 'package:rg_foods/common_widget/round_button.dart';
import 'package:rg_foods/view/more/add_card_view.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  List<Map<String, String>> savedCards = [
    {
      "type": "Visa",
      "number": "**** **** **** 7321",
      "image": "assets/images/visa_logo.png"
    },
    {
      "type": "MasterCard",
      "number": "**** **** **** 9834",
      "image": "assets/images/mastercard.png"
    },
    {
      "type": "Amex",
      "number": "**** **** **** 1245",
      "image": "assets/images/amex_logo.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Payment Details",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset("assets/images/shopping-cart.png",
                          width: 22.76, height: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Customize your payment method",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(),
              ),
              SizedBox(height: 10),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: savedCards.length,
                  itemBuilder: (context, index) {
                    var card_list = savedCards[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, 10))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cash/Card on delivery",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5),
                            Divider(),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  card_list["image"]!,
                                  height: 50,
                                  width: 50,
                                ),
                                Spacer(),
                                Text(
                                  card_list["number"]!,
                                  style: TextStyle(
                                    color: Tcolor.secondaryText,
                                  ),
                                ),
                                Spacer(),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          color: Tcolor.primary, width: 1)),
                                  child: Text(
                                    "Delete Card",
                                    style: TextStyle(
                                      color: Tcolor.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(),
                            SizedBox(height: 10),
                            Text(
                              "Other Methods",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddCardView()));
                    },
                    title: "Add another Credit/Debit Card"),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
