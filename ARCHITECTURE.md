# GetX Modular + GetX CLI Architecture

This app follows **GetX modular** structure with **GetX CLI** for code generation. Every feature is a self-contained **module** with its own bindings, controllers, and views.

---

## Principles

- **Modular**: Each feature lives under `app/modules/<feature>/` with its own binding, controller(s), and view(s).
- **Route-first**: Every screen is a named route. Use `Get.toNamed(Routes.XXX)` or `Get.offNamed()`.
- **Binding = DI**: Each `GetPage` has a `Binding` that registers the controllers for that route via `Get.lazyPut` (or `Get.put`).
- **Single entry**: App entry is `GetMaterialApp` with `getPages: AppPages.routes` and `initialRoute`.

---

## Folder Structure

```
lib/
├── main.dart                 # Bootstrap: bindings, runApp(MyApp())
├── my_app.dart               # GetMaterialApp, theme, locale, getPages, initialRoute
│
├── app/
│   ├── routes/
│   │   ├── app_pages.dart    # List of GetPage (page + binding); part 'app_routes.dart'
│   │   └── app_routes.dart   # Routes.* and _Paths.* (DO NOT EDIT if using get_cli)
│   │
│   ├── modules/              # Feature modules (one folder per feature)
│   │   ├── onboarding/
│   │   │   ├── bindings/
│   │   │   ├── controllers/
│   │   │   ├── views/
│   │   │   └── model/        # optional, module-specific models
│   │   ├── auth/
│   │   ├── dashboard/
│   │   ├── live_class/
│   │   └── example/
│   │       ├── home-with-restAPI/
│   │       └── home-with-graphql/
│   │
│   ├── components/           # Shared UI and shell (e.g. navbar)
│   │   ├── navbar/
│   │   │   ├── navbar_binding.dart
│   │   │   ├── navbar_controller.dart
│   │   │   ├── fixed_bottom_navbar.dart
│   │   │   └── floating_bottom_navbar.dart
│   │   └── global-widgets/
│   │
│   ├── data/                 # App-wide data layer
│   │   └── local/            # SharedPref, Hive, etc.
│   │
│   └── service/              # App-wide services (no UI)
│       ├── REST/             # DioClient, api_header, api_urls
│       ├── graphQL/
│       ├── handler/          # exception_handler
│       └── helper/
│
├── config/
│   ├── theme/
│   └── translations/
│
└── utils/                    # Helpers, constants, device info, etc.
```

---

## Module Structure (GetX CLI style)

Each module has:

| Folder / File   | Role |
|-----------------|------|
| `bindings/<name>_binding.dart` | Implements `Bindings`; in `dependencies()` use `Get.lazyPut<XController>(() => XController())` for that route’s controllers. |
| `controllers/<name>_controller.dart` | Extends `GetxController` (or `GetxController with ExceptionHandler`). Holds state (`.obs`) and business logic. |
| `views/<name>_view.dart` | UI only. Prefer `GetView<MyController>` so `controller` is available. Use `Obx()` for reactive UI. |
| `model/` (optional) | Module-specific DTOs / models. |

- **Views** must not create controllers; the **Binding** does that.
- **Controllers** call **services** (e.g. `DioClient`, `GraphQLService`) or repositories; keep UI logic in the view.

---

## Routing

- **Definitions**: Route names and path constants live in `app_routes.dart` (`Routes.*`, `_Paths.*`). If using GetX CLI, this file is generated — avoid editing by hand.
- **Registration**: In `app_pages.dart`, each route is a `GetPage(name: _Paths.XXX, page: () => XxxView(), binding: XxxBinding())`.
- **Navigation**:
  - `Get.toNamed(Routes.HOME)` or `Get.toNamed(AppPages.HOME)`
  - `Get.offNamed(Routes.AUTH)` to replace current route
  - With arguments: `Get.toNamed(Routes.POST_DETAIL, arguments: {'id': id})`

Ensure every constant in `Routes` has a matching `GetPage` in `AppPages.routes`.

---

## Dependency Injection (GetX)

- **Bindings** are the place to register controllers for a route: use `Get.lazyPut` so the controller is created when the route is first opened.
- Prefer **lazyPut** so dependencies are created only when needed.
- To use a controller from a **parent route** (e.g. navbar that hosts multiple tabs), the parent page’s binding can register all tab controllers so they stay alive while that route is active.
- **Services** (e.g. `DioClient`) can be used directly from controllers (no need to put them in bindings unless you want a single instance app-wide; then use `Get.put` in a binding or in `main`).

---

## HTTP & API (this project)

- **REST**: Use `DioClient().request(method: HttpMethod.get, url: url, queryParams: params, body: body)`. No convenience methods; one entry point. For **multipart**, build `FormData` and pass as `body`. For **download**, use `DioClient().download(url: url, savePath: savePath)`.
- **GraphQL**: Use `GraphQLService` from `app/service/graphQL/`.
- Controllers call these services directly; optional next step is to introduce a **repository** per feature that wraps API calls.

---

## Conventions

1. **Naming**: `XxxBinding`, `XxxController`, `XxxView`, `Routes.XXX`, `_Paths.XXX`.
2. **Initial route**: Set in `my_app.dart` via `initialRoute: AppPages.FIXED_NAV` (or the desired entry route).
3. **No global `Get.put(Controller)`** in helpers or utils. Use `Get.isRegistered<X>()` then `Get.find<X>()` if you need a controller from a service (e.g. connectivity); the controller should already be created by a binding when the user is on that route.
4. **Shared widgets**: Put in `app/components/` (e.g. `global-widgets`, `navbar`). Use `GetView<Controller>` only when the widget needs a specific controller; otherwise use stateless widgets and pass data via parameters.

---

## GetX CLI (optional)

If you use [get_cli](https://pub.dev/packages/get_cli):

- Generate module: `get create page:feature_name` (creates binding, controller, view and can update routes).
- Keep `app_routes.dart` as generated; add new `GetPage` entries in `app_pages.dart` if not auto-added.

This keeps route names and paths consistent and aligns the codebase with GetX modular + GetX CLI.
