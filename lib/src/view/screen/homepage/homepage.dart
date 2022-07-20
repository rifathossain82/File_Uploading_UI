import 'package:file_uploading_ui/src/util/color.dart';
import 'package:file_uploading_ui/src/util/dimensions.dart';
import 'package:file_uploading_ui/src/util/exports.dart';
import 'package:file_uploading_ui/src/view/base/kSearchBar.dart';
import 'package:file_uploading_ui/src/view/base/kUploadingScreen.dart';
import 'package:file_uploading_ui/src/view/screen/homepage/tabbarPage/audioScreen.dart';
import 'package:file_uploading_ui/src/view/screen/homepage/tabbarPage/documentScreen.dart';
import 'package:file_uploading_ui/src/view/screen/homepage/tabbarPage/phoneScreen.dart';
import 'package:file_uploading_ui/src/view/screen/homepage/tabbarPage/videoScreen.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin{

  TextEditingController searchController = TextEditingController();
  late TabController tabController ;

  @override
  void initState() {
    tabController = TabController(
        length: 4,
        initialIndex: 2,
        vsync: this,
        animationDuration: const Duration(seconds: 1)
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    kUploadingScreen(
                      index: 0,
                      image: 'assets/upload_file.json',
                      title: 'Upload File',
                      subTitle: 'Browse and choose the files you want to upload',
                    )
              )
          );
        },
        backgroundColor: kMainColor,
        child: Icon(Icons.arrow_forward_rounded, color: kBlack,),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: Dimensions.paddingSizeDefault,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
              child: Row(
                children: [
                  IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.arrow_back_ios, color: kWhite,),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.filter_list, color: kWhite.withOpacity(0.7),),
                  ),
                  SizedBox(width: Dimensions.paddingSizeLarge,),
                  IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.menu, color: kWhite.withOpacity(0.7),),
                  )
                ],
              ),
            ),
            SizedBox(height: Dimensions.paddingSizeExtraLarge,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
              child: kSearchBar(
                controller: searchController,
                hintText: 'Search the file name by name or type',
                searchMethod: (){
                  print('HI');
                },
              ),
            ),
            SizedBox(height: Dimensions.paddingSizeExtraLarge,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )
                ),
                child: DefaultTabController(
                  length: 4,
                  initialIndex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: Dimensions.paddingSizeDefault, top: Dimensions.paddingSizeDefault, right: Dimensions.paddingSizeDefault),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 35,
                          child: TabBar(
                            controller: tabController,
                            labelColor: kBlack,
                            indicatorColor: kMainColor,
                            indicatorWeight: 2,
                            indicator: BoxDecoration(
                                color: kMainColor,
                                borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge)
                            ),
                            isScrollable: true,
                            tabs: [
                              Tab(
                                text: 'Phone',
                              ),
                              Tab(
                                text: 'Video',
                              ),
                              Tab(
                                text: 'Audio',
                              ),
                              Tab(
                                text: 'Document',
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: Dimensions.paddingSizeDefault),
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                PhoneScreen(),
                                VideoScreen(),
                                AudioScreen(),
                                DocumentScreen(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
