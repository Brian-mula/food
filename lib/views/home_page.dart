import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/constants/helpers.dart';
import 'package:food/widgets/big_text_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              BigTextWidget(
                text: "Good food",
                color: Helpers.foodBlack87,
                size: 22,
              ),
              SizedBox(
                height: 10,
              ),
              BigTextWidget(
                text: "Fast delivery",
                color: Helpers.foodBlack87,
                size: 22,
              )
            ],
          ),
        ),
      ],
    );
  }
}
