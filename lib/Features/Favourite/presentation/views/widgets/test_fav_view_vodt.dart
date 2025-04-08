import 'package:benta/Features/Favourite/presentation/views/widgets/fav_item_container.dart';
import 'package:benta/Features/Home/presentation/views/widgets/custom_search_bar.dart';
import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/widgets/custom_all_use_button.dart';
import 'package:benta/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TestFavViewVodt extends StatefulWidget {
  const TestFavViewVodt({super.key});

  @override
  State<TestFavViewVodt> createState() => _TestFavViewVodtState();
}

class _TestFavViewVodtState extends State<TestFavViewVodt> {
  final ScrollController _scrollController = ScrollController();
  bool _showButton = true;
  bool _canScroll = false;

  final List<Map<String, dynamic>> cartItems = [
    {
      "title": "Sofa - bed",
      "image": 'assets/images/peyton_2_seater_sofa-compact_sized 1.png',
      "rate": 4.5,
      "price": "100.00",
    },
    {
      "title": "Sofa - bed",
      "image": 'assets/images/peyton_2_seater_sofa-compact_sized 1.png',
      "rate": 4.7,
      "price": "85.50",
    },
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _canScroll = _scrollController.position.maxScrollExtent > 0;
      });
    });

    _scrollController.addListener(() {
      final direction = _scrollController.position.userScrollDirection;

      if (_canScroll) {
        if (direction == ScrollDirection.reverse && _showButton) {
          setState(() => _showButton = false);
        } else if (direction == ScrollDirection.forward && !_showButton) {
          setState(() => _showButton = true);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),

              // AppBar + Search
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      CustomAppBar(title: 'Favourite'),
                      CustomSearchBar(),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),

              // Items list
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final item = cartItems[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: FavouriteItemContainer(
                        title: item['title'],
                        image: item['image'],
                        price: item['price'],
                        rate: item['rate'],
                      ),
                    );
                  }, childCount: cartItems.length),
                ),
              ),

              // Regular Button at the bottom of content
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 10.h, 24.w, 40.h),
                  child: CustomAllUseButton(
                    title: 'Add all item to cart',
                    onPressed: () {
                      context.pushReplacement(AppRouter.kMyCartView);
                    },
                  ),
                ),
              ),
            ],
          ),

          // Floating button (only if scrollable)
          if (_canScroll)
            Positioned(
              left: 24.w,
              right: 24.w,
              bottom: 24.h,
              child: AnimatedSlide(
                offset: _showButton ? Offset.zero : Offset(0, 2),
                duration: Duration(milliseconds: 300),
                child: AnimatedOpacity(
                  opacity: _showButton ? 1 : 0,
                  duration: Duration(milliseconds: 300),
                  child: CustomAllUseButton(
                    title: 'Add all item to cart',
                    onPressed: () {
                      context.pushReplacement(AppRouter.kMyCartView);
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
