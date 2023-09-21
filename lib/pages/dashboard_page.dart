import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroicons/heroicons.dart';
import 'package:instagram/models/content_model.dart';
import 'package:instagram/pages/notification_page.dart';
import 'package:instagram/service/contents_service.dart';
import 'package:instagram/widgets/content.dart';
import 'package:instagram/data_source/dummy.dart';
import 'package:instagram/shared/my_icon_btn.dart';
import 'package:instagram/pages/new_post_page.dart';
import 'package:instagram/pages/profile_page.dart';
import 'package:instagram/pages/reels_page.dart';
import 'package:instagram/pages/search_page.dart';
import 'package:instagram/shared/util.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<ContentModel> contentsData = [];
  
  final storage = FirebaseStorage.instance;
  final db = FirebaseFirestore.instance;

  int indexPage = 0;

  @override
  void initState() {
    onLoad(loadData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      home,
      const SearchPage(),
      const NewPostPage(),
      const ReelsPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      bottomNavigationBar: bottomNavBar,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: pages[indexPage],
      ),
    );
  }

  Widget get topRow {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            myIconStory,
            otherIconStory,
            otherIconStory,
            otherIconStory,
            otherIconStory,
            otherIconStory,
          ],
        ),
      ),
    );
  }

  Widget get myIconStory {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: const Alignment(2, 1.7),
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: Image.network(
                    profileImageUrl,
                    width: 65,
                    height: 65,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  color: Colors.blue,
                  border: Border.all(
                    width: 2.5,
                    color: Colors.white,
                  ),
                ),
                child: const HeroIcon(
                  HeroIcons.plus,
                  color: Colors.white,
                  style: HeroIconStyle.mini,
                  size: 20,
                ),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Your Story",
            style: TextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }

  Widget get otherIconStory {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  gradient: const SweepGradient(
                    // center: Alignment.center,
                    colors: [
                      Colors.pink, // Warna atas (biru)
                      Colors.redAccent, // Warna tepi (merah muda)
                      Colors.yellowAccent, // Warna rna bawah (ungu tua)
                      Colors.orange, // Warna tepi (merah muda)
                      Colors.purpleAccent, // Warna tepi (merah muda)
                      Colors.purpleAccent, // Warna tepi (merah muda)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(99),
                  // border: Border.all(
                  //   color: Colors.grey,
                  // ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(
                    color: Colors.white,
                    width: 5,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: Image.network(
                    profileImageUrl,
                    width: 65,
                    height: 65,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Nama Orang Lain",
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  get bottomNavBar {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyIconBtn(
            onTap: () {
              indexPage = 0;
              setState(() {});
            },
            icon: HeroIcon(
              HeroIcons.home,
              style: indexPage == 0 ? HeroIconStyle.solid : HeroIconStyle.outline,
            ),
          ),
          MyIconBtn(
            onTap: () {
              indexPage = 1;
              setState(() {});
            },
            icon: HeroIcon(
              indexPage == 1 ? HeroIcons.magnifyingGlassCircle : HeroIcons.magnifyingGlass,
              style: indexPage == 1 ? HeroIconStyle.solid : HeroIconStyle.outline,
            ),
          ),
          MyIconBtn(
            onTap: () {
              indexPage = 2;
              setState(() {});
            },
            icon: HeroIcon(
              HeroIcons.plusCircle,
              style: indexPage == 2 ? HeroIconStyle.solid : HeroIconStyle.outline,
            ),
          ),
          MyIconBtn(
            onTap: () {
              indexPage = 3;
              setState(() {});
            },
            icon: HeroIcon(
              HeroIcons.film,
              style: indexPage == 3 ? HeroIconStyle.solid : HeroIconStyle.outline,
            ),
          ),
          MyIconBtn(
            onTap: () {
              indexPage = 4;
              setState(() {});
            },
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                border: Border.all(color: indexPage == 4 ? Colors.black : Colors.grey, width: indexPage == 4 ? 2 : 1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(99),
                child: Image.network(
                  profileImageUrl,
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get home {
    return CustomScrollView(
      slivers: <Widget>[
        appBar,
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => topRow,
            childCount: 1,
          ),
        ),
        contentsWidget,
      ],
    );
  }

  List<Widget> get search {
    return [
      const Center(
        child: Text("data"),
      )
    ];
  }

  Widget get contentsWidget {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Content(contentsData[index]),
        childCount: contentsData.length,
      ),
    );
  }

  get appBarAction {
    return Row(
      children: [
        MyIconBtn(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const NotificationPage(),
              ),
            );
          },
          icon: const HeroIcon(HeroIcons.heart),
        ),
        MyIconBtn(
          onTap: () {},
          icon: const HeroIcon(HeroIcons.chatBubbleOvalLeftEllipsis),
        ),
      ],
    );
  }

  Widget get appBarMenu {
    return FlexibleSpaceBar(
      background: Container(
        decoration: appBarStyle,
        width: width(context),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [logo, appBarAction],
        ),
      ),
    );
  }

  SliverAppBar get appBar {
    return SliverAppBar(
      snap: false,
      expandedHeight: 50,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      floating: true,
      pinned: false,
      flexibleSpace: appBarMenu,
    );
  }

  get logo {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Image.asset(
        "assets/logo.png",
        width: 120,
      ),
    );
  }

  get appBarStyle {
    return const BoxDecoration(
      color: Colors.white,
    );
  }

  void loadData() async {
    final service = ContentsService(storage, db);
    contentsData = await service.fetchContents();
    await service.loadBinary(contentsData);
    setState(() {});
  }
}
