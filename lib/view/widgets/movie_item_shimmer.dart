import 'package:flutter/material.dart';
import 'package:instabug_flutter_task/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

//This widget is used to show a shimmer effect
// when the movies are being fetched
class MovieItemShimmer extends StatelessWidget {
  const MovieItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer(
        gradient: AppColors.shimmerGradient,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
