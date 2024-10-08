
import 'package:complete_advanced_flutter/presentation/onbarding/onboarding_viemodel.dart';
import 'package:complete_advanced_flutter/presentation/resorces/assets_manager.dart';
import 'package:complete_advanced_flutter/presentation/resorces/color_manager.dart';
import 'package:complete_advanced_flutter/presentation/resorces/roots_manager.dart';
import 'package:complete_advanced_flutter/presentation/resorces/string_manager.dart';
import 'package:complete_advanced_flutter/presentation/resorces/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../domain/model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController _pageController = PageController(initialPage: 0);
  OnBoardingViewModel _viewModel = OnBoardingViewModel();
  _bind(){
    _viewModel.start();
  }
  @override
  void initState() {
    _bind();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context,snapShot){
        return _getContentWidget(snapShot.data);
      },
    );
  }
  Widget _getContentWidget(SliderViewObject? sliderViewObject){
  if(sliderViewObject == null){
    return Container();
  } else
  {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject.numOfSlides,
          onPageChanged: (index) {
          _viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObject.sliderObject);
          }),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: Text(
                  AppStrings.skip,
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            //Add layout for indicator and arrows
            _getBottomSheetWidget(sliderViewObject),
          ],
        ),
      ),
    );
  }
  }
  Widget _getBottomSheetWidget(SliderViewObject sliderObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //left arrow
          Padding(
            padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              onTap: () {
                //go to previous slide
                _pageController.animateToPage(_viewModel.goPrevious(),
                    duration:
                        const Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut);
              },
            ),
          ),
          // circle indicators
          Row(
            children: [
              for (int i = 0; i < sliderObject.numOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i,sliderObject.currentIndex),
                )
            ],
          ),
          //right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc),
              ),
              onTap: () {
                //go to next slide
                _pageController.animateToPage(_viewModel.goNext(),
                    duration:
                        const Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut);
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget _getProperCircle(int index, int _currentIndex) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCirlceIc); // selected slider
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc); // unselected slider
    }
  }
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;

  OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}

