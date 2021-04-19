import SwiftUI
import Models

public struct IntervalsView: View {
    @State private var note1: Note
    @State private var note2: Note
    @State private var notes: [Note]
    @State private var selectedNotes: [Note]
    @State private var getOptionLabel: (Note) -> String
    
    public init(){
        var notes:[Note] = []
        
        for index in 0...11 {
            notes.append(Note(midi: index))
        }
        _notes = State(initialValue: notes)
        _note1 = State(initialValue: notes[0])
        _note2 = State(initialValue: notes[2])
        
        _selectedNotes = State(initialValue:[Note(midi: notes[0].midi + 60), Note(midi: notes[2].midi + 60)])
        _getOptionLabel = State(initialValue: { note in note.name })
    }
    public var body: some View {
        NavigationView{
            VStack{
                ProgressView(value: 50, total: 100)
                
                DescriptionView("Intervals are distance between notes. Each interval have a specific name, change the notes in the note pickers and check the name of the intervals changing.")
                
                
                Text(Interval(note1: note1, note2: note2).name).padding(.top, 80)
                
                NoteCircle($selectedNotes)
                Spacer()
                PickerView(label: "First Note:", selected: $note1, options: $notes, getOptionLabel: $getOptionLabel).onChange(of: note1, perform: { _ in
                    selectedNotes[0] = Note(midi: note1.midi + 60)
                })
                PickerView(label: "Second Note:", selected: $note2, options: $notes, getOptionLabel: $getOptionLabel).onChange(of: note2, perform: { _ in
                    selectedNotes[1] = Note(midi: note2.midi + 60)
                })
                
                Spacer()
                FooterNavigation<NotesView, ScalesView>(previousView: NotesView(), nextView: ScalesView(), previousLabel: "Notes", nextLabel: "Scales")
                
            }.navigationTitle("Intervals")
        }.navigationViewStyle(StackNavigationViewStyle()).navigationBarHidden(true)
    }
}
