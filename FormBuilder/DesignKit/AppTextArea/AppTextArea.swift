import SwiftUI

public struct AppTextArea: View {
    @Binding private var text: String
    private let placeholder: String
    private let minHeight: CGFloat
    
    public init(_ placeholder: String, text: Binding<String>, minHeight: CGFloat = 120) {
        self._text = text
        self.placeholder = placeholder
        self.minHeight = minHeight
    }
    
    public var body: some View {
        CardShadow {
            ZStack(alignment: .topLeading) {
                TextEditor(text: $text)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 8)
                    .frame(minHeight: minHeight)
                
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 12)
                }
            }
        }
    }
}

struct PreviewWrapper: View {
    @State var text1 = ""
    
    var body: some View {
        VStack {
            AppTextArea("Enter your comments...", text: $text1)
                .padding()
        }
    }
}

#Preview {

    PreviewWrapper()
}


