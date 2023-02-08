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
    catergories: ['Sport'],
    agency: 'last news Agency',
    agencyLogoUrl: Asset.akharinKhabarLogo,
    reportTime: '5 min ago',
    shortDescription:
        'Porto\'s negative answer to Chelsea for attracting Tarami with the taste of threat!',
  ),
  Content(
    imageUrl: Asset.newsImage1,
    catergories: ['Sport'],
    agency: 'last news Agency',
    agencyLogoUrl: Asset.varzesh3SmallLogo,
    reportTime: '5 min ago',
    shortDescription:
        'The foot of the dragon opened to score, the first goal of Leucadia against Sanat Naft Abadan',
  ),
  Content(
    imageUrl: Asset.newsImage1,
    catergories: ['Sports'],
    agency: 'last news Agency',
    agencyLogoUrl: Asset.akharinKhabarLogo,
    reportTime: '5 min ago',
    shortDescription:
        'Porto\'s negative answer to Chelsea for attracting Tarami with the taste of threat!',
  ),
  Content(
    imageUrl: Asset.newsImage1,
    catergories: ['Sports'],
    agency: 'last news Agency',
    agencyLogoUrl: Asset.akharinKhabarLogo,
    reportTime: '5 min ago',
    shortDescription:
        'The foot of the dragon opened to score, the first goal of Leucadia against Sanat Naft Abadan',
  ),
  Content(
    imageUrl: Asset.newsImage1,
    catergories: ['Sports'],
    agency: 'last news Agency',
    agencyLogoUrl: Asset.akharinKhabarLogo,
    reportTime: '5 min ago',
    shortDescription:
        'Porto\'s negative answer to Chelsea for attracting Tarami with the taste of threat!',
  ),
];
List<Content> suggestionNewsList = [
  Content(
    imageUrl: Asset.suggestionNewsPhoto1,
    catergories: ['Technology'],
    agency: 'Digiato Agency',
    agencyLogoUrl: Asset.digiatoLogo,
    reportTime: '5 min ago',
    shortDescription:
        'Garmin Venu Sq 2 smart watch with 11-day battery life was introduced.',
    longDescription:
        'At the IFA 2022 event, Garmin introduced the Venu Sq 2 smartwatch and the Black Panther Vivofit Jr 3 children\'s health tracker.',
  ),
  Content(
    imageUrl: Asset.suggestionNewsPhoto1,
    catergories: ['Technology'],
    agency: 'Digiato Agency',
    agencyLogoUrl: Asset.digiatoLogo,
    reportTime: '5 min ago',
    shortDescription:
        'Garmin Venu Sq 2 smart watch with 11-day battery life was introduced.',
    longDescription:
        'At the IFA 2022 event, Garmin introduced the Venu Sq 2 smartwatch and the Black Panther Vivofit Jr 3 children\'s health tracker.',
  ),
  Content(
    imageUrl: Asset.suggestionNewsPhoto1,
    catergories: ['Technology'],
    agency: 'Digiato Agency',
    agencyLogoUrl: Asset.digiatoLogo,
    reportTime: '5 min ago',
    shortDescription:
        'Garmin Venu Sq 2 smart watch with 11-day battery life was introduced.',
    longDescription:
        'At the IFA 2022 event, Garmin introduced the Venu Sq 2 smartwatch and the Black Panther Vivofit Jr 3 children\'s health tracker.',
  ),
  Content(
    imageUrl: Asset.suggestionNewsPhoto1,
    catergories: ['Technology'],
    agency: 'Digiato Agency',
    agencyLogoUrl: Asset.digiatoLogo,
    reportTime: '5 min ago',
    shortDescription:
        'Garmin Venu Sq 2 smart watch with 11-day battery life was introduced.',
    longDescription:
        'At the IFA 2022 event, Garmin introduced the Venu Sq 2 smartwatch and the Black Panther Vivofit Jr 3 children\'s health tracker.',
  ),
];

List<Content> categoryList = [
  Content(
    imageUrl: '',
    catergories: [
      'Sports',
    ],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [
      'Technology',
    ],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [
      'Science',
    ],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [
      'Economic',
    ],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [
      'political',
    ],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [
      'cultural',
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
    agency: 'Zoomit',
    agencyLogoUrl: Asset.zoomitIcon,
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [],
    agency: 'Varzesh3',
    agencyLogoUrl: Asset.varzesh3Logo,
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [],
    agency: 'Digiato',
    agencyLogoUrl: Asset.digiatoLogo,
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [],
    agency: 'Zoomit',
    agencyLogoUrl: Asset.zoomitIcon,
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [],
    agency: 'Varzesh3',
    agencyLogoUrl: Asset.varzesh3Logo,
    reportTime: '',
  ),
  Content(
    imageUrl: '',
    catergories: [],
    agency: 'Digiato',
    agencyLogoUrl: Asset.digiatoLogo,
    reportTime: '',
  ),
];
List<Content> editorCategorySuggestionList = [
  Content(
    imageUrl: Asset.newsImage1,
    catergories: ['Sports'],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: Asset.medicalAndSciencePhoto,
    catergories: ['Science-Medical'],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: Asset.newsImage1,
    catergories: ['Sports'],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: Asset.medicalAndSciencePhoto,
    catergories: ['Science-Medical'],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: Asset.newsImage1,
    catergories: ['Sports'],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
  Content(
    imageUrl: Asset.medicalAndSciencePhoto,
    catergories: ['Science-Medical'],
    agency: '',
    agencyLogoUrl: '',
    reportTime: '',
  ),
];
