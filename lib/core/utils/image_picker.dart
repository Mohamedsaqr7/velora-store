import 'package:image_picker/image_picker.dart';

class PickImageUtil {
  static Future<XFile?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (pickedFile != null) {
      return XFile(pickedFile.path);
    }
    return null;
  }
}
