import 'package:benta/Features/Auth/presentation/views/forget_password.dart';
import 'package:benta/Features/Auth/presentation/views/rest_password_view.dart';
import 'package:benta/Features/Auth/presentation/views/sign_in.dart';
import 'package:benta/Features/Auth/presentation/views/sign_up_view.dart';
import 'package:benta/Features/Auth/presentation/views/verification_view.dart';
import 'package:benta/Features/Favourite/presentation/views/fav_view.dart';
import 'package:benta/Features/Home/presentation/views/home.dart';
import 'package:benta/Features/Cart/presentation/item_info_view.dart';
import 'package:benta/Features/Cart/presentation/my_cart_view.dart';
import 'package:benta/Features/Notification/presentation/views/notification_view.dart';
import 'package:benta/Features/OnBoarding/onboarding_screen.dart';
import 'package:benta/Features/Order/presentation/views/order_view.dart';
import 'package:benta/Features/Profile/presentation/edit_profile_view.dart';
import 'package:benta/Features/Profile/presentation/profile_view.dart';
import 'package:benta/Features/Splash/presentation/logo.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnBoardingView = '/onBoardingView';
  static const kLoginView = '/Loginview';
  static const kForgetPasswordView = '/ForgetPasswordView';
  static const kVerificataionView = '/VerificataionView';
  static const kResetPasswordView = '/ResetPasswordView';
  static const kSignUpView = '/SignUpView';
  static const kHomeView = '/HomeView';
  static const kItemInfoView = '/ItemInfoView';
  static const kMyCartView = '/MyCartView';
  static const kProfileView = '/kProfileView';
  static const kOrderView = '/kOrderView';
  static const kFavouriteView = '/kFavouriteView';
  static const kNotificationView = '/kNotificationView';
  static const kEditProfileView = '/kEditProfileView';
  static const kChooseNotificationView = '/kChooseNotificationView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: ((context, state) => const SplashView())),
      GoRoute(
        path: kOnBoardingView,
        builder: ((context, state) => const OnboardingView()),
      ),
      GoRoute(
        path: kLoginView,
        builder: ((context, state) => const SignInView()),
      ),
      GoRoute(
        path: kForgetPasswordView,
        builder: ((context, state) => const ForgetPasswordView()),
      ),
      GoRoute(
        path: kVerificataionView,
        builder: ((context, state) => const VerificationView()),
      ),
      GoRoute(
        path: kResetPasswordView,
        builder: ((context, state) => RestPasswordView()),
      ),
      GoRoute(
        path: kSignUpView,
        builder: ((context, state) => const SignUpView()),
      ),
      GoRoute(path: kHomeView, builder: ((context, state) => const HomeView())),
      GoRoute(
        path: kItemInfoView,
        builder: ((context, state) => const ItemInfoView()),
      ),
      GoRoute(
        path: kMyCartView,
        builder: ((context, state) => const MyCartView()),
      ),
      GoRoute(
        path: kOrderView,
        builder: ((context, state) => const OrderView()),
      ),
      GoRoute(
        path: kFavouriteView,
        builder: ((context, state) => const FavouriteView()),
      ),
      GoRoute(
        path: kProfileView,
        builder: ((context, state) => const ProfileView()),
      ),
      GoRoute(
        path: kNotificationView,
        builder: ((context, state) => const NotificationView()),
      ),
      GoRoute(
        path: kEditProfileView,
        builder: ((context, state) => const EditProfileView()),
      ),
      GoRoute(
        path: kChooseNotificationView,
        builder: ((context, state) => const NotificationView()),
      ),
    ],
  );
}
