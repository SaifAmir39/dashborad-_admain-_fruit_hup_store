import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'imagepicker_state.dart';
class ImagepickerCubit extends Cubit<ImagepickerState> {
  ImagepickerCubit() : super(ImagepickerInitial());
  Future<void> pickimage() async {
    emit(Imagepickerlodaing());
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery); 
   
           
  if (image != null) {
   emit(Imagepickersucess(imagepicked: image));
  } else {
    emit(Imagepickerfailer(

      errormassge: "Please select an image first"

    ));

  }
}
void removeImage() {
    emit(ImagepickerInitial());
  }



}