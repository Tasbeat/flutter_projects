import 'package:flutter/material.dart';
import 'package:monews_app/asset.dart';
import 'package:monews_app/data/models/content.dart';

//colors
const Color transparent = Colors.transparent;
const Color black = Color(0xff1C1F2E);
const Color pink = Color(0xffFF033E);
const Color pink2 = Color(0xffFFCDD8);
const Color white = Color(0xffFAFAFA);
const Color blue = Colors.blue;
const Color grey = Color(0xffBFC3C8);
const Color blue2 = Color(0xff55B9F7);

List<Content> hotNewsList = [
  Content(
    imageUrl: Asset.newsImage1,
    catergories: ['ورزشی'],
    agency: 'خبرگذاری آخرین خبر',
    agencyLogoUrl: Asset.akharinKhabarLogo,
    reportTime: '5 دقیقه پیش',
    shortDescription: 'پاسخ منفی پورتو به چلسی برای جذب طارمی با طعم تهدید!',
  ),
  Content(
    imageUrl: Asset.newsImage1,
    catergories: ['ورزشی'],
    agency: 'خبرگذاری آخرین خبر',
    agencyLogoUrl: Asset.varzesh3SmallLogo,
    reportTime: '5 دقیقه پیش',
    shortDescription:
        'پای اژدها به گلزنی باز شد ، اولین گل لـوکـادیـا به صنعت نفت آبادان',
  ),
  Content(
    imageUrl: Asset.newsImage1,
    catergories: ['ورزشی'],
    agency: 'خبرگذاری آخرین خبر',
    agencyLogoUrl: Asset.akharinKhabarLogo,
    reportTime: '5 دقیقه پیش',
    shortDescription: 'پاسخ منفی پورتو به چلسی برای جذب طارمی با طعم تهدید!',
  ),
  Content(
    imageUrl: Asset.newsImage1,
    catergories: ['ورزشی'],
    agency: 'خبرگذاری آخرین خبر',
    agencyLogoUrl: Asset.akharinKhabarLogo,
    reportTime: '5 دقیقه پیش',
    shortDescription:
        'پای اژدها به گلزنی باز شد ، اولین گل لـوکـادیـا به صنعت نفت آبادان',
  ),
  Content(
    imageUrl: Asset.newsImage1,
    catergories: ['ورزشی'],
    agency: 'خبرگذاری آخرین خبر',
    agencyLogoUrl: Asset.akharinKhabarLogo,
    reportTime: '5 دقیقه پیش',
    shortDescription: 'پاسخ منفی پورتو به چلسی برای جذب طارمی با طعم تهدید!',
  ),
];
List<Content> suggestionNewsList = [
  Content(
    imageUrl: Asset.suggestionNewsPhoto1,
    catergories: ['تکنولوژی'],
    agency: 'خبرگذاری دیجیاتو',
    agencyLogoUrl: Asset.digiatoLogo,
    reportTime: '5 دقیقه پیش',
    shortDescription:
        'سـاعـت هوشـمـنـد گــارمـیـن Venu Sq 2 بـا عمر باتری ۱۱ روزه معرفی شد',
    longDescription:
        'گارمین در رویداد IFA ۲۰۲۲ ساعت هوشمند Venu Sq 2 و ردیاب سلامت کودکان موسوم به Black Panther Vivofit Jr 3 را معرفی کرد.',
  ),
  Content(
    imageUrl: Asset.suggestionNewsPhoto1,
    catergories: ['تکنولوژی'],
    agency: 'خبرگذاری دیجیاتو',
    agencyLogoUrl: Asset.digiatoLogo,
    reportTime: '5 دقیقه پیش',
    shortDescription:
        'سـاعـت هوشـمـنـد گــارمـیـن Venu Sq 2 بـا عمر باتری ۱۱ روزه معرفی شد',
    longDescription:
        'گارمین در رویداد IFA ۲۰۲۲ ساعت هوشمند Venu Sq 2 و ردیاب سلامت کودکان موسوم به Black Panther Vivofit Jr 3 را معرفی کرد.',
  ),
  Content(
    imageUrl: Asset.suggestionNewsPhoto1,
    catergories: ['تکنولوژی'],
    agency: 'خبرگذاری دیجیاتو',
    agencyLogoUrl: Asset.digiatoLogo,
    reportTime: '5 دقیقه پیش',
    shortDescription:
        'سـاعـت هوشـمـنـد گــارمـیـن Venu Sq 2 بـا عمر باتری ۱۱ روزه معرفی شد',
    longDescription:
        'گارمین در رویداد IFA ۲۰۲۲ ساعت هوشمند Venu Sq 2 و ردیاب سلامت کودکان موسوم به Black Panther Vivofit Jr 3 را معرفی کرد.',
  ),
  Content(
    imageUrl: Asset.suggestionNewsPhoto1,
    catergories: ['تکنولوژی'],
    agency: 'خبرگذاری دیجیاتو',
    agencyLogoUrl: Asset.digiatoLogo,
    reportTime: '5 دقیقه پیش',
    shortDescription:
        'سـاعـت هوشـمـنـد گــارمـیـن Venu Sq 2 بـا عمر باتری ۱۱ روزه معرفی شد',
    longDescription:
        'گارمین در رویداد IFA ۲۰۲۲ ساعت هوشمند Venu Sq 2 و ردیاب سلامت کودکان موسوم به Black Panther Vivofit Jr 3 را معرفی کرد.',
  ),
];

List<Content> categoryList = [
  Content(
    imageUrl: '',
    catergories: [
      'ورزشی',
    ],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [
      'تکنولوژی',
    ],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [
      'علمی',
    ],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [
      'اقتصادی',
    ],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [
      'سیاسی',
    ],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [
      'فرهنگی',
    ],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
];

List<Content> agenciesList = [
  Content(
    imageUrl: '',
    catergories: [],
    agency: 'زومیت',
    agencyLogoUrl: Asset.zoomitIcon,
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [],
    agency: 'ورزش سه',
    agencyLogoUrl: Asset.varzesh3Logo,
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [],
    agency: 'دیجیاتو',
    agencyLogoUrl: Asset.digiatoLogo,
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [],
    agency: 'زومیت',
    agencyLogoUrl: Asset.zoomitIcon,
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [],
    agency: 'ورزش سه',
    agencyLogoUrl: Asset.varzesh3Logo,
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [],
    agency: 'دیجیاتو',
    agencyLogoUrl: Asset.digiatoLogo,
    reportTime: '',
  ),
];
List<Content> editorCategorySuggestionList = [
  Content(
    imageUrl: Asset.newsImage1,
    catergories: ['ورزشی'],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: Asset.medicalAndSciencePhoto,
    catergories: ['علمی پزشکی'],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: Asset.newsImage1,
    catergories: ['ورزشی'],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: Asset.medicalAndSciencePhoto,
    catergories: ['علمی پزشکی'],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: Asset.newsImage1,
    catergories: ['ورزشی'],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: Asset.medicalAndSciencePhoto,
    catergories: ['علمی پزشکی'],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
];
