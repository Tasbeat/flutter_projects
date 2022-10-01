import 'package:flutter/material.dart';
import 'package:monews_app/widgets/widgets.dart';

import '../asset.dart';
import '../data/data.dart';

class CustomButtomSheet extends StatelessWidget {
  const CustomButtomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.6,
      maxChildSize: 0.9,
      builder: (context, scrollController) => ClipRRect(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            color: white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: _getBottomSheetHeader(),
                ),
                const SliverToBoxAdapter(
                  child: Text(
                    'پاسـخ مـنـفی پــورتـو به چـلـسی بـرای جــذب طـارمـی با طعم تهدید!',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: black,
                      fontFamily: 'SM',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 20.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: const [
                          LabelContent(),
                          LabelContent(),
                          LabelContent(),
                        ],
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Text(
                    'باشگاه چلسی که پیگیر جذب مهدی طارمی مهاجـم ایران بـود، با پاسـخ منفی باشگاه پورتو مواجه شد و این بازیـکن باوجود رویای بازی در لیگ برتر انگلیس فعلا در پرتغال ماندنی است.',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: black,
                      fontFamily: 'SM',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 310.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 320.0,
                          child: Text(
                            'بحث پیشنهاد باشگاه چلسـی انـگـلیس به پـورتـو بـرای جـذب مـهدی طــارمـی در آخـریــن ســاعــات نــقـل و انـتـقـالـات فــوتـبـال اروپـا یــکـی از سوژه‌های اصلی هواداران دو تیم بود. این خبر در حالی رسانه‌ای شد که گفته می‌شد چلسی برای جذب طارمی مبلغ ۲۵ میلیون یورو را به پورتو پیشنهاد داده است. روزنـامه «ابولا» پرتغال هم روز چهارشنـبـه ایــن خـبر را اعلـام کرد و به دنبال آن بعضی از مطبوعات انگلیس و کشورهای دیگر هم پیشنهاد چلسی به طارمی را دنبال کردند.طـارمـی در لـیـگ قـهـرمـانـان دو فــصـل پــیــش اروپـا و در دیـدار مـقـابـل چلسی عملکرد بی نظیری داشت و با یک گل قیچی برگردان، پورتو را به پیروزی رساند. هرچند که نماینده پرتـغال به خاطر مجموع نـتـایـج بازی رفت و برگشت حـذف شد. با ایـن حـال گـل طـارمـی حتـی تـا یک قـدمی انـتخـاب بهـترین گـل سـال فیـفا و دریـافـت جـایزه «پوشکاش» هم پیش رفت.',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: black,
                              fontFamily: 'SM',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          height: 280.0,
                          width: 2.0,
                          decoration: BoxDecoration(
                            color: pink,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _getBottomSheetHeader() {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        Container(
          height: 5.0,
          width: 70.0,
          decoration: const BoxDecoration(
            color: grey,
            borderRadius: BorderRadius.all(
              Radius.circular(100.0),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        _getTitleOfBottomSheet(),
        const SizedBox(height: 10.0),
      ],
    );
  }

  Padding _getTitleOfBottomSheet() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '5 دقیقه قبل',
            style: TextStyle(
              color: grey,
              fontSize: 10.0,
              fontFamily: 'SM',
            ),
            textDirection: TextDirection.rtl,
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(right: 25.0),
            width: 108.0,
            height: 26.0,
            decoration: BoxDecoration(
              color: pink,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 6.0),
                    child: Text(
                      'خبرگذاری آنلاین خبر',
                      style: TextStyle(
                        color: white,
                        fontFamily: 'SM',
                        fontSize: 8.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Image(
                    image: AssetImage(Asset.akharinKhabarLogo),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'پیشنهاد مونیوز',
            style: TextStyle(
              color: grey,
              fontSize: 10.0,
              fontFamily: 'SM',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Image.asset(Asset.flashCircle),
          ),
        ],
      ),
    );
  }
}
