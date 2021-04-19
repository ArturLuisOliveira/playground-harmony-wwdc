import SwiftUI

public struct EndingView: View {
    public var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(systemName: "checkmark.seal.fill").font(.system(size: 100.0)).foregroundColor(.green)
                
                Text("Congratulations!").font(.system(size: 50.0))
                Text("You learned the basics of music harmony. Probably you realized that harmony and notes don't came out of nowhere and the logic behind it ain't so complicated and misterious.").font(.system(size: 20.0)).multilineTextAlignment(.center)
                Spacer()
                NavigationLink("Repeat Lessons", destination: NotesView())
                Spacer()
            }.padding()
        }.navigationViewStyle(StackNavigationViewStyle()).navigationBarHidden(true)
    }
}
