import SwiftUI
import Models
import Services

public struct NoteCircle: View {
    @Binding public var notes: [Note]
    func playNotes () {
        Keyboard().playNotes(notes)
    }
    public init(_ notes: Binding<[Note]>) {
        _notes = notes
    }
    public var body: some View {
        VStack{
            HStack{
                Spacer()
                
                ForEach(notes) {
                    note in Text(note.name).font(.title)
                }
                Spacer()
            }
            HStack {
                Image(systemName: "play.fill").foregroundColor(.blue)
                Button(notes.count > 1 ? "Play Notes" : "Play Note", action: playNotes)
            }
        }
    }
}
