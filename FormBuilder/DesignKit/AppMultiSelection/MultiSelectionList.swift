import SwiftUI



public struct MultiSelectionList<Item: SingleSelectionType>: View {
    public let items: [Item]
    @Binding private var selectedIDs: Set<Item.ID>
    
    public init(items: [Item], selectedIDs: Binding<Set<Item.ID>>) {
        self.items = items
        self._selectedIDs = selectedIDs
    }
    
    public var body: some View {
        CardShadow {
            VStack(spacing: 0) {
                ForEach(items) { item in
                    Button(action: {
                        toggleSelection(item)
                    }) {
                        HStack(spacing: 10) {
                            Image(systemName: isSelected(item) ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(isSelected(item) ? .accentColor : .secondary)
                            Text(item.title)
                                .foregroundColor(.primary)
                            Spacer()
                        }
                        .padding(.vertical, 10)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(15)
            .background(Color.clear)
        }
    }
    
    private func isSelected(_ item: Item) -> Bool {
        selectedIDs.contains(item.id)
    }
    
    private func toggleSelection(_ item: Item) {
        if isSelected(item) {
            selectedIDs.remove(item.id)
        } else {
            selectedIDs.insert(item.id)
        }
    }
}



//struct MultiSelectionList_Previews: PreviewProvider {
//    @State static var selected: Set<UUID> = []
//    
//    static var previews: some View {
//        MultiSelectionList(items: [
//            DemoItem(id: <#T##UUID#>, name: <#T##String#>)(title: "First"),
//            DemoMultiItem(title: "Second"),
//            DemoMultiItem(title: "Third")
//        ], selectedIDs: $selected)
//        .padding()
//        .previewDisplayName("MultiSelectionList")
//    }
//}




