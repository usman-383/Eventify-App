import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../services/auth_service.dart';
// import '../widgets/app_avatar.dart';
import '../theme/app_colors.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AuthService(),
      builder: (context, _) {
        final auth = AuthService();
        final user = auth.currentUser;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Space for Header
            const SizedBox(height: 100),

            if (!auth.isLoggedIn || user == null) ...[
              // Logged Out Header Bento Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainer,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.glassStroke),
                  ),
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.surfaceContainerLowest,
                          border: Border.all(color: AppColors.glassStroke),
                        ),
                        child: const Icon(
                          Icons.person_outline,
                          size: 40,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Welcome to Eventify PK',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Sign in to manage your tickets, saved events, and profile.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.onSurfaceVariant,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              AppColors.electricIndigo,
                              AppColors.vibrantPurple,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.vibrantPurple.withOpacity(0.3),
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            context.push('/login');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'Log In / Sign Up',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ] else ...[
              // Profile Header Bento
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainer,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.glassStroke),
                      ),
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.vibrantPurple
                                          .withOpacity(0.3),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                              ),
                              CircleAvatar(
                                radius: 46,
                                backgroundImage: user.avatarUrl != null
                                    ? CachedNetworkImageProvider(
                                        user.avatarUrl!,
                                      )
                                    : null,
                                child: user.avatarUrl == null
                                    ? const Icon(
                                        Icons.person,
                                        size: 46,
                                        color: AppColors.onSurfaceVariant,
                                      )
                                    : null,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            user.name,
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  color: AppColors.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            user.email,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                  fontSize: 14,
                                ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.glassFill,
                              borderRadius: BorderRadius.circular(999),
                              border: Border.all(color: AppColors.glassStroke),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.workspace_premium,
                                  color: AppColors.vibrantPurple,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'VIP Member',
                                  style: Theme.of(context).textTheme.labelLarge
                                      ?.copyWith(
                                        color: AppColors.primary,
                                        fontSize: 12,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Events Attended Bento box
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.electricIndigo,
                            AppColors.vibrantPurple,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.vibrantPurple.withOpacity(0.2),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.confirmation_number,
                            size: 48,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '12',
                            style: Theme.of(context).textTheme.headlineLarge
                                ?.copyWith(color: Colors.white, fontSize: 36),
                          ),
                          Text(
                            'Events Attended',
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 14,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Upcoming Events Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upcoming Events',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(color: AppColors.onSurface),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  children: [
                    _buildTicketCard(
                      context,
                      title: 'Neon Nights Lahore',
                      date: 'Oct 24, 2024 • 9:00 PM',
                      category: 'Music',
                      imageUrl:
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuDy3aWiIZ3010qsmjc_Cn_qUOhaD47q8CtQAikB7x8Y8V6qL0QSCnn_A4PsktiL9_SKbCVUc_Hqf7m0opuboSEWvEXzbGM_zAFh6USq9jFmBhfRvElaL08MSJOTX6U55tnsSEuwOqrOfPo6ziPZeYZ59RwS2sycYNS1LeuaOgP9vfotPECgcZEo7uwLLqilIPYvq_O8cxBiV5cqE-fbFcFw1H_sn45xJaul1RKsS22MJcBSkBdqmmiujLxlaet12IAR0jJbUKtiJJYs',
                      qrUrl:
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuDH6m2rJGauk5Byb3Qwq4UjtOVaUzJjqymi82KIabhhTga1pxU2E75RBAzhJzlfr_9luNAB5WYYEfzbXP5rY4DgA0_jnmIIOZ7xrPCvHoZ0cSD0CRvKkCsnmLl-ECZypT0Hfno-xgEe-fGMtn8XPP6zcWckRMqcPYksoL2KQEhV_QH-VgVq9goPEyFpsTklRISrueRcuzqrtbTjn5iq0Ndh3eETNsO73B9I6mrk469rTdgqYkeAkAEb-PnYnwUqIcc-6dRZX6oc2wLl',
                    ),
                    const SizedBox(width: 16),
                    _buildTicketCard(
                      context,
                      title: "Future Summit '24",
                      date: 'Nov 12, 2024 • 10:00 AM',
                      category: 'Tech',
                      imageUrl:
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuB3jfShoqHfZDxjRNhphMZhlsatFJYXvfT4q_7KrRR6ghK5TZq4Po33kdqMZdtoXdoWQJkmRsBhQf_626U6P5t_hhFjzo2mqXx5Sfo3i7keqoq90y8T2dSOekYn6NtWQksan5nJ87lh1vzDVVgj45s4Rbf1SlahaXHI82c_BKZF5PKlJd9VtnED8syrRyfViQHAhlN5IhvJldMGSTjljY7VBvSxp7pkwvB-mxp-kHWOsoPiGxwU1iCgXSHJZZEWHCdgFwMUZ4BmU7EW',
                      qrUrl:
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuCgXUkKahv2HL2VaYGmSTnI1K4t2cwkvm15Kk06uJSERkhnF20-8lojaheN3guTQNlmjIQN06KLS1aAgzLY1l7SGTSlNYNV26b7VOteMfOc3W9E2c4NRbRaOUl7AkY-7NWttqcMHg8La27cQziityUSVo65ie3Mc56nr_VaFUQskEqTU-y58QWKnShKyi_XY_KuicdlZU2DI3KDMxkiSyTIU4tNC5vXpiRs-Thd6RnDEvM7SaN6j7WJlS9RAgfxhj9C7KslEThPmqtX',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Past Events minimal list
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainer,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.glassStroke),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Past Events',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(color: AppColors.onSurface),
                      ),
                      const SizedBox(height: 16),
                      _buildPastEventItem(
                        title: 'Lahore Comedy Fest',
                        date: 'Sep 15, 2024',
                        icon: Icons.theater_comedy,
                      ),
                      const Divider(color: AppColors.glassStroke, height: 24),
                      _buildPastEventItem(
                        title: 'Food & Jazz Night',
                        date: 'Aug 22, 2024',
                        icon: Icons.restaurant,
                      ),
                    ],
                  ),
                ),
              ),
            ],

            const SizedBox(height: 24),

            // Account Settings Links
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.glassStroke),
                ),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account Settings',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(color: AppColors.onSurface),
                    ),
                    const SizedBox(height: 16),
                    _buildSettingsLink(
                      title: 'Saved Events',
                      icon: Icons.favorite_border,
                    ),
                    const SizedBox(height: 12),
                    _buildSettingsLink(
                      title: 'Payment Methods',
                      icon: Icons.payment,
                    ),
                    const SizedBox(height: 12),
                    _buildSettingsLink(
                      title: 'Help & Support',
                      icon: Icons.help_outline,
                    ),
                    const SizedBox(height: 24),
                    if (auth.isLoggedIn)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                backgroundColor: AppColors.surfaceContainer,
                                title: const Text(
                                  'Log Out',
                                  style: TextStyle(color: Colors.white),
                                ),
                                content: const Text(
                                  'Are you sure you want to log out from Eventify PK?',
                                  style: TextStyle(
                                    color: AppColors.onSurfaceVariant,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(ctx),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: AppColors.onSurfaceVariant,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.errorContainer,
                                      foregroundColor: AppColors.onError,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(ctx);
                                      AuthService().logout();
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Logged out successfully',
                                          ),
                                          backgroundColor:
                                              AppColors.vibrantPurple,
                                        ),
                                      );
                                    },
                                    child: const Text('Log Out'),
                                  ),
                                ],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.errorContainer,
                            foregroundColor: AppColors.onError,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Log Out',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    else
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.push('/login');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryContainer,
                            foregroundColor: AppColors.onPrimary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        );
      },
    );
  }

  Widget _buildTicketCard(
    BuildContext context, {
    required String title,
    required String date,
    required String category,
    required String imageUrl,
    required String qrUrl,
  }) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassStroke),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Event image section
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.glassFill,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: AppColors.glassStroke),
                    ),
                    child: Text(
                      category,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.primary,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Ticket details + QR section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.onSurface,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 14,
                      color: AppColors.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      date,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    // QR Code
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: CachedNetworkImage(
                        imageUrl: qrUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Button
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              AppColors.electricIndigo,
                              AppColors.vibrantPurple,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'View Full Ticket',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
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

  Widget _buildPastEventItem({
    required String title,
    required String date,
    required IconData icon,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppColors.onSurfaceVariant),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  date,
                  style: const TextStyle(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Text(
          'Completed',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsLink({required String title, required IconData icon}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.glassStroke),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 14.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, color: AppColors.onSurfaceVariant, size: 20),
                    const SizedBox(width: 16),
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSurface,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.onSurfaceVariant,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
