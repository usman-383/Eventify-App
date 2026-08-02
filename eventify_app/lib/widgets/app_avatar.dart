import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../services/auth_service.dart';
import '../theme/app_colors.dart';

class AppAvatar extends StatelessWidget {
  final double radius;
  final bool showEditButton;
  final VoidCallback? onAvatarUpdated;

  const AppAvatar({
    super.key,
    this.radius = 46,
    this.showEditButton = false,
    this.onAvatarUpdated,
  });

  Future<void> _pickImage(BuildContext context) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        final Uint8List bytes = await pickedFile.readAsBytes();
        AuthService().updateAvatarBytes(bytes);
        if (onAvatarUpdated != null) {
          onAvatarUpdated!();
        }
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile photo updated successfully!'),
              backgroundColor: AppColors.vibrantPurple,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not load image: ${e.toString()}'),
            backgroundColor: AppColors.errorContainer,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = AuthService().currentUser;

    ImageProvider? imageProvider;

    if (user != null) {
      if (user.avatarBytes != null) {
        imageProvider = MemoryImage(user.avatarBytes!);
      } else if (user.avatarPath != null && !kIsWeb) {
        imageProvider = FileImage(File(user.avatarPath!));
      } else if (user.avatarUrl != null && user.avatarUrl!.isNotEmpty) {
        if (kIsWeb) {
          imageProvider = NetworkImage(user.avatarUrl!);
        } else {
          imageProvider = CachedNetworkImageProvider(user.avatarUrl!);
        }
      }
    }

    Widget avatarChild = CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.surfaceContainerLowest,
      backgroundImage: imageProvider,
      child: imageProvider == null
          ? Icon(
              Icons.person,
              size: radius * 1.1,
              color: AppColors.onSurfaceVariant,
            )
          : null,
    );

    if (!showEditButton) {
      return avatarChild;
    }

    return Stack(
      children: [
        avatarChild,
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => _pickImage(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.vibrantPurple,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.camera_alt,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
