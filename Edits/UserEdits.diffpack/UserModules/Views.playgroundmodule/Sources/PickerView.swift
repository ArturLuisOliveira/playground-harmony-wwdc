import SwiftUI
import Models

public struct PickerView<T:Selectable>: View {
    @State var label: String
    @Binding var selected: T
    @Binding var options: [T]
    @Binding var getOptionLabel: (T) -> String
    
    public init(label: String, selected: Binding<T>, options:Binding<[T]>, getOptionLabel:Binding<(T) -> String>){
        self._selected = selected
        self._options = options
        self._getOptionLabel = getOptionLabel
        self._label = State(initialValue: label)
    }
    public var body: some View {
        HStack{
            
            
            Text(label).font(.body)
            Picker("Note selector", selection: $selected, content: {
                ForEach(options){
                    option in Text(getOptionLabel(option)).tag(option)
                }
            })
        }.padding(.horizontal, 100)
    }
}
