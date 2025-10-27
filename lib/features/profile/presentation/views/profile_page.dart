import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_images.dart';

/// Profile Page - User profile and settings
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(gradient: AppColors.primaryGradient),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.textWhite,
                    child: Image.asset(
                      AppImages.placeholderUser,
                      width: 80,
                      height: 80,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.person,
                          size: 60,
                          color: AppColors.primary,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Guest User',
                    style: AppTextStyles.headlineMedium(
                      color: AppColors.textWhite,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'guest@example.com',
                    style: AppTextStyles.bodyMedium(
                      color: AppColors.textWhite.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement login functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login feature coming soon'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.textWhite,
                      foregroundColor: AppColors.primary,
                    ),
                    child: const Text('Login / Sign Up'),
                  ),
                ],
              ),
            ),
            // Menu Items
            _buildMenuSection(context, 'Account', [
              _MenuItem(
                icon: Icons.person_outline,
                title: 'Personal Information',
                onTap: () => _showComingSoon(context),
              ),
              _MenuItem(
                icon: Icons.location_on_outlined,
                title: 'Addresses',
                onTap: () => _showComingSoon(context),
              ),
              _MenuItem(
                icon: Icons.payment_outlined,
                title: 'Payment Methods',
                onTap: () => _showComingSoon(context),
              ),
              _MenuItem(
                icon: Icons.receipt_long_outlined,
                title: 'My Orders',
                onTap: () => _showComingSoon(context),
              ),
            ]),
            _buildMenuSection(context, 'Preferences', [
              _MenuItem(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                onTap: () => _showComingSoon(context),
              ),
              _MenuItem(
                icon: Icons.language_outlined,
                title: 'Language',
                onTap: () => _showComingSoon(context),
              ),
              _MenuItem(
                icon: Icons.dark_mode_outlined,
                title: 'Theme',
                onTap: () => _showComingSoon(context),
              ),
            ]),
            _buildMenuSection(context, 'Support', [
              _MenuItem(
                icon: Icons.help_outline,
                title: 'Help Center',
                onTap: () => _showComingSoon(context),
              ),
              _MenuItem(
                icon: Icons.headset_mic_outlined,
                title: 'Contact Us',
                onTap: () => _showComingSoon(context),
              ),
              _MenuItem(
                icon: Icons.info_outline,
                title: 'About',
                onTap: () => _showAboutDialog(context),
              ),
            ]),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection(
    BuildContext context,
    String title,
    List<_MenuItem> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            title,
            style: AppTextStyles.titleSmall(color: AppColors.textSecondary),
          ),
        ),
        ...items.map((item) => _buildMenuItem(context, item)),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, _MenuItem item) {
    return ListTile(
      leading: Icon(item.icon, color: AppColors.primary),
      title: Text(item.title, style: AppTextStyles.bodyLarge()),
      trailing: const Icon(Icons.chevron_right, color: AppColors.textSecondary),
      onTap: item.onTap,
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Feature coming soon'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About Lenskart Clone'),
        content: const Text(
          'Lenskart Clone App\nVersion 1.0.0\n\nA Flutter-based e-commerce application for eyewear shopping.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  _MenuItem({required this.icon, required this.title, required this.onTap});
}
