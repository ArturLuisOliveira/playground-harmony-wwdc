import SwiftUI

public struct FooterNavigation<T:View,U:View>: View {
    @State var previousView: T?
    @State var nextView: U?
    @State var previousLabel: String?
    @State var nextLabel: String?
    public init(previousView: T? = nil, nextView: U? = nil, previousLabel: String? = nil, nextLabel: String? = nil) {
        if previousView != nil {
            _previousView = State(initialValue: previousView)
        }
        if nextView != nil {
            _nextView = State(initialValue: nextView)
        }
        if previousLabel != nil {
            _previousLabel = State(initialValue: previousLabel)
        }
        if nextLabel != nil {
            _nextLabel = State(initialValue: nextLabel)
        }
    }
    
    public var body: some View {
        HStack{
            Spacer()
            if(previousView != nil && previousLabel != nil){
                HStack{
                    Image(systemName: "chevron.left").foregroundColor(.blue)
                    NavigationLink("Previous: \(previousLabel ?? "")", destination: previousView)
                    
                }
            } else {
                Text("      ")
            }
            Spacer()
            if(nextView != nil && nextLabel != nil) {
                HStack {
                    NavigationLink("Next: \(nextLabel ?? "")", destination: nextView)
                    Image(systemName: "chevron.right").foregroundColor(.blue)
                }
            } else {
                Text("      ")
            }
            Spacer()
            
        }.padding(.bottom, 50)
    }
}
