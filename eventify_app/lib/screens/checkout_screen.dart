import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../models/event.dart';
import '../theme/app_colors.dart';

class CheckoutScreen extends StatefulWidget {
  final String eventId;

  const CheckoutScreen({
    super.key,
    required this.eventId,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedPaymentMethod = 'card'; // 'card', 'jazzcash', 'easypaisa'
  final TextEditingController _promoController = TextEditingController();
  bool _isBooked = false;

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Find the event
    final event = mockEvents.firstWhere(
      (e) => e.id == widget.eventId,
      orElse: () => mockEvents.firstWhere((e) => e.id == 'strings-farewell'),
    );

    final double ticketBasePrice = event.price;
    final int quantity = 2;
    final double subtotal = ticketBasePrice * quantity;
    final double serviceFee = event.isFree ? 0.0 : 500.0;
    final double tax = event.isFree ? 0.0 : 1500.0;
    final double total = subtotal + serviceFee + tax;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: AppBar(
              backgroundColor: AppColors.glassFill,
              elevation: 0,
              scrolledUnderElevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.onSurfaceVariant),
                onPressed: () => context.pop(),
              ),
              title: Text(
                'Complete Your Booking',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(color: AppColors.glassStroke, height: 1),
              ),
            ),
          ),
        ),
      ),
      body: _isBooked
          ? _buildSuccessView(context, event)
          : Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 120.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Order Summary Bento
                      _buildOrderSummaryCard(context, event, quantity, subtotal),
                      const SizedBox(height: 32),

                      if (!event.isFree) ...[
                        // Payment Method Selection
                        Text(
                          'Payment Method',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: AppColors.onSurface,
                                fontSize: 20,
                              ),
                        ),
                        const SizedBox(height: 16),
                        _buildPaymentMethodsRow(),
                        const SizedBox(height: 20),

                        // Card Input Fields (only if card selected)
                        if (_selectedPaymentMethod == 'card') _buildCardDetailsForm(context),
                        if (_selectedPaymentMethod != 'card') _buildWalletDetailsForm(context),
                        const SizedBox(height: 32),

                        // Promo Code Input
                        _buildPromoCodeSection(context),
                        const SizedBox(height: 32),
                      ],

                      // Pricing Summary
                      _buildPricingSummary(context, event, subtotal, serviceFee, tax, total),
                      const SizedBox(height: 24),

                      // Lock Note
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.shield_outlined, size: 14, color: AppColors.outline),
                          const SizedBox(width: 6),
                          Text(
                            event.isFree ? 'Secure RSVP confirmation' : 'Secure & encrypted payment',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.outline,
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Pay Now / Confirm Sticky Bottom
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: _buildPayButtonStickyBar(context, event, total),
                ),
              ],
            ),
    );
  }

  Widget _buildOrderSummaryCard(BuildContext context, Event event, int quantity, double subtotal) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.glassFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassStroke),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 100,
              height: 100,
              child: CachedNetworkImage(
                imageUrl: event.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: AppColors.surfaceContainer),
                errorWidget: (context, url, error) => Container(color: AppColors.surfaceContainer),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Event Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppColors.onSurface,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 14, color: AppColors.onSurfaceVariant),
                    const SizedBox(width: 6),
                    Text(
                      event.date,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSurfaceVariant,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: AppColors.onSurfaceVariant),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        event.location,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.onSurfaceVariant,
                              fontSize: 12,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Divider
                Container(height: 1, color: AppColors.glassStroke),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.isFree ? 'RSVP' : 'VIP Pass',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: AppColors.primary,
                                fontSize: 13,
                              ),
                        ),
                        Text(
                          'Quantity: $quantity',
                          style: TextStyle(
                            color: AppColors.onSurfaceVariant.withOpacity(0.8),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      event.isFree ? 'Free' : 'Rs ${subtotal.toStringAsFixed(0)}',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: AppColors.onSurface,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
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

  Widget _buildPaymentMethodsRow() {
    return Row(
      children: [
        Expanded(
          child: _buildPaymentMethodCard(
            id: 'card',
            icon: Icons.credit_card,
            label: 'Card',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildPaymentMethodCard(
            id: 'jazzcash',
            icon: Icons.account_balance_wallet,
            label: 'JazzCash',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildPaymentMethodCard(
            id: 'easypaisa',
            icon: Icons.phone_iphone,
            label: 'EasyPaisa',
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodCard({required String id, required IconData icon, required String label}) {
    final isSelected = _selectedPaymentMethod == id;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = id;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryContainer.withOpacity(0.1) : AppColors.glassFill,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.electricIndigo : AppColors.glassStroke,
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: isSelected ? AppColors.primary : AppColors.onSurface,
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardDetailsForm(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.glassFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassStroke),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Card Number',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 8),
          _buildTextField(hint: '0000 0000 0000 0000', keyboardType: TextInputType.number),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Expiry Date',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 8),
                    _buildTextField(hint: 'MM/YY', keyboardType: TextInputType.number),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CVV',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 8),
                    _buildTextField(hint: '•••', isPassword: true, keyboardType: TextInputType.number),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWalletDetailsForm(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.glassFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassStroke),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mobile Number',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 8),
          _buildTextField(hint: '03XX XXXXXXX', keyboardType: TextInputType.phone),
          const SizedBox(height: 8),
          Text(
            'A push notification will be sent to your phone to authorize the transaction.',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.onSurfaceVariant.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      obscureText: isPassword,
      keyboardType: keyboardType,
      style: const TextStyle(color: AppColors.onSurface),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.outlineVariant),
        fillColor: AppColors.surfaceDark,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.glassStroke),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.glassStroke),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.electricIndigo),
        ),
      ),
    );
  }

  Widget _buildPromoCodeSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.glassFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassStroke),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const Icon(Icons.local_offer, color: AppColors.onSurfaceVariant),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _promoController,
              decoration: InputDecoration(
                hintText: 'Enter Promo Code',
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.outlineVariant,
                    ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: const TextStyle(color: AppColors.onSurface),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Apply',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.electricIndigo,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPricingSummary(
    BuildContext context,
    Event event,
    double subtotal,
    double serviceFee,
    double tax,
    double total,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.glassFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassStroke),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Summary',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.onSurface,
                  fontSize: 18,
                ),
          ),
          const SizedBox(height: 16),
          _buildPriceRow('Tickets (2x)', event.isFree ? 'Free' : 'Rs ${subtotal.toStringAsFixed(0)}'),
          const SizedBox(height: 8),
          _buildPriceRow('Service Fee', event.isFree ? 'Rs 0' : 'Rs ${serviceFee.toStringAsFixed(0)}'),
          const SizedBox(height: 8),
          _buildPriceRow('Tax', event.isFree ? 'Rs 0' : 'Rs ${tax.toStringAsFixed(0)}'),
          const SizedBox(height: 12),
          Container(height: 1, color: AppColors.glassStroke),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                event.isFree ? 'Free' : 'Rs ${total.toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 14),
        ),
        Text(
          value,
          style: const TextStyle(color: AppColors.onSurface, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildPayButtonStickyBar(BuildContext context, Event event, double total) {
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
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.electricIndigo, AppColors.vibrantPurple],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.vibrantPurple.withOpacity(0.3),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isBooked = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(event.isFree ? Icons.check : Icons.lock, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(
                      event.isFree ? 'CONFIRM RSVP' : 'PAY NOW (Rs ${total.toStringAsFixed(0)})',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessView(BuildContext context, Event event) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: AppColors.electricIndigo.withOpacity(0.2),
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.electricIndigo, width: 2),
              ),
              child: const Icon(
                Icons.check,
                color: AppColors.primary,
                size: 48,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              event.isFree ? 'RSVP Confirmed!' : 'Payment Successful!',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              event.isFree
                  ? 'Your spot for "${event.title}" has been reserved. You can view your ticket in your profile tab.'
                  : 'Your booking for "${event.title}" is complete. We\'ve generated your tickets, which you can access anytime under your Profile tab.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.onSurfaceVariant.withOpacity(0.8),
                fontSize: 15,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  context.go('/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.surfaceContainerHigh,
                  foregroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: AppColors.glassStroke),
                  ),
                ),
                child: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
