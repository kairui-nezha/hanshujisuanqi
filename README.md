# Scientific Calculator

A cross-platform scientific calculator application built using Flutter. This app supports both Android and Windows platforms and provides a responsive design for different screen sizes.

## Features

- Perform basic arithmetic operations: `+`, `-`, `×`, `÷`
- Support for scientific functions: `sin`, `cos`, `tan`, `log`, `ln`, `^`, `√`
- Clear (`AC`) and delete (`Del`) buttons
- Evaluate mathematical expressions with parentheses
- Function plotting feature for equations with variable `x`
- Responsive design for Android (portrait) and Windows (landscape)

## Screenshots

### Calculator Screen
![Calculator Screen](screenshots/calculator_screen.png)

### Graph Page
![Graph Page](screenshots/graph_page.png)

## Dependencies

The following dependencies are used in this project:

- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod): State management
- [math_expressions](https://pub.dev/packages/math_expressions): Parsing and evaluating mathematical expressions
- [fl_chart](https://pub.dev/packages/fl_chart): For plotting graphs

## Getting Started

1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```

2. Navigate to the project directory:
   ```bash
   cd scientific_calculator
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart
├── src/
│   ├── app.dart
│   ├── features/
│   │   ├── calculator/
│   │   │   ├── presentation/
│   │   │   │   ├── calculator_screen.dart
│   │   │   │   ├── graph_page.dart
│   │   │   │   └── widgets/
│   │   │   │       ├── display.dart
│   │   │   │       ├── keypad.dart
│   │   │   │       └── keypad_button.dart
│   │   │   ├── state/
│   │   │   │   ├── calculator_notifier.dart
│   │   │   │   ├── calculator_state.dart
│   │   │   │   └── calculator_logic.dart
```

## How to Use

### Calculator
1. Enter a mathematical expression using the keypad.
2. Press `=` to evaluate the expression.
3. Use `AC` to clear the input and result, or `Del` to delete the last character.

### Graph Page
1. Navigate to the Graph Page by clicking the corresponding button.
2. Enter a function with variable `x` (e.g., `x*x + 2`).
3. Press `Plot` to generate a graph for the function in the range `x = -10` to `x = 10`.

## License

This project is licensed under the MIT License. See the LICENSE file for details.