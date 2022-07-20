
import 'package:file_uploading_ui/src/util/exports.dart';

class kAudioItemCard extends StatelessWidget {
  kAudioItemCard({Key? key, required this.data}) : super(key: key);

  AudioCardData data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.4,
      width: size.width * 0.4,
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        color: data.color,
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
      ),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              data.title,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(height: Dimensions.paddingSizeSmall,),
            Text(
              data.date,
              style: TextStyle(
                fontSize: 14,
                color: kBlack.withOpacity(0.7)
              ),
            )
          ],
        ),
      ),
    );
  }
}
