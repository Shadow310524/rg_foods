import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';

class RecentItems extends StatelessWidget {
  final List<Map<String, dynamic>> recent_items;
  final VoidCallback onpressed;
  const RecentItems({
    super.key,
    required this.recent_items,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: recent_items.length,
        itemBuilder: (context, index) {
          var mostpopular = recent_items[index];
          return InkWell(
            onTap: onpressed,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        mostpopular["image"],
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mostpopular["name"],
                          style: TextStyle(
                              color: Tcolor.primaryText,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              mostpopular["type"]!,
                              style: TextStyle(
                                  color: Tcolor.secondaryText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 10),
                            Text(
                              ".",
                              style: TextStyle(
                                  color: Tcolor.primary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(width: 10),
                            Text(
                              mostpopular["food_type"]!,
                              style: TextStyle(
                                  color: Tcolor.secondaryText,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Tcolor.primary,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text(
                              mostpopular["rate"]!,
                              style: TextStyle(
                                  color: Tcolor.primary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
