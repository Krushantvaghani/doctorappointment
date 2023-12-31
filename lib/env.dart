Map<String, dynamic> environment = {
  "serverConfig": {
    'apiUrl': 'https://google.com/api/',
    'baseUrl': 'https://google.com',
    'apiVersion': 'v1',
    'accessToken': '292105248cc4118ee8f2ccb0a97cd54d',
    'playStoreURL': 'https://play.google.com/store/apps/details?id=com.appName',
    'appStoreURL': 'https://apps.apple.com/us/app/itunes-connect/id8978990',
    'appDownloadURL': 'https://staging.com',
  },
  "advanceConfig": {
    "defaultLanguage": "en",
    "defaultCurrency": {
      "symbol": "₹",
      "decimalDigits": 0,
      "symbolBeforeTheNumber": true,
      "currency": "INR",
      "currencyCode": "INR",
    },
    "isMultiLanguages": false,
  },
  "loginSetting": {
    "IsRequiredLogin": false,
    "showAppleLogin": false, // Krushant
    "showFacebook": false, // Krushant
    "showSMSLogin": false, // Krushant
    "showGoogleLogin": false, // Krushant
    "showPhoneNumberWhenRegister": true,
    "requirePhoneNumberWhenRegister": true,

    /// For Facebook login.
    "facebookAppId": "430258564493822",
    "facebookLoginProtocolScheme": "fb430258564493822",
  },
};
