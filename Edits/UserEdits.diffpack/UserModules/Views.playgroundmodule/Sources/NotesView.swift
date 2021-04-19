import SwiftUI
import Models


public struct NotesView: View {
    @State private var selectedNote: Note
    @State private var selectedNotes: [Note]
    @State private var notes:[Note]
    @State private var getOptionLabel:(Note) -> String
    
    public  init(){
        var notes:[Note] = []
        
        for index in 1...130 {
            notes.append(Note(midi: index))
        }
        _notes = State(initialValue: notes)
        _selectedNote = State(initialValue: notes[68])
        _selectedNotes = State(initialValue: [notes[68]])
        _getOptionLabel = State(initialValue: { note in String(format: "%.2f", note.frequency) + " Hz" })
    }
    
    public var body: some View {
        NavigationView {
            VStack {
                ProgressView(value: 25, total: 100)
                DescriptionView("Musical notes are a symbolic representation of frequencies. There are only twelve notes, and with those notes is posible to represent all the frequency spectrum (C, C#, D, D#, E, F, F#, G, G#, A, A#, B).")
                
                Spacer()
                NoteCircle($selectedNotes)
                Spacer()
                PickerView(label: "Selected Frequency:", selected:$selectedNote, options: $notes, getOptionLabel: $getOptionLabel).onChange(of: selectedNote, perform: { value in
                    selectedNotes = [value]
                })
                Spacer()
                
                FooterNavigation<OnboardingView, IntervalsView>( previousView: OnboardingView(), nextView: IntervalsView(), previousLabel: "Onboarding", nextLabel: "Intervals")
                
            }.navigationTitle("Notes")
            
        }.navigationViewStyle(StackNavigationViewStyle()).navigationBarHidden(true)
    }
}

