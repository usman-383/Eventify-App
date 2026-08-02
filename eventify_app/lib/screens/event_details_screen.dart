import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../models/event.dart';
import '../theme/app_colors.dart';

class EventDetailsScreen extends StatelessWidget {
  final String eventId;

  const EventDetailsScreen({
    super.key,
    required this.eventId,
  });

  @override
  Widget build(BuildContext context) {
    // Find the event
    final event = mockEvents.firstWhere(
      (e) => e.id == eventId,
      orElse: () => mockEvents.firstWhere((e) => e.id == 'strings-farewell'),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Main content
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cinematic Hero Image
                  Stack(
                    children: [
                      SizedBox(
                        height: 500,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: event.imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(color: AppColors.surfaceContainer),
                          errorWidget: (context, url, error) => Container(color: AppColors.surfaceContainer),
                        ),
                      ),
                      // Bottom gradient overlay
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: 250,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.background,
                                AppColors.background.withOpacity(0.8),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Content Container
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tags
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: event.tags.map((tag) => _buildTag(context, tag)).toList(),
                        ),
                        const SizedBox(height: 16),
                        // Title
                        Text(
                          event.title,
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: Colors.white,
                                fontSize: 32,
                                height: 1.2,
                              ),
                        ),
                        const SizedBox(height: 12),
                        // Short description
                        Text(
                          event.description.split('\n').first,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: AppColors.onSurfaceVariant,
                                fontSize: 16,
                              ),
                        ),
                        const SizedBox(height: 24),
                        // Key Details Grid (Date & Time + Location)
                        _buildDetailsGrid(context, event),
                        const SizedBox(height: 32),
                        // About Section
                        Text(
                          'About the Event',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: AppColors.onSurface,
                              ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          event.description,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.onSurfaceVariant.withOpacity(0.8),
                                height: 1.6,
                                fontSize: 15,
                              ),
                        ),
                        const SizedBox(height: 32),
                        // Lineup Section
                        Text(
                          'Lineup',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: AppColors.onSurface,
                              ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 24,
                          runSpacing: 16,
                          children: event.lineup.map((performer) => _buildPerformerItem(context, performer)).toList(),
                        ),
                        const SizedBox(height: 120), // Bottom padding for sticky bar
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Translucent top navigation overlay
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCircularButton(
                  context,
                  icon: Icons.arrow_back,
                  onPressed: () => context.pop(),
                ),
                _buildCircularButton(
                  context,
                  icon: Icons.share,
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Sticky CTA Bottom Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildStickyBar(context, event),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(BuildContext context, String text) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primaryContainer.withOpacity(0.1),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.primary.withOpacity(0.2)),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.primary,
                  fontSize: 12,
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsGrid(BuildContext context, Event event) {
    return Column(
      children: [
        // Date & Time Box
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHigh.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.glassStroke),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.calendar_month, color: AppColors.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date & Time',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.onSurface,
                            fontSize: 14,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      event.date,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                    ),
                    Text(
                      event.time,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Location Box
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHigh.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.glassStroke),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.location_on, color: AppColors.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.onSurface,
                            fontSize: 14,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      event.locationDetail,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 12),
                    // Map Preview Placeholder
                    Container(
                      height: 96,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.glassStroke),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuACqRrGZ97hpxIwbZl3Q0CFmdITjKuwZ0IUrPgTiNfE5ouMLiTQnP83pg_QkfotSeR2XIYDcxulI01EKeMJfYeidpiNdKQ6nJuMiCUP4m5-wuV9NjxNt47EB8M9yxf2-ebEWjTSOhM7yYj-cTg0qquAfJoIhng9zC1Ohc28ZTpa-8Fay6CAhEYlhPpXKytt9C_tXMADdNILvmq7S6D7DZ-JN48mVIRiY87u1SJfzj7QHCCydeTCbSKO6we9O2-IdFRkiU0DUKvqiaz0',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Container(
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPerformerItem(BuildContext context, Performer performer) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.surfaceVariant, width: 2),
          ),
          padding: const EdgeInsets.all(4),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(performer.imageUrl),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          performer.name,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.onSurface,
                fontSize: 13,
              ),
        ),
      ],
    );
  }

  Widget _buildCircularButton(BuildContext context, {required IconData icon, required VoidCallback onPressed}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.glassFill,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.glassStroke),
          ),
          child: IconButton(
            icon: Icon(icon, color: AppColors.onSurface, size: 20),
            onPressed: onPressed,
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }

  Widget _buildStickyBar(BuildContext context, Event event) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.glassStroke),
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            color: AppColors.glassFill,
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      event.isFree ? 'Ticket Type' : 'Starting from',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSurfaceVariant,
                            fontSize: 14,
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      event.isFree ? 'Free RSVP' : event.priceString,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.electricIndigo, AppColors.vibrantPurple],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.vibrantPurple.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () => context.push('/checkout/${event.id}'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      event.isFree ? 'RSVP Now' : 'Select Tickets',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
