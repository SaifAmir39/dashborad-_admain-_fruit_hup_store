part of 'imagepicker_cubit.dart';


abstract class ImagepickerState {}

class ImagepickerInitial extends ImagepickerState {}

class Imagepickerlodaing extends ImagepickerState {}


class Imagepickersucess extends ImagepickerState {
 XFile ?imagepicked;


  Imagepickersucess({required this.imagepicked});

}


class Imagepickerfailer extends ImagepickerState {
String errormassge;

  Imagepickerfailer({required this.errormassge});

}


