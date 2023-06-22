import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_hub/user/controllers/bookmark_provider.dart';
import 'package:jobs_hub/user/models/response/bookmarks/all_bookmarks.dart';
import 'package:jobs_hub/user/models/response/bookmarks/internship_bookmarks.dart';
import 'package:jobs_hub/user/views/common/app_bar.dart';
import 'package:jobs_hub/user/views/common/drawer/drawer_widget.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/ui/bookmarks/widgets/bookmark_internship_widget.dart';
import 'package:jobs_hub/user/views/ui/bookmarks/widgets/bookmark_widget.dart';
import 'package:jobs_hub/user/views/ui/homepage.dart';
import 'package:provider/provider.dart';

class BookMarkPageNew extends StatefulWidget {
  const BookMarkPageNew({super.key});

  @override
  State<BookMarkPageNew> createState() => _BookMarkPageNewState();
}

class _BookMarkPageNewState extends State<BookMarkPageNew> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: "BookMarks",
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: const DrawerWidget(),
          ),
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[JobsBookmarks(), InternshipsBookmarks()],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: BottomNavyBar(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          selectedIndex: _currentIndex,
          animationDuration: const Duration(milliseconds: 220),
          backgroundColor: Colors.white,
          containerHeight: 65,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          curve: Curves.easeIn,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title:
                    Text('Jobs', style: TextStyle(color: Color(kOrange.value))),
                icon: Icon(Icons.work_outline_outlined,
                    color: Color(kOrange.value))),
            BottomNavyBarItem(
                title: Text('Internships',
                    style: TextStyle(color: Color(kOrange.value))),
                icon: Icon(Icons.rocket_launch_outlined,
                    color: Color(kOrange.value))),
          ],
        ),
      ),
    );
  }
}

class InternshipsBookmarks extends StatelessWidget {
  const InternshipsBookmarks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BookMarkNotifier>(
      builder: (context, bookmarkNotifier, child) {
        bookmarkNotifier.getInternshipBookmarks();
        return FutureBuilder<List<AllInternshipBookmarks>>(
            future: bookmarkNotifier.internshipBookmarks,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error ${snapshot.error}'),
                );
              }
              final bookmarks = snapshot.data;
              final internshipsBMS = [];
              for (int i = 0; i < bookmarks!.length; i++) {
                if (bookmarks[i].internship != null) {
                  internshipsBMS.add(bookmarks[i]);
                }
              }
              if (internshipsBMS.isEmpty) {
                return const Center(
                  child: Text('No Bookmarks'),
                );
              }
              return ListView.builder(
                itemCount: internshipsBMS.length,
                itemBuilder: (context, index) {
                  final bookmark = internshipsBMS[index];
                  return bookmark.internship != null
                      ? BookmarkTile2Widget(
                          bookmark: bookmark,
                        )
                      : const SizedBox.shrink();
                },
              );
            });
      },
    );
  }
}

class JobsBookmarks extends StatelessWidget {
  const JobsBookmarks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BookMarkNotifier>(
      builder: (context, bookmarkNotifier, child) {
        bookmarkNotifier.getBookmarks();
        return FutureBuilder<List<AllBookmarks>>(
            future: bookmarkNotifier.bookmarks,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error ${snapshot.error}'),
                );
              }
              final bookmarks = snapshot.data;
              final jobsBMS = [];
              for (int i = 0; i < bookmarks!.length; i++) {
                if (bookmarks[i].job != null) {
                  jobsBMS.add(bookmarks[i]);
                }
              }
              if (jobsBMS.isEmpty) {
                return const Center(
                  child: Text('No Bookmarks'),
                );
              }
              return ListView.builder(
                itemCount: jobsBMS.length,
                itemBuilder: (context, index) {
                  final bookmark = jobsBMS[index];
                  return BookmarkTileWidget(
                    bookmark: bookmark,
                  );
                },
              );
            });
      },
    );
  }
}
