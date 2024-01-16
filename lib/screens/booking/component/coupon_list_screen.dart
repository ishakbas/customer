import 'package:myservice_customer/component/base_scaffold_widget.dart';
import 'package:myservice_customer/component/loader_widget.dart';
import 'package:myservice_customer/main.dart';
import 'package:myservice_customer/model/service_detail_response.dart';
import 'package:myservice_customer/network/rest_apis.dart';
import 'package:myservice_customer/screens/booking/component/coupon_card_widget.dart';
import 'package:myservice_customer/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../component/empty_error_state_widget.dart';
import '../../../model/coupon_list_model.dart';

class CouponsScreen extends StatefulWidget {
  final int serviceId;
  final CouponData? appliedCouponData;
  final num? servicePrice;
  CouponsScreen({required this.serviceId, this.servicePrice, this.appliedCouponData});

  @override
  _CouponsScreenState createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
  Future<CouponListResponse>? future;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init({Map? req}) async {
    future = getCouponList(serviceId: widget.serviceId);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: language.coupons,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.height,
          Text(language.lblAvailableCoupons, style: boldTextStyle(size: LABEL_TEXT_SIZE)).paddingSymmetric(horizontal: 16),
          SnapHelperWidget<CouponListResponse>(
            future: future,
            initialData: cachedNotificationList,
            loadingWidget: LoaderWidget(),
            errorBuilder: (error) {
              return NoDataWidget(
                title: error,
                imageWidget: ErrorStateWidget(),
                retryText: language.reload,
                onRetry: () {
                  appStore.setLoading(true);

                  init();
                  setState(() {});
                },
              );
            },
            onSuccess: (couponsRes) {
              return AnimatedListView(
                shrinkWrap: true,
                itemCount: couponsRes.validCupon.length,
                slideConfiguration: sliderConfigurationGlobal,
                listAnimationType: ListAnimationType.FadeIn,
                fadeInConfiguration: FadeInConfiguration(duration: 2.seconds),
                emptyWidget: NoDataWidget(
                  title: language.noNotifications,
                  subTitle: language.noNotificationsSubTitle,
                  imageWidget: EmptyStateWidget(),
                ),
                onSwipeRefresh: () {
                  appStore.setLoading(true);

                  init();
                  setState(() {});
                  return 2.seconds.delay;
                },
                itemBuilder: (context, index) {
                  CouponData data = couponsRes.validCupon[index];
                  if (widget.appliedCouponData != null && widget.appliedCouponData!.code == data.code) {
                    data.isApplied = widget.appliedCouponData!.isApplied;
                  }
                  return CouponCardWidget(data: data, servicePrice: widget.servicePrice).paddingOnly(top: 16);
                },
              );
            },
          ).paddingSymmetric(horizontal: 8),
        ],
      ),
    );
  }
}
