# Lenskart Clone App

A production-ready Flutter e-commerce application inspired by Lenskart, built with **MVVM architecture** and **Riverpod** for state management.

## 🏗️ Architecture

This project follows the **MVVM (Model-View-ViewModel)** architecture pattern:

```
lib/
├── core/                    # Core functionality
│   ├── constants/          # App-wide constants
│   ├── routes/             # Navigation configuration
│   ├── theme/              # App theme (colors, fonts, styles)
│   └── utils/              # Utility functions
├── features/               # Feature modules
│   ├── home/              # Home feature
│   ├── products/           # Products feature
│   └── cart/              # Cart feature
│       ├── data/           # Data layer (repositories, API)
│       ├── domain/        # Domain layer (models, use cases)
│       └── presentation/  # Presentation layer (views, viewmodels)
└── shared/                 # Shared resources
    ├── services/           # Shared services
    └── widgets/            # Reusable widgets
```

## 🚀 Features

- ✅ **MVVM Architecture** - Clean separation of concerns
- ✅ **Riverpod State Management** - Modern, type-safe state management
- ✅ **Modular Structure** - Feature-based organization
- ✅ **Theme System** - Customizable colors, fonts, and text styles
- ✅ **Dynamic Assets** - Centralized asset management
- ✅ **Routing** - GoRouter for navigation
- ✅ **Sample Pages** - Home, Product List, Product Detail, Cart

## 📦 Dependencies

- `flutter_riverpod` - State management
- `go_router` - Navigation
- `dio` - HTTP client
- `cached_network_image` - Image caching
- `equatable` - Value equality
- `intl` - Internationalization

## 🎨 Theme & Assets

### Colors
All colors are defined in `lib/core/theme/app_colors.dart`:
- Primary: Blue (#2D5CFF)
- Secondary: Orange (#FF6B35)
- Custom category colors for different product types

### Fonts
- **Roboto** - Primary font family
- **Inter** - Secondary font family

**Note**: Font files need to be added to `assets/fonts/`. See `assets/fonts/README.md` for instructions.

### Images
Placeholder images are configured. Replace with actual assets:
- Product images
- Category icons
- Banners
- Logo files

See `assets/images/README.md` for details.

## 🏃 Getting Started

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Add fonts** (optional):
   Download fonts from Google Fonts and place them in `assets/fonts/`
   Or modify `pubspec.yaml` to use system fonts

3. **Add images** (optional):
   Add your product images, logos, and banners to `assets/images/`
   The app will gracefully handle missing images

4. **Run the app:**
   ```bash
   flutter run
   ```

## 📱 Pages

### Home Page (`/home`)
- Banner carousel
- Category grid
- Featured products
- Bottom navigation

### Product List (`/products`)
- Grid layout
- Category filtering
- Search functionality

### Product Detail (`/product/:id`)
- Product images carousel
- Product information
- Add to cart functionality

### Cart (`/cart`)
- Cart items list
- Quantity management
- Total calculation
- Checkout (placeholder)

## 🔧 Configuration

### API Configuration
Update `lib/core/constants/app_constants.dart`:
```dart
static const String baseUrl = 'https://your-api-url.com';
```

### Theme Customization
Modify colors, fonts, and styles in:
- `lib/core/theme/app_colors.dart`
- `lib/core/theme/app_text_styles.dart`
- `lib/core/theme/app_theme.dart`

## 📝 Code Generation

If using code generation for JSON serialization:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🧪 Testing

Run tests:
```bash
flutter test
```

## 📄 License

This project is created for educational purposes.

## 🤝 Contributing

1. Follow MVVM architecture
2. Keep features modular
3. Use Riverpod for state management
4. Follow Flutter best practices

---

Built with ❤️ using Flutter
