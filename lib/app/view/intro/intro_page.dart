
import 'package:flutter/material.dart';
import 'package:hatonet_demo/app/view/intro/intro_viewmodel.dart';
import 'package:hatonet_demo/app/view/widget_utlis/base_scaffold.dart';
import 'package:hatonet_demo/app/view/widget_utlis/boarding/message_item.dart';
import 'package:hatonet_demo/app/view/widget_utlis/boarding/on_boarding_animation_widget.dart';
import '../../module/res/colors.dart';
import '../../module/res/dimens.dart';
import '../../viewmodel/base_viewmodel.dart';

class IntroPage extends PageProvideNode<IntroViewModel> {
  IntroPage() : super();

  @override
  Widget buildContent(BuildContext context) {
    return _IntroContentPage(viewModel);
  }
}

class _IntroContentPage extends StatefulWidget {
  final IntroViewModel _introViewModel;

  _IntroContentPage(this._introViewModel);

  @override
  State<_IntroContentPage> createState() => _IntroContentState();
}

class _IntroContentState extends State<_IntroContentPage> {
  IntroViewModel get introViewModel => widget._introViewModel;

  final PageController _pageController = PageController();

  Widget _onBoardingAnimationWithMessage() {
    return AspectRatio(
      aspectRatio: 3.7 / 5,
      child: PageView.builder(
          controller: _pageController,
          itemCount: introViewModel.onBoardingTitles.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                OnBoardingAnimationWidget(
                    initialStep: index,
                    url: introViewModel.onBoardingUrl[index]
                ),
                MessageItem(
                  onBoardingTitle: introViewModel.onBoardingTitles[index],
                  onBoardingDescription: introViewModel.onBoardingDescriptions[index],
                ),
              ],
            );
          }),
    );
  }

  // Widget _onBoardingButtonGroup() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(
  //       horizontal: size_24_w,
  //       vertical: size_24_h,
  //     ),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         _buildBtnGetStarted(),
  //         Divider(
  //           height: size_12_h,
  //           color: Colors.transparent,
  //         ),
  //         _buildBtnHaveAccount(),
  //         // AnimatedInWidget(
  //         //   order: 5,
  //         //   child: _onBoardingSocialButtonGroup(),
  //         // ),
  //       ],
  //     ),
  //   );
  // }



  Widget _page2() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          _onBoardingAnimationWithMessage(),
          SizedBox(
            height: size_10_h,
          ),
          // _pageIndicator(),
          // _onBoardingButtonGroup(),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => introViewModel.onDoubleBackToExit(),
      child: BaseScaffold(
        isAppBar: false,
        transparentStatusBar: 0.0,
        statusBarColor: Colors.white,
        backgroundColor: kWhite,
        body: _page2(),
      ),
    );
  }





}
