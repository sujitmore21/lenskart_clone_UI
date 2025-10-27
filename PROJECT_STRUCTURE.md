# Project Structure

This document outlines the complete structure of the Lenskart Clone App.

## 📁 Directory Structure

```
lenskart_clon_app/
├── assets/
│   ├── fonts/              # Custom fonts (Roboto, Inter)
│   ├── images/            # Product images, logos, banners
│   └── icons/             # App icons
├── lib/
│   ├── core/              # Core app functionality
│   │   ├── constants/     # App-wide constants
│   │   │   ├── app_constants.dart
│   │   │   └── app_images.dart
│   │   ├── routes/        # Navigation
│   │   │   └── app_router.dart
│   │   ├── theme/         # Theming
│   │   │   ├── app_colors.dart
│   │   │   ├── app_text_styles.dart
│   │   │   └── app_theme.dart
│   │   └── utils/         # Utilities
│   │       ├── asset_helper.dart
│   │       ├── constants.dart
│   │       └── extensions.dart
│   ├── features/          # Feature modules (MVVM)
│   │   ├── home/
│   │   │   └── presentation/
│   │   │       └── views/
│   │   │           └── home_page.dart
│   │   ├── products/
│   │   │   ├── data/
│   │   │   │   └── repositories/
│   │   │   │       └── product_repository.dart
│   │   │   ├── domain/
│   │   │   │   └── models/
│   │   │   │       └── product_model.dart
│   │   │   └── presentation/
│   │   │       ├── viewmodels/
│   │   │       │   └── product_viewmodel.dart
│   │   │       └── views/
│   │   │           ├── product_list_page.dart
│   │   │           └── product_detail_page.dart
│   │   └── cart/
│   │       ├── domain/
│   │       │   └── models/
│   │       │       └── cart_item_model.dart
│   │       └── presentation/
│   │           ├── viewmodels/
│   │           │   └── cart_viewmodel.dart
│   │           └── views/
│   │               └── cart_page.dart
│   ├── shared/            # Shared resources
│   │   ├── services/
│   │   │   └── api_service.dart
│   │   └── widgets/
│   │       └── product_card.dart
│   └── main.dart          # App entry point
└── pubspec.yaml           # Dependencies
```

## 🏗️ Architecture Overview

### MVVM Pattern

```
┌─────────────────────────────────────────┐
│           Presentation Layer           │
│  (Views + ViewModels + Providers)      │
│                                         │
│  Views: UI Components                   │
│  ViewModels: Business Logic            │
│  Providers: Riverpod State             │
└─────────────────────────────────────────┘
                    ↕
┌─────────────────────────────────────────┐
│            Domain Layer                 │
│  (Models + Use Cases)                  │
│                                         │
│  Models: Data Structures                │
│  Use Cases: Business Rules             │
└─────────────────────────────────────────┘
                    ↕
┌─────────────────────────────────────────┐
│             Data Layer                  │
│  (Repositories + API Services)         │
│                                         │
│  Repositories: Data Access             │
│  API Services: Network Calls           │
└─────────────────────────────────────────┘
```

## 📦 Key Components

### Core Layer

**Constants** (`lib/core/constants/`)
- `app_constants.dart`: API URLs, storage keys, pagination settings
- `app_images.dart`: Centralized image path management

**Theme** (`lib/core/theme/`)
- `app_colors.dart`: Color scheme (primary, secondary, accents)
- `app_text_styles.dart`: Typography system
- `app_theme.dart`: Material theme configuration

**Routes** (`lib/core/routes/`)
- `app_router.dart`: GoRouter configuration for navigation

**Utils** (`lib/core/utils/`)
- `asset_helper.dart`: Dynamic asset loading
- `extensions.dart`: Dart extensions (DateTime, String, etc.)
- `constants.dart`: Common constants (padding, radius, etc.)

### Features

**Home Feature**
- Home page with banners, categories, and featured products

**Products Feature**
- Product listing with filtering
- Product detail page
- Search functionality
- Repository pattern for data access

**Cart Feature**
- Shopping cart management
- Add/remove/update quantities
- Total calculation

### Shared

**Services**
- `api_service.dart`: HTTP client setup with Dio

**Widgets**
- `product_card.dart`: Reusable product display card

## 🎨 Theme System

Colors are managed through `AppColors`:
- Primary: Blue (#2D5CFF)
- Secondary: Orange (#FF6B35)
- Category-specific colors
- Status colors (success, error, warning)

Text styles are centralized in `AppTextStyles`:
- Display styles (large, medium, small)
- Headline styles
- Body styles
- Price styles
- Custom styles

## 🔄 State Management

Riverpod providers are used for:
- Product list state (`productViewModelProvider`)
- Cart state (`cartViewModelProvider`)
- Future feature states

## 📱 Pages & Navigation

Routes defined in `app_router.dart`:
- `/home` - Home page
- `/products?category=X` - Product list
- `/product/:id` - Product detail
- `/cart` - Shopping cart

## 🚀 Getting Started

1. Install dependencies: `flutter pub get`
2. Add fonts to `assets/fonts/` (see README)
3. Add images to `assets/images/` (optional)
4. Run: `flutter run`

## 📝 Notes

- All assets are configured but use placeholders
- API service is set up but uses mock data
- Fonts need to be downloaded (see `assets/fonts/README.md`)
- Images have placeholders (see `assets/images/README.md`)

