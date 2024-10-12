import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_engineer/constants/asset_paths.dart';
import 'package:flutter_engineer/core/app_theme.dart';
import 'package:flutter_engineer/constants/constants.dart';
import 'package:flutter_engineer/constants/dimensions.dart';
import 'package:flutter_engineer/views/widgets/app_bar.dart';
import 'package:flutter_engineer/views/widgets/image_card.dart';
import 'package:flutter_engineer/views/widgets/record.dart';
import 'package:flutter_engineer/views/widgets/welcome_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double modalHeightFactor = 0.0;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1300), () {
      setState(() {
        modalHeightFactor = maxHeightRatio;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            duration: const Duration(milliseconds:700),
            curve: Curves.decelerate,
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
                } else if (direction == ScrollDirection.reverse) {
                  modalHeightFactor = maxHeightRatio;
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
                      const ImageBox(AppImages.kitchen),
                      mediumVerticalSpace,
                      StaggeredGrid.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: const [
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 4,
                            child: ImageBox(AppImages.room1),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2,
                            child: ImageBox(AppImages.room2),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2,
                            child: ImageBox(AppImages.room3),
                          ),
                        ],
                      ),
                      smallVerticalSpace,
                      StaggeredGrid.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: [
                          const StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 4,
                            child: ImageBox(AppImages.room1),
                          ),
                          const StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2,
                            child: ImageBox(AppImages.room2),
                          ),
                          const StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2,
                            child: ImageBox(
                              AppImages.room3,
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
