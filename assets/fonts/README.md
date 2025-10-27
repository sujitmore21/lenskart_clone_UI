# Fonts Directory

This directory should contain the following font files:

## Roboto Font Family
- `Roboto-Regular.ttf`
- `Roboto-Medium.ttf` (weight: 500)
- `Roboto-Bold.ttf` (weight: 700)

## Inter Font Family
- `Inter-Regular.ttf`
- `Inter-Medium.ttf` (weight: 500)
- `Inter-SemiBold.ttf` (weight: 600)
- `Inter-Bold.ttf` (weight: 700)

## Getting Fonts

You can download these fonts from:
- **Roboto**: https://fonts.google.com/specimen/Roboto
- **Inter**: https://fonts.google.com/specimen/Inter

Or use the following commands:

```bash
# Download Roboto
curl -o assets/fonts/Roboto-Regular.ttf https://github.com/google/fonts/raw/main/apache/roboto/Roboto-Regular.ttf
curl -o assets/fonts/Roboto-Medium.ttf https://github.com/google/fonts/raw/main/apache/roboto/Roboto-Medium.ttf
curl -o assets/fonts/Roboto-Bold.ttf https://github.com/google/fonts/raw/main/apache/roboto/Roboto-Bold.ttf

# Download Inter
curl -o assets/fonts/Inter-Regular.ttf https://github.com/google/fonts/raw/main/ofl/inter/Inter-Regular.ttf
curl -o assets/fonts/Inter-Medium.ttf https://github.com/google/fonts/raw/main/ofl/inter/Inter-Medium.ttf
curl -o assets/fonts/Inter-SemiBold.ttf https://github.com/google/fonts/raw/main/ofl/inter/Inter-SemiBold.ttf
curl -o assets/fonts/Inter-Bold.ttf https://github.com/google/fonts/raw/main/ofl/inter/Inter-Bold.ttf
```

Alternatively, if you want to use system fonts, you can modify `pubspec.yaml` to remove the custom fonts section and use Flutter's default fonts.

