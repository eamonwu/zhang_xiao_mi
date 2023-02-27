import 'package:account_book/app/modules/account_manage_module/binding.dart';
import 'package:account_book/app/modules/account_manage_module/view.dart';
import 'package:account_book/app/modules/book_module/binding.dart';
import 'package:account_book/app/modules/book_module/view.dart';
import 'package:account_book/app/modules/budget_manage_module/binding.dart';
import 'package:account_book/app/modules/budget_manage_module/view.dart';
import 'package:account_book/app/modules/custom_tag_module/binding.dart';
import 'package:account_book/app/modules/custom_tag_module/view.dart';
import 'package:account_book/app/modules/incentive_plan_module/binding.dart';
import 'package:account_book/app/modules/incentive_plan_module/view.dart';
import 'package:account_book/app/modules/statistic_module/binding.dart';
import 'package:account_book/app/modules/statistic_module/view.dart';
import 'package:account_book/app/modules/user_panel_module/binding.dart';
import 'package:account_book/app/modules/user_panel_module/view.dart';
import 'package:get/get.dart';

part './app_routes.dart';
/**
 * GetX Generator - fb.com/htngu.99
 * */

abstract class AppPages {
  static final pages = [
    // GetPage(
    //   name: Routes.ACCOUNT_BOOK,
    //   page: () => AccountBookPage(),
    //   binding: AccountBookBinding(),
    // ),
    GetPage(
      name: Routes.STATISTIC,
      page: () => StatisticModulePage(),
      binding: StatisticModuleBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.BOOK,
      page: () => BookModulePage(),
      binding: BookModuleBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.CUSTOM_TAG,
      page: () => CustomTagModulePage(),
      binding: CustomTagModuleBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.ACCOUNT_MANAGE,
      page: () => AccountManageModulePage(),
      binding: AccountManageModuleBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.INCENTIVE_PLAN,
      page: () => IncentivePlanModulePage(),
      binding: IncentivePlanModuleBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.BUDGET_MANAGE,
      page: () => BudgetManageModulePage(),
      binding: BudgetManageModuleBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.USER_PANEL,
      page: () => UserPanelModulePage(),
      binding: UserPanelModuleBinding(),
      transition: Transition.noTransition,
    ),
  ];
}
