# FormBuilder

A SwiftUI-based, protocol-driven dynamic form builder. Sections and fields are modeled as observable types that render their own SwiftUI views via protocol requirements, enabling flexible composition and reuse.

## Class Diagram

Below is the class diagram for the core architecture. If the image path differs in your environment, update the link accordingly.

<img src="https://github.com/bhaveshbc/DynamicFormBuilder/blob/main/FormBuilder/classDG.png" width="1000" height = "800" style="margin-top:20px; margin-right:50px;"/>

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


## Getting Started

1. Open the project in Xcode 15 or later.
2. Build and run the `FormBuilderApp` target.
3. The app launches into `AppFormView`, rendering sections and fields defined by `AppFormViewModel`.

