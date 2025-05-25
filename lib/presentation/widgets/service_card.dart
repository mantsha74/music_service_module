import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/service_model.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;
  final VoidCallback onTap;

  const ServiceCard({required this.service, required this.onTap, super.key});

  Future<bool> _assetExists(String path) async {
    try {
      await rootBundle.load(path);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconPath = 'assets/icons/${service.icon}';

    return FutureBuilder<bool>(
      future: _assetExists(iconPath),
      builder: (context, snapshot) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.grey[900],
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8),
              child:
                  (snapshot.connectionState == ConnectionState.done &&
                          snapshot.data == true)
                      ? SvgPicture.asset(iconPath)
                      : const Icon(Icons.music_note, color: Colors.white),
            ),
            title: Text(
              service.title.trim(),
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              service.description.trim(),
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.white70),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            onTap: onTap,
          ),
        );
      },
    );
  }
}
