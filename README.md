
# Flutter GetX Template

Flutter Getx template to make starting project fast and easy
.

## Introduction

We all face the same problem when we want to start a new project we have to take care of some repeatable things such as
- Theme (light/dark) & store current theme in shared pref 🌒
- Localization & store the current locale in shared pref 🅰️
- Firebase Messaging 📨
- Notifications setup 🔔
- Safe api requests & error handling 🔏
- Changing between widgets during api call (loading,success,failed..etc) 😴
- Snackbar,Toasts & in app notifications 🪖
- Making app more responsive and stop font scaling ⚖️
  This project will take care of all this repeatable things so you can start your project in few steps and you will have all the mentioned points set up and ready to use 😎

## Acknowledgment
Project was created using [get_cli](https://pub.dev/packages/get_cli) which is a great tool helping you to (start project,create screens/controllers, handling DI)..etc and we will list other packages that helped to create this skeleton
- [GetX](https://pub.dev/packages/get) for state management,navigation,managing dependencies..etc
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) to make app more responsive
- [hive](https://pub.dev/packages/hive) as local database
- [get_storage](https://pub.dev/packages/get_storage) as shared pref (its more easy and it read data sync)
- [awesome_notifications](https://pub.dev/packages/awesome_notifications) for local notification
## Clone and start project
Before discovering folders lets first perform some actions to make the project ready to launch
- first run this command it will generate hive type adapters (for our custom classes that we want to store locally)

    ```
    flutter packages pub run build_runner build --delete-conflicting-outputs
    ```
  if you don't want to use hive comment this line in main.dart

    ```dart
    await MyHive.init(adapters: [UserModelAdapter()]);
    ```
- To make your app responsive and look exactly as your (xd,figma..etc) design you need to set artbord size for flutter_ScreenUtil in main.dart
    ```dart
    ScreenUtilInit(
      designSize: const Size(375, 812), // change this to your xd artboard size
    ```
- FCM & Awesome Notifications are combined at the same class so when ever you connect your app to firebase your app will be ready to receive notifications you don't need to do anything except sending fcm notification to your api via implementing the method (sendFcmTokenToServer) which is inside FcmHelper class 😎
    ```dart
    static _sendFcmTokenToServer(){
        var token = MySharedPref.getFcmToken();
        // TODO SEND FCM TOKEN TO SERVER
    }
    ```
- Change app package name
    ```
    flutter pub run change_app_package_name:main com.new.package.name
    ```
- Change app name
    ```
    flutter pub run rename_app:main all="My App Name"
    ```
- Change app launch icon (replace assets/images/app_icon.png with your app icon) then run this command
    ```
    flutter pub run flutter_launcher_icons:main
    ```
- Change app splash screen (replace assets/images/splash.png with your app splash logo) then run this command
   ```
   flutter pub run flutter_native_splash:create
   ```
- FCM: firebase has recently added (add flutter app) to your firebase which will make adding our flutter(android/ios) app to firebase take only 2 steps 🔥 but first you need to download [Firebase CLI](https://firebase.google.com/docs/cli?authuser=0&hl=en#install_the_firebase_cli) and in the terminal execute:
    ```
    dart pub global activate flutterfire_cli
    ```
  then follow the firebase guid you will get command similar to this one
    ```
    flutterfire configure --project=flutter-firebase-YOUR_PROJECT_ID
    ```
  and that's it! your project is now connected to firebase and fcm is up and ready to get notifications
## Quick Start
- Responsive app: to make your app responsive you need to get advantage of using flutter_ScreenUtil so instead of using normal double values for height,width,radius..etc you need to use it like this
-
```dart
200.w // adapted to screen width
100.h // /Adapted to screen height
25.sp // adapter font size
10.r // adapter radius
// Example
Container(
    height: 100.h,
    width: 200.w,
    child: Text("Hello",style: TextStyle(fontSize: 20.sp,))
)
```

- Theme
  - Change theme

      ```dart
      MyTheme.changeTheme();
      ```

  - Check current theme

      ```dart
      bool isThemeLight = MyTheme.getThemeIsLight();
      ```

- Localization
  - Change app locale

      ```dart
      LocalizationService.updateLanguage('en');
      ```

  - Get current locale

      ```dart
      LocalizationService.getCurrentLocal();
      ```

  - Use translation

      ```dart
      Text(Strings.hello.tr)
      ```

  
## Discovering Project
After setting up all the needed thing now lets talk about folder structure which is mainly based on Getx Pattern and there are some personal opinions, if you open your lib folder you will find those folders

```
.
└── lib
    ├── app
    │   ├── components
    │   ├── data
    │   │   ├── local
    │   │   └── models
    │   ├── modules
    │   │   └── home
    │   ├── routes
    │   └── services
    ├── config
    │   ├── theme
    │   └── translation
    └── utils
```

- app: will contain all our core app logic
  - components: will contain all the shared UI widgets
  - data: will contain our models and local data sources (local db & shared pref)
  - modules: app screens
  - routes: generated by get_cli and it will contain our navigation routes
  - services: contain all logic for making safe & clean api calls
- config: will contain app config such as themes, localization services
- utils: for our helper classes
## Features
- Theme: if you opened theme package you will see those files

    ```
    └── theme
        ├── dark_theme_colors.dart
        ├── light_theme_colors.dart
        ├── my_fonts.dart
        ├── my_styles.dart
        └── my_theme.dart
   
    ```

  you only need to change app colors (light/dark_theme_colors) and if you want to change app fonts sizes and family just modify my_fonts.dart and that is it you don't need to worry about styles and theme you only need to edit my_syles.dart if you want to change some element theme data (padding,border..etc) and if you want to change theme just use this code

    ```dart
    // change theme and save current theme state to shared pref
    MyTheme.changeTheme();
    ```

  and if you want to check if the theme is dark/light just use
    ```dart
    bool themeIsLight = MyTheme.getThemeIsLight();
    // OR
    bool themeIsLight = MySharedPref.getThemeIsLight();
    ```
- Localization/translation we will use getx localization system which in the normal case code would look something like this

    ```dart
    class LocalizationService extends Translations {
        @override
        Map<String, Map<String, String>> get keys => {
            'en_US': { 'hello' : 'Hello' },
            'ar_AR': { 'hello' : 'مرحباً' },
        };
    }

    Text('hello'.tr); // translated text 
  ```

  but because we have so many words to translate we will separate keys file (strings_enum.dart) and languages map into different classes so code will become like this

  ```dart
  class LocalizationService extends Translations {
        @override
        Map<String, Map<String, String>> get keys => {
            'en_US': enUs,
            'ar_AR': arAR,
        };
    }
  // keys
  class Strings {
      static const String hello = 'hello';
  }
  // english words
  const Map<String, String> enUs = {
      Strings.hello : 'Hello',
  }
  // arabic translate
  final Map<String, String> arAR = {
      Strings.hello : 'مرحبا',
  }
  //result
  Text(Strings.hello.tr)
  ```

  and that explain why we have this file structure inside our translation package

     ```
        └── translations
            ├── ar_Ar
            │   └── ar_ar_translation.dart
            ├── en_US
            │   └── en_us_translation.dart
            ├── localization_service.dart
            └── strings_enum.dart
     ```

  to change language you will use

    ```dart
    LocalizationService.updateLanguage('en');
    ```

  and to get the current locale/language you can use

    ```dart
    LocalizationService.getCurrentLocal();
    // OR
    MySharedPref.getCurrentLocal();
    ```

**API CALLING**


**GET**

**CHANG THE HEADER in the DIO_CLIENT.DART file according to you >> "defaultHeader" to "secureHeader" . in MULTIPART "defaultMultipartHeader" to "secureMultipartHeader"**

```dart
   getPostDetail(int? id) async {
  showLoading();
  var response = await DioClient()
          .get(url: "${ApiUrl.postDetail}$id")
          .catchError(handleError);

  if (response == null) return;

  title = response["title"].toString();
  body = response["body"].toString();
  hideLoading();
  Get.to(() => const PostDetailView(), binding: HomeBinding());
}
```

**POST**

```dart
  createAward(int? employeeID, int? awardTypeID, String? date, String? gift,
      String? description) async {
    var request = {
      "employee_id": employeeID,
      "award_type": awardTypeID,
      "date": date,
      "gift": gift,
      "description": description,
    };
    showLoading();
    var response = await DioClient()
        .post(
          url:  ApiUrl.createHrAward,
            
           body: request)
        .catchError(handleError);
    if (response == null) return;

  createAwardKey.currentState!.save();

  //reload();
  hideLoading();

  Get.back();
    await getAwardList();
  }
```
**MULTIPART**

```dart
  updateProfile([String? filePath]) async {
  var request = {
  "name": editNameController.text,
  "email": editMailController.text,
  };
  showLoading();
  var response = await DioClient()
  .multipartSingleFile(
  url: ApiUrl.updateProfile,
 
 body: request,
 filepath: filePath,
 key: "profile")
  .catchError(handleError);
    if (response == null) return;

  profileEditKey.currentState!.save();
    //reload();
    await MySharedPref.removeUserAvatar();
    await MySharedPref.removeName();
    await MySharedPref.removeEmail();
    //
    await MySharedPref.setUserAvatar(response["data"]["profile"]);
    await MySharedPref.setName(editNameController.text);
    await MySharedPref.setEmail(editMailController.text);
    await MySharedPref.getUserAvatar();
    await MySharedPref.getName();
    await MySharedPref.getEmail();

  update();
  hideLoading();

  Get.back();
  }
```
}
```


```

## Support

For support, email mirmoktadir@gmail.com or Facebook [Mir Moktadir](https://www.facebook.com/moktadir91/).
