import 'package:proyectos_amor/config/app_constants.dart';

class HomeStrings {
  static const String homeGreetingTitle = 'Hola, amigo solidario';
  static const String homeHowHelpTitle = '¿Cómo puedes ayudar?';

  static const String homeMoneyHelpTitle = 'Donar dinero';
  static String homeMoneyHelpSubTitle =
      'Desde ${AppConstants.appCurrency} ${AppConstants.appMinimumDonation.toStringAsFixed(2)}';

  static const String homeGiftHelpTitle = 'Donar regalos';
  static const String homeGiftHelpSubTitle = 'Ropa, alimentos, otros';

  static const String homeActivityTitle = 'Iniciativas recientes';
  static const String homeActivityPrimaryButton = 'Donar ahora';

  static const String homeCertificationDescription =
      'Tus donaciones pueden recibir un diploma como voluntario';
  static const String homeCertificationCheckCertification = 'Revisa tu diploma';

  static const String homeReminderTitle = '¡Recuerda!';
  static const String homeReminderSubTitle =
      'El regalo debe ser tan lindo como te gustaría recibirlo.';

  static const String homeStatisticsCardPrimaryButton = 'Ver datos';
  static const String homeStatisticsTitle = 'Estamos en todo el Perú';
  static const String homeStatisticsProvinces = '11 provincias';
  static const String homeStatisticsVisited = 'visitadas';
  static const String homeStatisticsDreams = '109 sueños cumplidos';
  static const String homeStatisticsDreamsDescription = 'de niños con cáncer';
  static const String homeStatisticsBeneficiaries = '14K beneficiados';
  static const String homeStatisticsBeneficiariesDescription =
      'en todo el Perú';
  static const String homeActivityFallbackTitle = 'Sanar Jugando';
  static const String homeActivityFallbackDescription =
      'Queremos trasladar a 30 niños de provincia a Lima para que puedan aprender mejor';
  static const String homeActivityDonatedSuffix = 'donados';
  static const String homeActivityGoalSuffix = 'meta';

  static const String homeDonationTitle = '¡Contamos contigo!';
  static const String homeDonationSubTitle =
      'Si te gusta lo que ves, ayúdanos donando desde S/ 1.00';

  static const String unauthorizedDonationsContentTitle = 'No tienes donativos';
  static const String unauthorizedDonationsContentDescription =
      '¡Inicia sesión para realizar tu primera donación!';
}
