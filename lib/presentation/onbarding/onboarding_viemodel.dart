import 'dart:async';

import 'package:complete_advanced_flutter/domain/model.dart';
import 'package:complete_advanced_flutter/presentation/Base/baseviewmodel.dart';
import 'package:complete_advanced_flutter/presentation/onbarding/onboarding.dart';

import '../resorces/assets_manager.dart';
import '../resorces/string_manager.dart';

class OnBoardingViewModel extends BaseViewModel implements OnBoardingViewModelInputs,OnBoardingViewModelOutputs{
  //straam controllers
  final StreamController _streamCOntoller = StreamController<SliderViewObject>();

  late final List<SliderObject> _list ;
  int _currentIndex = 0;


  //inputs
  @override
  void dispose() {
    // TODO: implement dispose
    _streamCOntoller.close();
  }

  @override
  void start() {
    // TODO: implement start
    _list = _getSliderData();
    //Send this slider data to view
    _postDataToVIew();
  }

  @override
  int goNext() {
    // TODO: implement goNext
    int nextIndex = _currentIndex++;
    if (nextIndex <= _list.length) {
      _currentIndex - 0; //infinite loop to go to the first item  in the list
    }
     return _currentIndex;
  }

  @override
  int goPrevious() {
    // TODO: implement goPrevious
    int previousIndex = _currentIndex--;
    if (previousIndex == -1) {
      _currentIndex -
          _list.length -
          1; //infinite loop to go to the length of the list
    }

    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
    _currentIndex = index;
    _postDataToVIew();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamCOntoller.sink;

  @override
  // TODO: implement outputSLiderViewObject
  Stream<SliderViewObject> get outputSliderViewObject => _streamCOntoller.stream.map((sliderObject)=>sliderObject);
  // private functions
  List<SliderObject> _getSliderData() => [
    SliderObject(
        title: AppStrings.onBoardingTitle1,
        subtitle: AppStrings.onBoardingSubTitle1,
        image: ImageAssets.onboardingLogo1),
    SliderObject(
        title: AppStrings.onBoardingTitle2,
        subtitle: AppStrings.onBoardingSubTitle2,
        image: ImageAssets.onboardingLogo2),
    SliderObject(
        title: AppStrings.onBoardingTitle3,
        subtitle: AppStrings.onBoardingSubTitle3,
        image: ImageAssets.onboardingLogo3),
    SliderObject(
        title: AppStrings.onBoardingTitle4,
        subtitle: AppStrings.onBoardingSubTitle4,
        image: ImageAssets.onboardingLogo4),
  ];

  _postDataToVIew(){
    inputSliderViewObject.add(SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }


}

//inpits means that the orders that viewmodel will recive from the view
abstract class OnBoardingViewModelInputs{
 void goNext(); // When user clicks on the right arrow or swipe left
 void goPrevious(); // When user clicks on the left arrow or swipe right
 void onPageChanged(int index);

 Sink get inputSliderViewObject;// this is the way to add  data to the stream .. stream input
}
// outputs means data or results will be sent from viewmodel to the view
abstract class OnBoardingViewModelOutputs{
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject{
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject,this.numOfSlides,this.currentIndex);
}