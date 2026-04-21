import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_date_cubit/donate_gift_date_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_location_cubit/donate_gift_location_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_step_cubit/donate_gift_step_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_type_cubit/donate_gift_type_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_bottom/donate_gift_bottom.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_date/donate_gift_date.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_header/donate_gift_header.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_information/donate_gift_information.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_location/donate_gift_location.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_type/donate_gift_type.dart';
import 'package:proyectos_amor/features/donations/logic/bloc/create_donation_bloc/create_donation_bloc.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';
import 'package:proyectos_amor/services/donation_service/models/create_donation_request.dart';

class DonateGiftContent extends StatefulWidget {
  const DonateGiftContent({super.key});

  @override
  State<DonateGiftContent> createState() => _DonateGiftContentState();
}

class _DonateGiftContentState extends State<DonateGiftContent> {
  final _productController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  void dispose() {
    _productController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  int? get _quantity => int.tryParse(_quantityController.text.trim());

  void _showValidationMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.orange,
      ),
    );
  }

  void _goToInformation(BuildContext context) {
    final giftType = context.read<DonateGiftTypeCubit>().state;
    if (giftType == null) {
      _showValidationMessage('Selecciona el tipo de regalo que vas a donar.');
      return;
    }

    context.read<DonateGiftStepCubit>().change(DonateGiftStep.information);
  }

  void _goToLocations(BuildContext context) {
    final product = _productController.text.trim();
    final quantity = _quantity;

    if (product.isEmpty) {
      _showValidationMessage('Ingresa el producto que vas a donar.');
      return;
    }

    if (quantity == null || quantity <= 0) {
      _showValidationMessage('Ingresa una cantidad válida.');
      return;
    }

    context.read<DonateGiftStepCubit>().change(DonateGiftStep.locations);
  }

  void _goToDeliveryDate(BuildContext context) {
    final location = context.read<DonateGiftLocationCubit>().state;
    if (location == null) {
      _showValidationMessage('Selecciona el lugar de entrega más cercano.');
      return;
    }

    context.read<DonateGiftStepCubit>().change(DonateGiftStep.deliveryDate);
  }

  void _createDonation(BuildContext context) {
    final giftType = context.read<DonateGiftTypeCubit>().state;
    final location = context.read<DonateGiftLocationCubit>().state;
    final deliveryDate = context.read<DonateGiftDateCubit>().state;
    final product = _productController.text.trim();
    final quantity = _quantity;

    if (giftType == null) {
      _showValidationMessage('Selecciona el tipo de regalo que vas a donar.');
      return;
    }

    if (product.isEmpty) {
      _showValidationMessage('Ingresa el producto que vas a donar.');
      return;
    }

    if (quantity == null || quantity <= 0) {
      _showValidationMessage('Ingresa una cantidad válida.');
      return;
    }

    if (location == null) {
      _showValidationMessage('Selecciona el lugar de entrega más cercano.');
      return;
    }

    if (deliveryDate == null) {
      _showValidationMessage('Selecciona cuándo puedes llevar tu donativo.');
      return;
    }

    context.read<CreateDonationBloc>().add(
          CreateDonationEvent.createDonation(
            request: CreateDonationRequest(
              donationType: DonationType.item,
              description: '${giftType.text}: $product',
              quantity: quantity,
              collectionCenterId: location.collectionCenterId,
              pickupAt: deliveryDate.pickupAt,
              needsCertification: false,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateDonationBloc, CreateDonationState>(
      listener: (context, state) {
        state.maybeWhen(
          createDonationSuccessState: (donation) {
            final location = context.read<DonateGiftLocationCubit>().state;
            final deliveryDate = context.read<DonateGiftDateCubit>().state;
            final donatedAt = DateFormat('dd MMMM yyyy', 'es_MX').format(
              donation.donatedAt,
            );

            AutoRouter.of(context).push(
              ConfirmDonationPageRoute(
                donation:
                    '${donation.quantity ?? _quantity ?? ''} ${_productController.text.trim()}',
                approvedAt: donatedAt,
                location: location?.confirmText ?? '',
                deliveryAt: deliveryDate?.confirmText ?? '',
              ),
            );
          },
          createDonationErrorState: (message, errorCode, statusCode) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  message.isNotEmpty
                      ? message
                      : 'No pudimos registrar tu donativo.',
                ),
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
      child: AppScaffold(
        safeTop: false,
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const DonateGiftHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: BlocBuilder<DonateGiftStepCubit, DonateGiftStep>(
                      builder: (context, DonateGiftStep stepState) {
                        switch (stepState) {
                          case DonateGiftStep.giftType:
                            return const DonateGiftType();
                          case DonateGiftStep.information:
                            return DonateGiftInformation(
                              productController: _productController,
                              quantityController: _quantityController,
                            );
                          case DonateGiftStep.locations:
                            return const DonateGiftLocation();
                          case DonateGiftStep.deliveryDate:
                            return const DonateGiftDate();
                        }
                      },
                    ),
                  ),
                ),
                BlocBuilder<DonateGiftStepCubit, DonateGiftStep>(
                  builder: (context, DonateGiftStep stepState) =>
                      BlocBuilder<CreateDonationBloc, CreateDonationState>(
                    builder: (context, createDonationState) {
                      final isLoading =
                          createDonationState is CreateDonationLoadingState;

                      switch (stepState) {
                        case DonateGiftStep.giftType:
                          return DonateGiftBottom(
                            onNext: () => _goToInformation(context),
                          );
                        case DonateGiftStep.information:
                          return DonateGiftBottom(
                            onNext: () => _goToLocations(context),
                          );
                        case DonateGiftStep.locations:
                          return DonateGiftBottom(
                            onNext: () => _goToDeliveryDate(context),
                          );
                        case DonateGiftStep.deliveryDate:
                          return DonateGiftBottom(
                            onDone: isLoading
                                ? null
                                : () => _createDonation(context),
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
            BlocBuilder<CreateDonationBloc, CreateDonationState>(
              builder: (context, state) {
                if (state is! CreateDonationLoadingState) {
                  return const SizedBox();
                }

                return Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text(
                          'Registrando tu donativo...',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
