import 'package:facebook_ui/Screens/home_screen.dart';
import 'package:facebook_ui/models/models_export.dart';
import 'package:facebook_ui/widgets/custom_app_bar.dart';
import 'package:facebook_ui/widgets/custom_tab_bar.dart';
import 'package:facebook_ui/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {

  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icons.length,
        child: Scaffold(
          appBar: Responsive.isDesktop(context) ? PreferredSize(preferredSize: Size(screenSize.width, 100.0),
            child: CustomAppBar(
              currentUser : currentUser,
              icons: _icons,
              selectedIndex: _selectedIndex,
              onTap: (index) {
                setState(() => _selectedIndex = index);
              }
            ),

          )


              : null,

          body: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: !Responsive.isDesktop(context) ? CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index){
               setState(()=> _selectedIndex = index);

            }
          ) : const SizedBox.shrink(),
        )
    );
  }  
}
