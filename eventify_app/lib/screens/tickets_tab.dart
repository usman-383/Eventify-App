import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/app_colors.dart';

class TicketsTab extends StatefulWidget {
  const TicketsTab({super.key});

  @override
  State<TicketsTab> createState() => _TicketsTabState();
}

class _TicketsTabState extends State<TicketsTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 100),

        // Header Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'My Tickets',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppColors.onSurface,
                  fontSize: 28,
                ),
          ),
        ),
        const SizedBox(height: 16),

        // Tab Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surfaceContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.glassStroke),
            ),
            padding: const EdgeInsets.all(4),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.electricIndigo, AppColors.vibrantPurple],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: AppColors.onSurfaceVariant,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              tabs: const [
                Tab(text: 'Upcoming (2)'),
                Tab(text: 'Past Events (2)'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Tab View Content
        SizedBox(
          height: 520,
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildUpcomingTicketsList(context),
              _buildPastTicketsList(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUpcomingTicketsList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      children: [
        _buildFullTicketItem(
          context,
          eventId: 'strings-farewell',
          title: 'Neon Nights Lahore',
          date: 'Oct 24, 2024 • 9:00 PM',
          location: 'Lahore Expo Center',
          seatType: 'VIP Pass (x2)',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDy3aWiIZ3010qsmjc_Cn_qUOhaD47q8CtQAikB7x8Y8V6qL0QSCnn_A4PsktiL9_SKbCVUc_Hqf7m0opuboSEWvEXzbGM_zAFh6USq9jFmBhfRvElaL08MSJOTX6U55tnsSEuwOqrOfPo6ziPZeYZ59RwS2sycYNS1LeuaOgP9vfotPECgcZEo7uwLLqilIPYvq_O8cxBiV5cqE-fbFcFw1H_sn45xJaul1RKsS22MJcBSkBdqmmiujLxlaet12IAR0jJbUKtiJJYs',
          qrUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDH6m2rJGauk5Byb3Qwq4UjtOVaUzJjqymi82KIabhhTga1pxU2E75RBAzhJzlfr_9luNAB5WYYEfzbXP5rY4DgA0_jnmIIOZ7xrPCvHoZ0cSD0CRvKkCsnmLl-ECZypT0Hfno-xgEe-fGMtn8XPP6zcWckRMqcPYksoL2KQEhV_QH-VgVq9goPEyFpsTklRISrueRcuzqrtbTjn5iq0Ndh3eETNsO73B9I6mrk469rTdgqYkeAkAEb-PnYnwUqIcc-6dRZX6oc2wLl',
        ),
        const SizedBox(height: 16),
        _buildFullTicketItem(
          context,
          eventId: 'pakathon-pitch',
          title: "Future Summit '24",
          date: 'Nov 12, 2024 • 10:00 AM',
          location: 'NIC Lahore',
          seatType: 'General Access Pass',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB3jfShoqHfZDxjRNhphMZhlsatFJYXvfT4q_7KrRR6ghK5TZq4Po33kdqMZdtoXdoWQJkmRsBhQf_626U6P5t_hhFjzo2mqXx5Sfo3i7keqoq90y8T2dSOekYn6NtWQksan5nJ87lh1vzDVVgj45s4Rbf1SlahaXHI82c_BKZF5PKlJd9VtnED8syrRyfViQHAhlN5IhvJldMGSTjljY7VBvSxp7pkwvB-mxp-kHWOsoPiGxwU1iCgXSHJZZEWHCdgFwMUZ4BmU7EW',
          qrUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCgXUkKahv2HL2VaYGmSTnI1K4t2cwkvm15Kk06uJSERkhnF20-8lojaheN3guTQNlmjIQN06KLS1aAgzLY1l7SGTSlNYNV26b7VOteMfOc3W9E2c4NRbRaOUl7AkY-7NWttqcMHg8La27cQziityUSVo65ie3Mc56nr_VaFUQskEqTU-y58QWKnShKyi_XY_KuicdlZU2DI3KDMxkiSyTIU4tNC5vXpiRs-Thd6RnDEvM7SaN6j7WJlS9RAgfxhj9C7KslEThPmqtX',
        ),
      ],
    );
  }

  Widget _buildPastTicketsList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.glassStroke),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.theater_comedy, color: AppColors.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lahore Comedy Fest',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Sep 15, 2024 • The Colony',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSurfaceVariant,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Completed',
                  style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.glassStroke),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.restaurant, color: AppColors.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Food & Jazz Night',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Aug 22, 2024 • Gulberg, Lahore',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSurfaceVariant,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Completed',
                  style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFullTicketItem(
    BuildContext context, {
    required String eventId,
    required String title,
    required String date,
    required String location,
    required String seatType,
    required String imageUrl,
    required String qrUrl,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.glassStroke),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Image
          SizedBox(
            height: 120,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.4),
                  colorBlendMode: BlendMode.darken,
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.glassFill,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.glassStroke),
                    ),
                    child: Text(
                      seatType,
                      style: const TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppColors.onSurface,
                        fontSize: 20,
                      ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 14, color: AppColors.onSurfaceVariant),
                    const SizedBox(width: 6),
                    Text(
                      date,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSurfaceVariant,
                            fontSize: 13,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: AppColors.onSurfaceVariant),
                    const SizedBox(width: 6),
                    Text(
                      location,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSurfaceVariant,
                            fontSize: 13,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(height: 1, color: AppColors.glassStroke),
                const SizedBox(height: 16),
                Row(
                  children: [
                    // QR Code
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: CachedNetworkImage(
                        imageUrl: qrUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.electricIndigo, AppColors.vibrantPurple],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            _showTicketQRModal(context, title, seatType, qrUrl);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Show Ticket QR',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showTicketQRModal(BuildContext context, String title, String seatType, String qrUrl) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surfaceContainerHigh,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.onSurface,
                      fontSize: 20,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                seatType,
                style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.vibrantPurple.withOpacity(0.3),
                      blurRadius: 20,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: CachedNetworkImage(
                  imageUrl: qrUrl,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Scan this QR code at the venue gate for instant entry.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 13),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.glassFill,
                    foregroundColor: AppColors.onSurface,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: AppColors.glassStroke),
                    ),
                  ),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
