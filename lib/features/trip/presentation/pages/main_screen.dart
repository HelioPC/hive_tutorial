import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/trip/presentation/pages/add_trip_screen.dart';
import 'package:travel_app/features/trip/presentation/pages/trip_list_screen.dart';
import 'package:travel_app/features/trip/presentation/providers/trip_provider.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({super.key});

  final PageController _pageController = PageController(initialPage: 0);
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(tripListNotifierProvider.notifier).loadTrips();

    _pageController.addListener(() {
      _currentPage.value = _pageController.page?.round() ?? 0;
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: const Text('Travel app'),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          const TripListScreen(),
          AddTripScreen(),
          const Text('3'),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _currentPage,
        builder: (context, index, child) {
          return BottomNavigationBar(
            onTap: (index) {
              _pageController.jumpToPage(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'My trips',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'New trip',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Maps',
              ),
            ],
          );
        },
      ),
    );
  }
}
