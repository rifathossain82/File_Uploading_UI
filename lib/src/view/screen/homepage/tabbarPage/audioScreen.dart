import 'package:file_uploading_ui/src/util/exports.dart';
import 'package:file_uploading_ui/src/view/base/kAudioItemCard.dart';

class AudioScreen extends StatelessWidget {
  AudioScreen({Key? key}) : super(key: key);
  
  List<AudioCardData> dataList = [
    AudioCardData(Colors.amber, 'Voice recording', '08/08/2019'),
    AudioCardData(Colors.orange, 'Rehersals', '08/05/2019'),
    AudioCardData(Colors.grey, 'Audio', '02/05/2020'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20
        ),
        itemCount: 3,
        itemBuilder: (context, index){
          return kAudioItemCard(data: dataList[index],);
        },
      )
    );
  }
}

class AudioCardData{
  Color color;
  String title;
  String date;

  AudioCardData(this.color, this.title, this.date);


}
