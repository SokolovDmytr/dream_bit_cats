import 'package:dream_bit_cats/res/app_fonts.dart';
import 'package:flutter/material.dart';

class StatsBar extends StatelessWidget {
  final String stat;
  final int filledColors;

  const StatsBar({
    required this.stat,
    required this.filledColors,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 140.0,
              child: Text(
                stat,
                style: AppFonts.f18w600Black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 300.0,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    height: 10.0,
                    width: 50.0,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: filledColors > index ? Colors.green : Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
