
import 'package:crypto_app/pages/home_page.dart';
import 'package:crypto_app/theme/colors.dart';
import 'package:crypto_app/widgets/bottombar_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), 
          topRight: Radius.circular(40)
        ), 
          gradient: LinearGradient(
            colors: [
              appBgColorPrimary,
              appBgColorSecondary
            ],
          ),
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: getBottomBar(),
        floatingActionButton: getHomeButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        body: getBarPage()
      ),
    );
  }

  Widget getHomeButton(){
    return Container(
      margin: EdgeInsets.only(top: 35),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: bottomBarBgColor.withOpacity(.5),
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            activeTab= 2;
          });
        },
        child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primary, 
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add, color: Colors.white, size: 28,)
          ),
      ),
    );
  }

  Widget getBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), 
          topRight: Radius.circular(25)
        ), 
        color: bottomBarColor.withOpacity(0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = 0;
                  });
                },
                child: BottomBarItem(Icons.home, "", isActive: activeTab == 0, activeColor: primary),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = 1;
                  });
                },
                child: BottomBarItem(Icons.insert_chart, "", isActive: activeTab == 1, activeColor: primary),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = 2;
                  });
                },
                child: BottomBarItem(Icons.brightness_1, "", isActive: activeTab == 2, activeColor: primary),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = 3;
                  });
                },
                child: BottomBarItem(Icons.account_balance_wallet, "", isActive: activeTab == 3, activeColor: primary),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = 4;
                  });
                },
                child: BottomBarItem(Icons.settings, "", isActive: activeTab == 4, activeColor: primary),
              ),
              ]
            )
        ),
    );
  }

  Widget getBarPage(){
    return 
      IndexedStack(
        index: activeTab,
        children: <Widget>[
          HomePage(),
          Center(
            child: Text("Analysis",style: TextStyle(
              fontSize: 35
            ),),
          ),
          Center(
            child: Text("New",style: TextStyle(
              fontSize: 35
            ),),
          ),
          Center(
            child: Text("Balance",style: TextStyle(
              fontSize: 35
            ),),
          ),
           Center(
            child: Text("Setting",style: TextStyle(
              fontSize: 35
            ),),
          )
        ],
      );
  }
}
