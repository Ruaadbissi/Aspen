
import 'package:aspen/details/detailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';



class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final List <tabs> _tab = [];
  List <Popular> _popular = [];
  List <Recommended> _recommended = [];
  List <Popular> _popularData = [];
  List <Recommended> _recommendedData = [];
  final List _result = ["r"];

  @override
  void initState() {
    super.initState();
    _fillPopularLocation();
    _fillRecommendedLocation();
    _fillTab();
    _popularData = List.of(_popular);
    _recommendedData = List.of(_recommended);
  }

  int cur = 0;
  PageController pageController = PageController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocuse = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      child: Scaffold(
        body:  Column(
              children: [
                SizedBox(width: 100.w, height: 5.h,
                  child: TextFormField(
                    controller: _searchController,
                    focusNode: _searchFocuse,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    onEditingComplete: () {
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                onChanged: (v) {
                _result.add("r");
                _recommended = List.of(_recommendedData);
                _popular = List.of(_popularData);
                if (v.isNotEmpty) {
                  _result.clear();
                  _result.addAll(_popular = _popular
                      .where((element) =>
                      element.name.toLowerCase().contains(v.toLowerCase()))
                      .toList());
                  _result.addAll(_recommended = _recommended
                      .where((element) =>
                      element.name.toLowerCase().contains(v.toLowerCase()))
                      .toList());

                }
                 _tab.clear();
                _fillTab();
                setState(() {});
              },
              decoration: InputDecoration(
               filled: true,
                fillColor:const Color(0xfff3f8fe),
                   prefixIcon:const Icon(Icons.search, color:Colors.grey,size:25),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
                hintText: "Find things to do",
                hintStyle: const TextStyle(color: Colors.grey,fontSize: 15),
    ),
            ),
          ),
          Container(
            width: 100.w,
            height: 80,
            margin:const EdgeInsets.only(left: 15),
            padding:const EdgeInsets.only(top: 10),
            child: ListView.builder(
               physics:const BouncingScrollPhysics(),
              itemCount: _tab.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_,index){
                 return GestureDetector(
                   onTap: (){
                     _changeTab(index);
                   },
                   child: _tab[index].isSelected ? Container(
                     width:90 ,
                     height: 40,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(30)),
                     child: Center(
                       child: Text(
                         _tab[index].name,
                         style:const TextStyle(
                           fontWeight: FontWeight.w500,
                           color: Colors.blue,),
                       ),
                     ),
                   )
                       :Container(
                     width: 90,
                     height: 40,
                        decoration:const BoxDecoration(
                         color: null,
                        borderRadius: null),
                           child: Center(
                            child: Text(
                            _tab[index].name,
                            style:const TextStyle(
                              fontWeight: FontWeight.w500,
                             color: Colors.grey,),)
                )
                   )
                 );
              },
            ),
          ),
          const SizedBox(height: 8,),
          Expanded(
              child: _result.isNotEmpty
            ? _tab.firstWhere((element) => element.isSelected).view
                  : const Align(
                alignment: Alignment.topCenter,
                   child:Column(
                   children: [
                     SizedBox(height: 60,),
                     Text("No matching results",
                       style: TextStyle(
                         fontSize: 30,
                         color: Colors.grey,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ],
                ) ,
              ),
          ),
        ],
      ),

    ),
    );
  }


  void _fillPopularLocation() {
    _popular.addAll(
      [
        Popular(
          image:"assets/alley.png",
          name:"Allay Palace",
          rate: "4.1",
          description: 'Aspen is as close as one can get to'
            'a storybook alpine town in america, The '
            'choose your own adventure possibilities-skiing, hiking, dining shoppping and ....',
          id:'Alley_Palace',
        ),
        Popular(
          image:"assets/coeurdes.png",
          name:"Coeurdes Alpes",
          rate: "4.5",
          description: 'Coeurdes Alpes is as close as one '
              'can get to a storybook alpine town in america, The choose your own adventure '
              ' possibilities-skiing, hiking, dining shoppping.',
          id:'Ceourdes_Alpes',
        ),
      ],
    );
  }

  void _fillRecommendedLocation(){
    _recommended.addAll(
      [
        Recommended(
          image: "assets/4n.png",
          name:"Alley Palace",
          rate:"4N/50",
        ),
        Recommended(
          image:"assets/2n.png" ,
          name:"Coeurdes Alpes",
          rate:"2N/30",
        ),
      ],
    );
  }

  void _fillTab(){
    _tab.addAll([
      tabs(
        name: 'Location',
        isSelected: true,
        view: _getView(),
      )  ,
          tabs(
              name: 'Hotels',
              isSelected: false,
              view:const Center(
                child: Icon(Icons.hotel),
    ),),
         tabs(
             name: 'Food',
             isSelected: false,
             view:const Center(
               child: Icon(Icons.apple),
    ),),
             tabs(
              name: 'Adventure',
               isSelected: false,
               view:const Center(
                child: Icon(Icons.skateboarding),
    ),),
              tabs(
                name: 'Activity',
                isSelected: false,
                view:const Center(
                   child: Icon(Icons.local_activity),
    ),),
  ]  );
  }

  Column _getView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding:  EdgeInsets.only(left: 20, bottom: 10),
          child: Row(
            children: [
              Text(
                "Popular",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFF232323),
                ),
              ),
              Spacer(),
              Text(
                "see all",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25.h,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: _popular.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final popular = _popular[index];
              return InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: PlaceDetails(
                      image: popular.image,
                      description: popular.description,
                      rate: popular.rate,
                      id: popular.id,
                      name: popular.name,
                    ),
                    withNavBar: false,
                  );
                },
                child: Container(
                  width: 200,
                  height: 120,
                  margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(popular.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 40,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          height: 23,
                          decoration: const BoxDecoration(
                            color: Color(0xff4d5652),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: Text(
                            popular.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 12,
                        child: Container(
                          width: 52,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Color(0xff4d5652),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 16,
                              ),
                              Text(
                                popular.rate,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 12,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: 0,
                                blurRadius: 19,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.favorite,
                            size: 15,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
       const Padding(
          padding:  EdgeInsets.only(left: 20, bottom: 8),
          child: Text(
            "Recommended",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff232323),
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: _recommended.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final recommend = _recommended[index];
              return Container(
                height: 95,
                width: 180,
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 5,
                  top: 5,
                ),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xff97a0b2),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xfff4f4f4),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(recommend.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left:1,
                      child: Center(
                        child: Text(
                          recommend.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff232323),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 100,
                      child: Container(
                        width: 45,
                        height: 20,
                        decoration: BoxDecoration(
                          color: const Color(0xff4d5652),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            recommend.rate,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }


  void _changeTab(int index) {
    for (var element in _tab) {
      element.isSelected = false;
    }
    _tab[index].isSelected = true;
    setState(() {});
  }
}
class tabs{
  String name;
  bool isSelected;
  Widget view;

  tabs({required this.name, required this.isSelected, required this.view});
}
class Popular {
  final String image;
  final String name;
  final String rate;
  final String description;
  final String id;

  Popular({required this.image, required this.name,
    required this.rate, required this.description, required this.id,});
}

class Recommended {
  final String image;
  final String name;
  final String rate;

  Recommended({required this.image, required this.name,
    required this.rate,});
}

