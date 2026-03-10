//
//  SingleSelectionList.swift
//  FormBuilder
//
//  Created by Bhavesh Chaudhari on 25/02/26.
//

import SwiftUI

public protocol SingleSelectionType: Identifiable & Hashable where ID == UUID {

    var title: String { get }
}

public struct SingleSelectionList<Item: SingleSelectionType>: View {
    public let items: [Item]

    @Binding private var selectedID: Item.ID?

    public init(items: [Item], selectedID: Binding<Item.ID?>) {
        self.items = items
        self._selectedID = selectedID
     
    }

    public var body: some View {
        
        CardShadow{
            VStack {
                ForEach(items) { item in
                    Button(action: { toggleSelection(item) }) {
                        HStack(spacing: 10) {
                            Image(systemName: isSelected(item) ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(isSelected(item) ? .blue : .gray)

                            Text(item.title)
                                .foregroundStyle(.primary)

                            Spacer()
                        }
                        
                    }
                    .buttonStyle(.plain)
                }    .background(Color.clear)

            }.padding(15)
        }

  }

    private func isSelected(_ item: Item) -> Bool {
        selectedID == item.id
    }

    private func toggleSelection(_ item: Item) {
        if isSelected(item) {
            selectedID = nil
        } else {
            selectedID = item.id
        }
    }
}

private extension Identifiable where Self: Hashable {
    var _idHashable: AnyHashable { AnyHashable(id) }
}

// MARK: - Preview
#Preview("SingleSelectionList") {
    @Previewable @State var selected: UUID? = nil
   

    let sample: [DemoItem] = [
        .init(id: UUID(), name: "Option A"),
        .init(id: UUID(), name: "Option B"),
        .init(id: UUID(), name: "Option C")
    ]
    NavigationStack {
        SingleSelectionList(items: sample, selectedID: $selected)
            .navigationTitle("Choose one")
    }
}

struct DemoItem: SingleSelectionType {
    let id: UUID
    let name: String
    
    var title: String { name }
}

