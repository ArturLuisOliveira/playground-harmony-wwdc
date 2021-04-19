
import SwiftUI

public struct DescriptionView:View {
    public var text: String
    public init(_ text: String) {
        self.text = text
    }
    public var body: some View {
        HStack{
            Text(text).font(.title2).padding()
            Spacer()
        }
    }
}
