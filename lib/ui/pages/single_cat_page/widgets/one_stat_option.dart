import 'package:dream_bit_cats/res/app_fonts.dart';
import 'package:flutter/material.dart';

class OneStatOption extends StatelessWidget {
  final int inputNumber;
  final String stat;

  const OneStatOption({
    required this.stat,
    required this.inputNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130.0,
            child: Text(
              stat,
              style: AppFonts.f18w600Black,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            height: 10.0,
            width: 50.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: inputNumber == 1 ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
