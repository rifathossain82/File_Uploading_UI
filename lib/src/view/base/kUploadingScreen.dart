import 'package:file_uploading_ui/src/util/exports.dart';
import 'package:lottie/lottie.dart';

class kUploadingScreen extends StatelessWidget {
  kUploadingScreen({Key? key, required this.index, required this.image, required this.title, required this.subTitle}) : super(key: key);

  int index;
  String image;
  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        elevation: 0,
        leading: index == 0 ?
        IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: kBlack.withOpacity(0.8),),
        )
            :
        Container(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
        child: Column(
          children: [
            Lottie.asset(image),
            Text(title, style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.8)),),
            SizedBox(height: Dimensions.paddingSizeDefault,),
            Text(subTitle, style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: index == 0 ?
      FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      kUploadingScreen(
                        index: 1,
                        image: 'assets/uploading.json',
                        title: 'Uploading.....',
                        subTitle: 'Please wait a moment while we upload your files.',
                      )
              )
          );
        },
        child: Icon(Icons.add, color: kBlack,),
        backgroundColor: kMainColor,
      )
            :
      Container(),
    );
  }
}
