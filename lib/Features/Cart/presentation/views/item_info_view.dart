import 'package:benta/Features/Cart/presentation/views/widgets/item_info_view_body.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemInfoView extends StatelessWidget {
  const ItemInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: kBGColor, body: ItemInfoViewBody());
  }
}
