
import SwiftUI

public struct OnboardingView: View {
    public init() {}
    public var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(systemName: "music.quarternote.3").font(.system(size: 100.0)).foregroundColor(.purple)
                
                Text("Harmony").font(.system(size: 50.0))
                Text("This playground is made to help you understand the basics of music harmony in a simple way, explaining concepts like Notes, Intervals, Scales and Chords.").font(.system(size: 20.0)).multilineTextAlignment(.center)
                Spacer()
                NavigationLink("Click here and start now!", destination: NotesView())
                Spacer()
            }.padding()
        }.navigationViewStyle(StackNavigationViewStyle()).navigationBarHidden(true)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
