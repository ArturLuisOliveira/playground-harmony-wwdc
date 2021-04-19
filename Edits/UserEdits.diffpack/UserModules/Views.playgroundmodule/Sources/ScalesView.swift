

import SwiftUI
import Models

public struct ScalesView: View {
    @State private var notes: [Note]
    @State private var selectedNote: Note
    @State private var selectedNotes: [Note]
    @State private var getOptionLabel: (Note) -> String
    
    public init(){
        var notes:[Note] = []
        
        for index in 0...11 {
            notes.append(Note(midi: index))
        }
        _notes = State(initialValue: notes)
        _selectedNote = State(initialValue: notes[0])
        _selectedNotes = State(initialValue:Scale(root: Note(midi: notes[0].midi + 60)).notes)
        _getOptionLabel = State(initialValue: {note in note.name})
        
    }
    
    public var body: some View {
        NavigationView{
            VStack{
                ProgressView(value: 75, total: 100)
                DescriptionView("Scales are a set of specific intervals begining from a note, this note is know as the tonic note. Almost all musics in the world are build uppon scales. The most know scales are the Major Scale and Minor Scale. Change the tonic note in the note picker and see the notes that compose the Major Scale.")
                Spacer()
                Text("Major Scale")
                NoteCircle($selectedNotes)
                Spacer()
                PickerView(label: "Tonic Note:", selected: $selectedNote, options: $notes, getOptionLabel: $getOptionLabel).onChange(of: selectedNote, perform: { _ in
                    selectedNotes = Scale(root: Note(midi: selectedNote.midi + 60)).notes
                })
                Spacer()
                FooterNavigation<IntervalsView, ChordsView>(previousView: IntervalsView(), nextView: ChordsView(), previousLabel: "Intervals", nextLabel: "Chords")
                
            }.navigationTitle("Scales")
        }.navigationViewStyle(StackNavigationViewStyle()).navigationBarHidden(true)
    }
}
