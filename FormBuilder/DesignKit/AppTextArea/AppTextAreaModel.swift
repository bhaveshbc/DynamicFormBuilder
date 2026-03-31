import SwiftUI

@Observable class AppTextAreaModel: FormFieldModelType {
    let id: UUID
    var value: String
    let placeholder: String
    let minHeight: CGFloat

    init(id: UUID = UUID(), placeholder: String, value: String = "", minHeight: CGFloat = 120) {
        self.id = id
        self.placeholder = placeholder
        self.value = value
        self.minHeight = minHeight
    }

    func getView() -> some View {
        AppTextArea(self.placeholder, text: Binding(get: { self.value }, set: { self.value = $0 }), minHeight: self.minHeight)
    }
}
