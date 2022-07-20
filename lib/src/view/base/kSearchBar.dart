import 'package:file_uploading_ui/src/util/color.dart';
import 'package:file_uploading_ui/src/util/exports.dart';

class kSearchBar extends StatelessWidget {
  kSearchBar({Key? key, required this.controller, required this.searchMethod, required this.hintText}) : super(key: key);

  TextEditingController controller;
  String hintText;
  Function searchMethod;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onEditingComplete: searchMethod(),
      keyboardType: TextInputType.name,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: kWhite,
        suffixIcon: Icon(Icons.search),
      ),
    );
  }
}
