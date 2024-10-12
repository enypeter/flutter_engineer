import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_engineer/constants/asset_paths.dart';
import 'package:flutter_engineer/core/app_theme.dart';
import 'package:flutter_engineer/constants/constants.dart';
import 'package:flutter_engineer/constants/dimensions.dart';
import 'package:flutter_engineer/views/widgets/app_bar.dart';
import 'package:flutter_engineer/views/widgets/image_card.dart';
import 'package:flutter_engineer/views/widgets/large_image_card.dart';
import 'package:flutter_engineer/views/widgets/record.dart';
import 'package:flutter_engineer/views/widgets/welcome_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double modalHeightFactor = 0.0;
  bool over = false;
  bool isComplete = false;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        modalHeightFactor = minHeightRatio;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isComplete = true;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [AppColors.backgroundColor, AppColors.lightColor],
              stops: const [0.4, 1])),
      height: height(context),
      width: width(context),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                const CustomAppBar(),
                tinyVerticalSpace,
                const WelcomeText(),
                const Records(),
                largeVerticalSpace(context, 0.04),
              ],
            ),
          ),
          bottomSheet: AnimatedContainer(
            height: height(context) * modalHeightFactor,
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeOut,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(25)),
            padding: const EdgeInsets.all(10).copyWith(bottom: 0),
            child: NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.forward &&
                    scrollController.offset == 0) {
                  modalHeightFactor = minHeightRatio;
                  over = false;
                } else if (direction == ScrollDirection.reverse) {
                  modalHeightFactor = maxHeightRatio;
                  over = true;
                }
                setState(() {});
                return true;
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                       const LardImageCard(),
                      mediumVerticalSpace,
                      StaggeredGrid.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: [
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 4,
                            child: ImageBox(AppImages.room1, over: over),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2,
                            child: ImageBox(AppImages.room2, over: over),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2,
                            child: ImageBox(AppImages.room3, over: over),
                          ),
                        ],
                      ),
                      smallVerticalSpace,
                      StaggeredGrid.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: [
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 4,
                            child: ImageBox(AppImages.room1, over: over),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2,
                            child: ImageBox(AppImages.room2, over: over),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2,
                            child: ImageBox(
                              AppImages.room3,
                              over: over,
                            ),
                          ),
                          largeVerticalSpace(context, 0.08)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
