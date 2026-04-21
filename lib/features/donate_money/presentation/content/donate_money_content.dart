import 'dart:io';

import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:proyectos_amor/features/donate_money/logic/cubit/enable_donation_certification_cubit/enable_donation_certification_cubit.dart';
import 'package:proyectos_amor/features/donate_money/logic/cubit/donate_money_step_cubit/donate_money_step_cubit.dart';
import 'package:proyectos_amor/features/donate_money/logic/cubit/payment_method_cubit/payment_method_cubit.dart';
import 'package:proyectos_amor/features/donate_money/presentation/content/donate_money_bottom/donate_money_bottom.dart';
import 'package:proyectos_amor/features/donate_money/presentation/content/donate_money_header/donate_money_header.dart';
import 'package:proyectos_amor/features/donate_money/presentation/content/how_donate_money/how_donate_money.dart';
import 'package:proyectos_amor/features/donate_money/presentation/content/upload_voucher/upload_voucher.dart';
import 'package:proyectos_amor/features/donations/logic/bloc/create_donation_bloc/create_donation_bloc.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';
import 'package:proyectos_amor/services/donation_service/models/create_donation_request.dart';

class DonateMoneyContent extends StatefulWidget {
  const DonateMoneyContent({super.key});

  @override
  State<DonateMoneyContent> createState() => _DonateMoneyContentState();
}

class _DonateMoneyContentState extends State<DonateMoneyContent> {
  static const _maxVoucherFiles = 5;
  static const _maxVoucherFileSize = 1024 * 1024;

  final _amountController = TextEditingController();
  final _certificationRucController = TextEditingController();
  final _certificationCompanyController = TextEditingController();
  final _imagePicker = ImagePicker();
  final List<File> _voucherFiles = [];

  @override
  void dispose() {
    _amountController.dispose();
    _certificationRucController.dispose();
    _certificationCompanyController.dispose();
    super.dispose();
  }

  double? get _amount {
    final normalizedAmount = _amountController.text.trim().replaceAll(',', '.');
    return double.tryParse(normalizedAmount);
  }

