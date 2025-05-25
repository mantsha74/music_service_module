import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../navigation/bottom_nav.dart';
import '../../widgets/service_card.dart';
import '../service_detail/service_detail_screen.dart';
import 'home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: const BottomNavBar(),
      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            const _TopRedHeader(),
            const SizedBox(height: 24),
            const _ServicesHeader(),
            const SizedBox(height: 16),
            _ServiceList(),
          ],
        ),
      ),
    );
  }
}


class _TopRedHeader extends StatelessWidget {
  const _TopRedHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        // 🔴 Background Container
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 24),
          decoration: const BoxDecoration(
            color: Color(0xFFB3134A),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// 🔍 Search Row
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search "Punjabi Lyrics"',
                        hintStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(Icons.search, color: Colors.white),
                        filled: true,
                        fillColor: const Color(0xFF2F2F39),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 1,
                              height: 24,
                              color: Colors.white24,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                            ),
                            const Icon(Icons.mic, color: Colors.white),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Color(0xFFB3134A)),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              /// 🔤 Title Section
              Text(
                "Claim your",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Free Demo",
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 45,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "for custom Music Production",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              /// 📅 Book Now Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFFB3134A),
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                child: Text(
                  "Book Now",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),

        // 🔴 Circular Disc (bottom-left, off-screen)
        Positioned(
          bottom: 10,
          left: -30,
          child: SvgPicture.asset(
            'assets/images/circular_disc.svg',
            width: 100,
            height: 100,
          ),
        ),

        // 🎹 Piano (bottom-right, rotated, off-screen)
        Positioned(
          bottom: 10,
          right: -30,
          child: Transform.rotate(
            angle: -0.1, // ~-11.5 degrees
            child: SvgPicture.asset(
              'assets/images/piano.svg',
              width: 120,
              height: 120,
            ),
          ),
        ),
      ],
    );
  }
}


class _ServicesHeader extends StatelessWidget {
  const _ServicesHeader();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "Hire hand-picked Pros for popular music services",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

class _ServiceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Column(
      children: vm.services
          .map(
            (s) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ServiceCard(
            service: s,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ServiceDetailScreen(title: s.title),
              ),
            ),
          ),
        ),
      )
          .toList(),
    );
  }
}
