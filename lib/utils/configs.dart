import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

const APP_NAME = 'Ваш сервис';
const APP_NAME_TAG_LINE = 'Сервис для людей...';
var defaultPrimaryColor = Color(0xFF0000ff);

const DOMAIN_URL = 'http://myservice.na4u.ru'; // Don't add slash at the end of the url
const BASE_URL = '$DOMAIN_URL/api/';

const DEFAULT_LANGUAGE = 'ru';

/// You can change this to your Provider App package name
/// This will be used in Registered As Partner in Sign In Screen where your users can redirect to the Play/App Store for Provider App
/// You can specify in Admin Panel, These will be used if you don't specify in Admin Panel
const PROVIDER_PACKAGE_NAME = 'com.myservice.provider';
const IOS_LINK_FOR_PARTNER = "https://";

const IOS_LINK_FOR_USER = 'https://';

const DASHBOARD_AUTO_SLIDER_SECOND = 5;

const TERMS_CONDITION_URL = 'https://myservice.na4u.ru/terms-of-use/';
const PRIVACY_POLICY_URL = 'https://myservice.na4u.ru/privacy-policy/';
const INQUIRY_SUPPORT_EMAIL = ' ';

/// You can add help line number here for contact. It's demo number
const HELP_LINE_NUMBER = '';

//Airtel Money Payments
///It Supports ["UGX", "NGN", "TZS", "KES", "RWF", "ZMW", "CFA", "XOF", "XAF", "CDF", "USD", "XAF", "SCR", "MGA", "MWK"]
const AIRTEL_CURRENCY_CODE = "MWK";
const AIRTEL_COUNTRY_CODE = "MW";
const AIRTEL_TEST_BASE_URL = 'https://openapiuat.airtel.africa/'; //Test Url
const AIRTEL_LIVE_BASE_URL = 'https://openapi.airtel.africa/'; // Live Url


/// PAYSTACK PAYMENT DETAIL
const PAYSTACK_CURRENCY_CODE = 'RUB';

/// Nigeria Currency

/// STRIPE PAYMENT DETAIL
const STRIPE_MERCHANT_COUNTRY_CODE = 'RU';
const STRIPE_CURRENCY_CODE = 'RUB';

/// RAZORPAY PAYMENT DETAIL
const RAZORPAY_CURRENCY_CODE = 'RUB';

/// PAYPAL PAYMENT DETAIL
const PAYPAL_CURRENCY_CODE = 'RUB';

/// SADAD PAYMENT DETAIL
const SADAD_API_URL = 'https://api-s.sadad.qa';
const SADAD_PAY_URL = "https://d.sadad.qa";

DateTime todayDate = DateTime(24, 8, 2022);

Country defaultCountry() {
  return Country(
    phoneCode: '7',
    countryCode: 'RU',
    e164Sc: 7,
    geographic: true,
    level: 1,
    name: 'Russia',
    example: 'Номер без кода страны',
    displayName: 'Russia (RU) [+7]',
    displayNameNoCountryCode: 'Russia (RU)',
    e164Key: '7-RU-0',
    fullExampleWithPlusSign: '+919123456789',
  );
}