  void _goToUploadVoucher(BuildContext context) {
    final paymentMethod = context.read<PaymentMethodCubit>().state;

    if (paymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecciona un método de donación.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    context.read<DonateMoneyStepCubit>().change(DonateMoneyStep.uploadVoucher);
  }

  void _createDonation(BuildContext context) {
    final amount = _amount;

    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ingresa un monto válido para tu donativo.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (_voucherFiles.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Adjunta al menos un voucher de tu donativo.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final paymentMethod = context.read<PaymentMethodCubit>().state;
    final needsCertification =
        context.read<EnableDonationCertificationCubit>().state;
    final certificationRuc = _certificationRucController.text.trim();
    final certificationCompany = _certificationCompanyController.text.trim();

    context.read<CreateDonationBloc>().add(
          CreateDonationEvent.createDonation(
            request: CreateDonationRequest(
              donationType: DonationType.money,
              description: paymentMethod != null
                  ? 'Donación de dinero por ${paymentMethod.text}'
                  : 'Donación de dinero',
              amount: amount,
              currency: 'PEN',
              needsCertification: needsCertification,
              certificationRuc:
                  needsCertification && certificationRuc.isNotEmpty
                      ? certificationRuc
                      : null,
              certificationCompanyName:
                  needsCertification && certificationCompany.isNotEmpty
                      ? certificationCompany
                      : null,
            ),
            attachments: _voucherFiles,
          ),
        );
  }

  Future<void> _addVoucherFiles(List<File> files) async {
    if (_voucherFiles.length >= _maxVoucherFiles) {
      _showValidationMessage(
        'Solo puedes adjuntar hasta $_maxVoucherFiles vouchers.',
      );
      return;
    }

    final existingPaths = _voucherFiles.map((file) => file.path).toSet();
    final availableSlots = _maxVoucherFiles - _voucherFiles.length;
    final uniqueFiles = files
        .where((file) => !existingPaths.contains(file.path))
        .take(availableSlots)
        .toList();

    if (files.length > availableSlots) {
      _showValidationMessage(
        'Solo puedes adjuntar hasta $_maxVoucherFiles vouchers.',
      );
    }

    final validFiles = <File>[];
    final oversizedFiles = <File>[];

    for (final file in uniqueFiles) {
      final fileSize = await file.length();
      if (fileSize > _maxVoucherFileSize) {
        oversizedFiles.add(file);
      } else {
        validFiles.add(file);
      }
    }

    if (oversizedFiles.isNotEmpty) {
      _showValidationMessage(
        'Cada voucher debe pesar como máximo 1MB.',
      );
    }

    if (validFiles.isEmpty) {
      return;
    }

    setState(() {
      _voucherFiles.addAll(validFiles);
    });
  }

  Future<void> _takeVoucherPhoto() async {
    try {
      final image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );

      if (image == null) {
        return;
      }

      await _addVoucherFiles([File(image.path)]);
    } catch (e) {
      _showAttachError(e);
    }
  }

  Future<void> _pickVoucherImages() async {
    try {
      final images = await _imagePicker.pickMultiImage(
        imageQuality: 85,
      );

      if (images.isEmpty) {
        return;
      }

      await _addVoucherFiles(images.map((image) => File(image.path)).toList());
    } catch (e) {
      _showAttachError(e);
    }
  }

  Future<void> _pickVoucherFiles() async {
    try {
      final result = await FilePicker.pickFiles(
        allowMultiple: true,
      );
      final paths =
          result?.files.map((file) => file.path).whereType<String>().toList();

      if (paths == null || paths.isEmpty) {
        return;
      }

      await _addVoucherFiles(paths.map(File.new).toList());
    } catch (e) {
      _showAttachError(e);
    }
  }

  void _showAttachError(Object error) {
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('No pudimos adjuntar el archivo: $error'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showValidationMessage(String message) {
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.orange,
      ),
    );
  }

  Future<void> _showVoucherAttachOptions() {
    return showModalBottomSheet<void>(
      context: context,
      builder: (bottomSheetContext) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_camera_outlined),
                title: const Text('Tomar foto'),
                onTap: () {
                  Navigator.of(bottomSheetContext).pop();
                  _takeVoucherPhoto();
                },
              ),
              ListTile(
                leading: const Icon(Icons.image_outlined),
                title: const Text('Adjuntar imagen o imágenes'),
                onTap: () {
                  Navigator.of(bottomSheetContext).pop();
                  _pickVoucherImages();
                },
              ),
              ListTile(
                leading: const Icon(Icons.description_outlined),
                title: const Text('Adjuntar archivo o archivos'),
                onTap: () {
                  Navigator.of(bottomSheetContext).pop();
                  _pickVoucherFiles();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _removeVoucherFile(File file) {
    setState(() {
      _voucherFiles
          .removeWhere((selectedFile) => selectedFile.path == file.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateDonationBloc, CreateDonationState>(
      listener: (context, state) {
        state.maybeWhen(
          createDonationSuccessState: (donation) {
            final donatedAt = DateFormat('dd MMMM yyyy', 'es_MX').format(
              donation.donatedAt,
            );

            AutoRouter.of(context).push(
              ConfirmDonationPageRoute(
                donation:
                    'S/ ${donation.amount ?? _amount?.toStringAsFixed(2) ?? ''}',
                approvedAt: donatedAt,
              ),
            );
          },
          createDonationErrorState: (message) {
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
                const DonateMoneyHeader(),
                Expanded(
                  child: BlocBuilder<DonateMoneyStepCubit, DonateMoneyStep>(
                    builder: (context, DonateMoneyStep stepState) {
                      switch (stepState) {
                        case DonateMoneyStep.howToDonate:
                          return const HowDonateMoney();
                        case DonateMoneyStep.uploadVoucher:
                          return UploadVoucher(
                            amountController: _amountController,
                            certificationRucController:
                                _certificationRucController,
                            certificationCompanyController:
                                _certificationCompanyController,
                            selectedFiles: _voucherFiles,
                            onPickFiles: _showVoucherAttachOptions,
                            onRemoveFile: _removeVoucherFile,
                          );
                      }
                    },
                  ),
                ),
                BlocBuilder<DonateMoneyStepCubit, DonateMoneyStep>(
                  builder: (context, DonateMoneyStep stepState) =>
                      BlocBuilder<CreateDonationBloc, CreateDonationState>(
                    builder: (context, createDonationState) {
                      final isLoading =
                          createDonationState is CreateDonationLoadingState;

                      return DonateMoneyBottom(
                        onNext: stepState == DonateMoneyStep.howToDonate
                            ? () => _goToUploadVoucher(context)
                            : null,
                        onDone: stepState == DonateMoneyStep.uploadVoucher &&
                                !isLoading
                            ? () => _createDonation(context)
                            : null,
                      );
                    },
                  ),
                )
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
