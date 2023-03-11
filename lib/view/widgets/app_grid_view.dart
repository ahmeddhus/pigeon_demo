import 'package:flutter/material.dart';


//This widget is used to show the movies list in a grid view.
class HomeGridView extends StatelessWidget {
  final int itemCount;

  //Built-it typed of a function that takes a context and an index and returns a widget
  //Widget? Function(BuildContext context, int index);
  final NullableIndexedWidgetBuilder itemBuilder;

  const HomeGridView({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Replace with the width of your item
    const itemWidth = 120.0;

    // Calculate the number of items that can fit in a row with the given width
    //accounting to screen width and item given width.
    final crossAxisCount = (screenWidth / itemWidth).floor();

    return GridView.builder(
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //Show 10 items in a row when the movies are being fetched from the API
        //and show the calculated number of items in a row when the movies are fetched
        crossAxisCount: crossAxisCount,

        // Set the cross axis spacing(horizontal spacing) to 8 to make the items
        crossAxisSpacing: 8,

        // Set the main axis spacing(vertical) to 8 to make the items
        mainAxisSpacing: 8,

        // Set the child aspect ratio to 2/3 to make the items
        childAspectRatio: 2 / 3,
      ),

      //Use the itemBuilder to build the items
      itemBuilder: itemBuilder,
    );
  }
}
