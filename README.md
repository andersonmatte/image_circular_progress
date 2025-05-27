# image_circular_progress

A custom Flutter widget that displays a circular progress indicator with a center image. Ideal for loading screens with branding or custom visuals.

![image_circular_progress example](https://raw.githubusercontent.com/andersonmatte/image_circular_progress/main/screenshots/demo.gif)

![Flutter Version](https://img.shields.io/badge/flutter-%E2%89%A53.0.0-blue)
![Pub Version](https://img.shields.io/pub/v/image_circular_progress.svg)
![License](https://img.shields.io/badge/license-MIT-green)

---

## 🚀 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
image_circular_progress: ^1.0.0

```

## 🚀 How to Use

Import in your Dart code:

```
import 'package:image_circular_progress/image_circular_progress.dart';
```

## 💡 Features

- Circular indicator with set or unset value.
- Customizable center image.
- Heartbeat animation (optional).
- Color, size, and thickness settings.
- Accessibility support.

## ✨Demos

<img src="https://raw.githubusercontent.com/andersonmatte/image_circular_progress/refs/heads/master/assets/example.png" width="390" height="844" alt="Demo do ImageCircularProgress" />

✅ Example

```dart
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Image Circular Progress')),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: _loading
            ? Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Loading...',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ImageCircularProgress(
              value: null,
              centerImage: Image.asset('logo.png'),
              size: 100,
              color: Colors.orangeAccent,
              backgroundColor: Colors.grey.shade300,
              strokeWidth: 6.0,
              semanticsLabel: 'Progress indicator',
              pulseOpacity: true,
            ),
          ],
        )
            : const Text(
          'Content loaded successfully!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
```

## 🤝 Contributing

Contributions are welcome! Open an issue or submit a pull request:
https://github.com/andersonmatte/image_circular_progress

## 👨‍💻 Author

Anderson Matte
[GitHub](https://github.com/andersonmatte/) | [LinkedIn](https://www.linkedin.com/in/andersonmatte/)

## 📝 License

This project is licensed under the MIT License. See the LICENSE file for more details.