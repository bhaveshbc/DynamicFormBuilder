# FormBuilder

A SwiftUI-based, protocol-driven dynamic form builder. Sections and fields are modeled as observable types that render their own SwiftUI views via protocol requirements, enabling flexible composition and reuse.

## Class Diagram

Below is the class diagram for the core architecture. If the image path differs in your environment, update the link accordingly.

![Class Diagram](file:///Users/bhaveshchaudhari/Downloads/FormFieldModelType%20Value-2026-03-10-085250.png)

## Architecture Overview

- **Protocol-driven models**
  - `FormFieldModelType`: Describes a form field model that owns its `value` and can render a SwiftUI view via `getView()`.
  - `FormSectionModelType`: Describes a section model that owns a `value`, a collection of `fields`, and can render a SwiftUI header via `getView()`.
- **Concrete section**
  - `AppTextSection`: An `@Observable` section that displays a textual header and aggregates heterogeneous `FormFieldModelType` fields.
- **Form rendering**
  - `AppFormView`: Renders a SwiftUI `Form` from an `AppFormViewModel` by iterating over `sections` and each section's `fields`, calling `getView()` for both headers and fields. Includes a Submit button that triggers `viewModel.printFormData()`.
- **Selection utility**
  - `SingleSelectionType` and `SingleSelectionList`: A generic, reusable single-select list component used by field models like `AppSingleSelectionModel`.

## Key Types

- `FormFieldModelType` (protocol)
- `FormSectionModelType` (protocol)
- `AppTextSection` (concrete section)
- `AppFormViewModel` (view model; maintains `sections` and exposes `printFormData()`)
- `AppFormView` (SwiftUI view rendering the dynamic form)
- `AppTextFieldModel` (field model; text input)
- `AppSingleSelectionModel` (field model; single selection)
- `SingleSelectionType` / `SingleSelectionList` (selection utilities)

## Getting Started

1. Open the project in Xcode 15 or later.
2. Build and run the `FormBuilderApp` target.
3. The app launches into `AppFormView`, rendering sections and fields defined by `AppFormViewModel`.

## Configuration

`DynamicFormConfig` controls per-row insets and background color:

```swift
struct DynamicFormConfig {
    var rowInset: EdgeInsets
    var backgroundColor: Color
}
