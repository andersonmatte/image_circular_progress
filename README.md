# image_circular_progress

A custom Flutter widget that displays a circular progress indicator with a center image. Ideal for loading screens with branding or custom visuals.

![image_circular_progress example](https://raw.githubusercontent.com/andersonmatte/image_circular_progress/main/screenshots/demo.gif)

## 💡 Features

- Circular indicator with set or unset value.
- Customizable center image.
- Heartbeat animation (optional).
- Color, size, and thickness settings.
- Accessibility support.

## 🛠️ Usage

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