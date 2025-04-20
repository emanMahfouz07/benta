import 'package:benta/Features/Home/presentation/views/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              Expanded(child: CustomSearchBar(customICon: Icons.mic_none)),
            ],
          ),
        ],
      ),
    );
  }
}
