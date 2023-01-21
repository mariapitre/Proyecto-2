import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'na456bf5': {
      'es': 'Bienvenido,',
      'en': '',
    },
    'on0ksiq7': {
      'es': 'Email Address',
      'en': '',
    },
    'w7siq1b8': {
      'es': 'Enter your email here...',
      'en': '',
    },
    'wbc81b96': {
      'es': 'Password',
      'en': '',
    },
    '2sfgdhsu': {
      'es': 'Enter your password here...',
      'en': '',
    },
    'n6hul8qy': {
      'es': 'Forgot Password?',
      'en': '',
    },
    'osw20dwn': {
      'es': 'Login',
      'en': '',
    },
    '33tiq2a7': {
      'es': 'Don\'t have an account?',
      'en': '',
    },
    'fhkze5qf': {
      'es': 'Create Account',
      'en': '',
    },
    '6vg8ltmj': {
      'es': 'Home',
      'en': '',
    },
  },
  // createAccount
  {
    'm9xjvy3x': {
      'es': 'Empezar ahora,',
      'en': '',
    },
    'ed6rycgm': {
      'es': 'Email Address',
      'en': '',
    },
    'cwb105jz': {
      'es': 'Enter your email here...',
      'en': '',
    },
    'ukpv6qr7': {
      'es': 'Password',
      'en': '',
    },
    'c8impjd7': {
      'es': 'Enter your password here...',
      'en': '',
    },
    'cy8hzoj2': {
      'es': 'Create Account',
      'en': '',
    },
    '7e59q9ha': {
      'es': 'Already have an account?',
      'en': '',
    },
    '5vsn8x9v': {
      'es': 'Login',
      'en': '',
    },
    'h0uxiket': {
      'es': 'Home',
      'en': '',
    },
  },
  // homePage_MAIN
  {
    '2cj3bd0k': {
      'es': 'Welcome!',
      'en': '',
    },
    'w5j401xr': {
      'es': 'Encuentra tus examenes en un solo lugar',
      'en': '',
    },
    'ykosxbdj': {
      'es': 'Buscar examen',
      'en': '',
    },
    '90gsst3f': {
      'es': 'Home',
      'en': '',
    },
  },
  // myTrips
  {
    'd9jqzrv0': {
      'es': 'Completed',
      'en': '',
    },
    '7bhbbsn5': {
      'es': 'Mis ordenes',
      'en': '',
    },
    '0v3t0i67': {
      'es': 'My Trips',
      'en': '',
    },
  },
  // profilePage
  {
    'ah5dht9q': {
      'es': 'Switch to Dark Mode',
      'en': '',
    },
    'rrr15jfs': {
      'es': 'Switch to Light Mode',
      'en': '',
    },
    '9h2stwfd': {
      'es': 'Account Details',
      'en': '',
    },
    '88jx0fhb': {
      'es': 'Edit Profile',
      'en': '',
    },
    'rvey9n4e': {
      'es': 'Payment Information',
      'en': '',
    },
    'bh6bozwp': {
      'es': 'Change Password',
      'en': '',
    },
    'pn998and': {
      'es': 'Log Out',
      'en': '',
    },
    'jift3ipn': {
      'es': 'Profile',
      'en': '',
    },
  },
  // paymentInfo
  {
    'q9bhpsdo': {
      'es': 'Save Changes',
      'en': '',
    },
    'xea6wy9x': {
      'es': 'Payment Information',
      'en': '',
    },
    '1bpu29dj': {
      'es': 'Home',
      'en': '',
    },
  },
  // editProfile
  {
    'jzalgkcj': {
      'es': 'Edit Profile',
      'en': '',
    },
    'jikm17bk': {
      'es': 'Cambiar fotos',
      'en': '',
    },
    'n4gfzxkc': {
      'es': 'Full Name',
      'en': '',
    },
    'zg8ssvfb': {
      'es': 'Your full name...',
      'en': '',
    },
    'f4pu3f7i': {
      'es': 'Email Address',
      'en': '',
    },
    '20f07x2b': {
      'es': 'Your email..',
      'en': '',
    },
    'wfn6961y': {
      'es': 'Bio',
      'en': '',
    },
    'aizsmid3': {
      'es': 'A little about you...',
      'en': '',
    },
    'r06k0i8e': {
      'es': 'Guardar cambios',
      'en': '',
    },
    '58zre92n': {
      'es': 'Home',
      'en': '',
    },
  },
  // changePassword
  {
    'uwczc8oc': {
      'es': 'Email Address',
      'en': '',
    },
    'prvqf351': {
      'es': 'Your email..',
      'en': '',
    },
    'y9k215b6': {
      'es':
          'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
      'en': '',
    },
    '8bgvsuiz': {
      'es': 'Send Reset Link',
      'en': '',
    },
    '2h2xmor0': {
      'es': 'Change Password',
      'en': '',
    },
    'ew605ah9': {
      'es': 'Home',
      'en': '',
    },
  },
  // Success
  {
    'iqeun8b3': {
      'es': 'Checkout',
      'en': '',
    },
    'efn8a6mv': {
      'es': 'Fill in the information below to place your order.',
      'en': '',
    },
    '36nlmgfa': {
      'es': 'Price Breakdown',
      'en': '',
    },
    '8r2qhsks': {
      'es': 'Base Price',
      'en': '',
    },
    'mku6ry6s': {
      'es': '\$156.00',
      'en': '',
    },
    '5c6e1ekc': {
      'es': 'Taxes',
      'en': '',
    },
    'ocy6fahr': {
      'es': '\$24.20',
      'en': '',
    },
    'ytvyj27e': {
      'es': 'Cleaning Fee',
      'en': '',
    },
    'ng192jtm': {
      'es': '\$40.00',
      'en': '',
    },
    'swi3w49o': {
      'es': 'Total',
      'en': '',
    },
    'j0xwafss': {
      'es': '\$230.20',
      'en': '',
    },
    'm5hnp7nl': {
      'es': 'Cartera',
      'en': '',
    },
    'gzgrjl25': {
      'es': 'Home',
      'en': '',
    },
  },
  // total
  {
    'iz8byfgv': {
      'es': 'Order Total',
      'en': '',
    },
    'nwbvr3ky': {
      'es':
          'Your order total is a summary of all items in your order minus any fees and taxes associated with your purchase.',
      'en': '',
    },
    'gy8say4p': {
      'es': 'Okay',
      'en': '',
    },
  },
  // changePhoto
  {
    'hu98qkti': {
      'es': 'Change Profile Photo',
      'en': '',
    },
    'ommnm0vq': {
      'es': 'Upload Photo',
      'en': '',
    },
    '2u5ae4b3': {
      'es': 'Save Photo',
      'en': '',
    },
  },
  // changeMainPhoto
  {
    'w1skeo5m': {
      'es': 'Change Main Photo',
      'en': '',
    },
    'q68zpvj8': {
      'es': 'Upload Photo',
      'en': '',
    },
    'nddltk9q': {
      'es': 'Save Photo',
      'en': '',
    },
  },
  // cancelTrip
  {
    'vdy3fels': {
      'es': 'Cancel Trip',
      'en': '',
    },
    'j4krmqfl': {
      'es':
          'If you want to cancel your tripl please leave a note below to send to the host.',
      'en': '',
    },
    'crj786ox': {
      'es': 'Your reason for cancelling...',
      'en': '',
    },
    '0eucejz3': {
      'es': 'Yes, Cancel Trip',
      'en': '',
    },
    'o55z50ek': {
      'es': 'Never Mind',
      'en': '',
    },
  },
  // cancelTripHOST
  {
    'sjbxb5z1': {
      'es': 'Cancel Trip',
      'en': '',
    },
    'quvgetp8': {
      'es':
          'If you want to cancel your tripl please leave a note below to send to the host.',
      'en': '',
    },
    'y0dlwrhw': {
      'es': 'Your reason for cancelling...',
      'en': '',
    },
    'gn3gv89n': {
      'es': 'Yes, Cancel Trip',
      'en': '',
    },
    '8vmge7zm': {
      'es': 'Never Mind',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'ok99zq17': {
      'es': '',
      'en': '',
    },
    '6x2w9tf9': {
      'es': '',
      'en': '',
    },
    'kbum2c5p': {
      'es': 'Permitir usar su ubicacion',
      'en': '',
    },
    'xru7g2m9': {
      'es': 'Permitir enviar notificaciones ',
      'en': '',
    },
    'ayvdi24c': {
      'es': '',
      'en': '',
    },
    'ews43h4v': {
      'es': '',
      'en': '',
    },
    'nvx2rz6u': {
      'es': '',
      'en': '',
    },
    '40gduejs': {
      'es': '',
      'en': '',
    },
    '7hmjgxjr': {
      'es': '',
      'en': '',
    },
    '1newmla9': {
      'es': '',
      'en': '',
    },
    'nlef5fme': {
      'es': '',
      'en': '',
    },
    'nwqgp7xe': {
      'es': '',
      'en': '',
    },
    'kehyuj7o': {
      'es': '',
      'en': '',
    },
    'qzf6n0p4': {
      'es': '',
      'en': '',
    },
    'fb7axh0h': {
      'es': '',
      'en': '',
    },
    'bchzppw5': {
      'es': '',
      'en': '',
    },
    'kvmts8g6': {
      'es': '',
      'en': '',
    },
    'ezfrmmfy': {
      'es': '',
      'en': '',
    },
    'ugp9r03q': {
      'es': '',
      'en': '',
    },
    '3zlmr62o': {
      'es': '',
      'en': '',
    },
    'xeypwqxm': {
      'es': '',
      'en': '',
    },
    'dup3yqv7': {
      'es': '',
      'en': '',
    },
    't7k3o3tq': {
      'es': '',
      'en': '',
    },
    'f8wpdnsu': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
