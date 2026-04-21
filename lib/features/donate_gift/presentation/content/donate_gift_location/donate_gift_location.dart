import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donate_gift/donate_gift_strings.dart';
import 'package:proyectos_amor/features/donate_gift/logic/bloc/collection_centers_bloc/collection_centers_bloc.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_location_cubit/donate_gift_location_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_step_cubit/donate_gift_step_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/presentation/content/donate_gift_chip_item.dart';
import 'package:proyectos_amor/services/collection_center_service/models/collection_center_response.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DonateGiftLocation extends StatefulWidget {
  const DonateGiftLocation({super.key});

  @override
  State<DonateGiftLocation> createState() => _DonateGiftLocationState();
}

class _DonateGiftLocationState extends State<DonateGiftLocation> {
  @override
  void initState() {
    super.initState();
    context
        .read<CollectionCentersBloc>()
        .add(const CollectionCentersEvent.fetchCollectionCenters());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        context.read<DonateGiftStepCubit>().change(DonateGiftStep.information);
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const AppText.normal(
            DonateGiftStrings.donateGiftLocationTitle,
            fontSize: 12,
            fontColor: ColorsConstant.splashPrimaryFontColor,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 18),
          BlocBuilder<CollectionCentersBloc, CollectionCentersState>(
            builder: (context, state) {
              return state.maybeWhen(
                collectionCentersLoadingState: () =>
                    const _CollectionCentersSkeleton(),
                collectionCentersSuccessState: (collectionCenters) {
                  if (collectionCenters.isEmpty) {
                    return const AppText.normal(
                      'No hay centros de acopio disponibles.',
                      fontSize: 14,
                      fontColor: ColorsConstant.textPlaceholder,
                      textAlign: TextAlign.center,
                    );
                  }

                  return BlocBuilder<DonateGiftLocationCubit,
                      CollectionCenterResponse?>(
                    builder: (context, locationState) => Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: collectionCenters
                          .map(
                            (center) => DonateGiftChipItem(
                              text: center.alias,
                              selected: center.id == locationState?.id,
                              onTap: () => context
                                  .read<DonateGiftLocationCubit>()
                                  .change(center),
                            ),
                          )
                          .toList(),
                    ),
                  );
                },
                collectionCentersErrorState: (message) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppText.normal(
                      message.isNotEmpty
                          ? message
                          : 'No pudimos cargar los centros de acopio.',
                      fontSize: 14,
                      fontColor: Colors.red,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    AppButton.ghost(
                      text: 'Reintentar',
                      onTap: () => context.read<CollectionCentersBloc>().add(
                            const CollectionCentersEvent.fetchCollectionCenters(
                              forceRefresh: true,
                            ),
                          ),
                    ),
                  ],
                ),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CollectionCentersSkeleton extends StatelessWidget {
  const _CollectionCentersSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
      enabled: true,
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          DonateGiftChipItem(text: 'San Miguel\nAv. La Marina 2000'),
          DonateGiftChipItem(text: 'Pueblo Libre\nAv. Brasil 1599'),
          DonateGiftChipItem(text: 'Ate\nCarretera Central 345'),
        ],
      ),
    );
  }
}
