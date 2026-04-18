import 'package:dash_bord_fruite_hup/features/orders/domain/entitis/order_productes_entiti.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final OrderProductesEntiti product;
  final VoidCallback? onAccept;
  final VoidCallback? onRefuse;

  const ProductItem({
    super.key,
    required this.product,
    this.onAccept,
    this.onRefuse,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTopSection(),
          _buildDivider(),
          _buildActionButtons(),
        ],
      ),
    );
  }

  // ── القسم العلوي ──
  Widget _buildTopSection() {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductImage(),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ اسم المنتج + Code badge في نفس الصف جوا الـ Expanded
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${product.name}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1C1C1E),
                          height: 1.3,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildCodeBadge(),
                  ],
                ),
                const SizedBox(height: 10),
                // السعر والكمية
                Row(
                  children: [
                    _buildInfoBadge(
                      icon: Icons.monetization_on_rounded,
                      label: '${product.price} EGP',
                      bgColor: const Color(0xFFE8F5E9),
                      textColor: const Color(0xFF2E7D32),
                    ),
                    const SizedBox(width: 8),
                    _buildInfoBadge(
                      icon: Icons.inventory_2_outlined,
                      label: 'x${product.quantity}',
                      bgColor: const Color(0xFFE3F2FD),
                      textColor: const Color(0xFF1565C0),
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

  // ── صورة المنتج ──
  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.network(
        '${product.image}',
        width: 85,
        height: 85,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: 85,
          height: 85,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.image_not_supported_outlined,
            color: Colors.grey,
            size: 32,
          ),
        ),
      ),
    );
  }

  // ── Badge السعر أو الكمية ──
  Widget _buildInfoBadge({
    required IconData icon,
    required String label,
    required Color bgColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: textColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ── Code Badge ──
  Widget _buildCodeBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF3E5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'CODE',
            style: TextStyle(
              color: Color(0xFF6A1B9A),
              fontSize: 9,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '#${product.code}',
            style: const TextStyle(
              color: Color(0xFF6A1B9A),
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  // ── Divider ──
  Widget _buildDivider() {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      color: const Color(0xFFF0F0F0),
    );
  }

  // ── أزرار Accept و Refuse ──
  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: _buildActionBtn(
              label: 'Accept',
              icon: Icons.check_circle_outline_rounded,
              color: const Color(0xFF2E7D32),
              bgColor: const Color(0xFFE8F5E9),
              onTap: onAccept ?? () {},
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _buildActionBtn(
              label: 'Refuse',
              icon: Icons.cancel_outlined,
              color: const Color(0xFFC62828),
              bgColor: const Color(0xFFFFEBEE),
              onTap: onRefuse ?? () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionBtn({
    required String label,
    required IconData icon,
    required Color color,
    required Color bgColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}