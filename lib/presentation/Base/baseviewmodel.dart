abstract class BaseViewModel implements BaseViewModelInputs , BaseViewModelOutputs {
  //shared variable and functions , that will be used for any viewmodel.
}

abstract class BaseViewModelInputs {
  void start();// will be called while init of viewmodel.
  void dispose();//will be called  when viewmodel deinitialize.
}

abstract class BaseViewModelOutputs {}
