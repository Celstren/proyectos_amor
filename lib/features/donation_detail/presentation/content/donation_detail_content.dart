import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:proyectos_amor/features/donation_detail/logic/bloc/fetch_donation_detail_bloc/fetch_donation_detail_bloc.dart';
import 'package:proyectos_amor/features/donation_detail/presentation/content/donation_description/donation_description.dart';
import 'package:proyectos_amor/features/donation_detail/presentation/content/donation_detail_header/donation_detail_header.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile_tabs/authenticated_profile_tabs_content/authenticated_donation_content/authenticated_donation_item.dart';
import 'package:proyectos_amor/services/donation_service/models/donation_response.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DonationDetailContent extends StatefulWidget {
  final String donationId;

  const DonationDetailContent({
    super.key,
    required this.donationId,
  });

  @override
  State<DonationDetailContent> createState() => _DonationDetailContentState();
}

class _DonationDetailContentState extends State<DonationDetailContent> {
  @override
  void initState() {
    super.initState();
    _fetchDonationDetail();
  }

  void _fetchDonationDetail() {
    context.read<FetchDonationDetailBloc>().add(
          FetchDonationDetailEvent.fetchDonationDetail(
            donationId: widget.donationId,
          ),
        );
  }

  DonationStatus _donationStatus(String status) {
    switch (status) {
      case 'received':
        return DonationStatus.received;
      case 'cancelled':
        return DonationStatus.cancelled;
      case 'pending':
      default:
        return DonationStatus.pending;
    }
  }

  String _donationText(DonationResponse donation) {
    if (donation.donationType == 'money') {
      final currency = donation.currency ?? '';
      final amount = donation.amount ?? '0.00';
      return 'Donación de dinero - $currency $amount'.trim();
    }

    final quantity = donation.quantity ?? 0;
    return '$quantity ${donation.description}';
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('dd MMM yyyy, h:mm a', 'es_MX').format(date);
  }

  Widget _buildHero() {
    return Container(
      height: 208,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/claim_certification/claim_certification_placeholder.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDonationDetail(DonationResponse donation) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const DonationDetailHeader(),
          _buildHero(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: _donationStatus(donation.status).card,
            ),
          ),
          DonationDescription(
            donation: _donationText(donation),
            receivedBy:
                donation.status == 'received' ? 'Proyectos de Amor' : '',
            locationAddress: donation.collectionCenter?.address ?? '',
            deliveryDate: _formatDate(donation.pickupAt),
          ),
          if (donation.vouchers.isNotEmpty) ...[
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: AppText.semiBold(
                'Archivos adjuntos',
                fontSize: 14,
                fontColor: ColorsConstant.splashPrimaryFontColor,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: donation.vouchers
                    .map(
                      (voucher) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: _DonationVoucherItem(voucher: voucher),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Skeletonizer(
      enabled: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const DonationDetailHeader(),
            _buildHero(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: DonationStatus.pending.card,
              ),
            ),
            const DonationDescription(
              donation: '3 juguetes educativos',
              receivedBy: 'Proyectos de Amor',
              locationAddress: 'Av. La Marina 2000, San Miguel, Lima',
              deliveryDate: '20 abr 2026, 4:00 p. m.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError(String message, String? errorCode, int? statusCode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const DonationDetailHeader(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AppText.semiBold(
                  'No pudimos cargar el detalle',
                  fontSize: 16,
                  fontColor: ColorsConstant.splashPrimaryFontColor,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                AppText.normal(
                  message.isNotEmpty
                      ? message
                      : 'Intenta nuevamente en unos segundos.',
                  fontSize: 12,
                  fontColor: ColorsConstant.textPlaceholder,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                AppButton.ghost(
                  text: 'Reintentar',
                  onTap: _fetchDonationDetail,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: BlocBuilder<FetchDonationDetailBloc, FetchDonationDetailState>(
        builder: (context, state) {
          return state.maybeWhen(
            fetchDonationDetailLoadingState: _buildLoading,
            fetchDonationDetailSuccessState: _buildDonationDetail,
            fetchDonationDetailErrorState: _buildError,
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

class _DonationVoucherItem extends StatelessWidget {
  final DonationVoucherResponse voucher;

  const _DonationVoucherItem({required this.voucher});

  IconData get _icon {
    switch (voucher.fileType) {
      case 'image':
        return Icons.image_outlined;
      case 'video':
        return Icons.perm_media_outlined;
      case 'document':
      default:
        return Icons.description_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorsConstant.text200),
      ),
      child: Row(
        children: [
          Icon(
            _icon,
            color: ColorsConstant.primaryColor600,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.semiBold(
                  voucher.fileName ?? 'Archivo adjunto',
                  fontSize: 12,
                  fontColor: ColorsConstant.splashPrimaryFontColor,
                  textAlign: TextAlign.start,
                ),
                if (voucher.fileType?.isNotEmpty ?? false) ...[
                  const SizedBox(height: 4),
                  AppText.normal(
                    voucher.fileType!,
                    fontSize: 12,
                    fontColor: ColorsConstant.textPlaceholder,
                    textAlign: TextAlign.start,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
