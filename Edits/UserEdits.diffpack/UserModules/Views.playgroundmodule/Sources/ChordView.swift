
//
//  ChordsView.swift
//  wwdc-harmony
//
//  Created by Artur Luis on 15/04/21.
//

import SwiftUI
import Models

public struct ChordsView: View {
    @State private var notes: [Note]
    @State private var selectedNote: Note
    @State private var degrees: [Degree]
    @State private var selectedDegree: Degree
    @State private var selectedNotes: [Note]
    @State private var getNoteLabel: (Note) -> String
    @State private var getDegreeLabel: (Degree) -> String
    
    public init(){
        var notes:[Note] = []
        
        for index in 0...11 {
            notes.append(Note(midi: index))
        }
        _notes = State(initialValue: notes)
        _selectedNote = State(initialValue: notes[0])
        _degrees = State(initialValue: [
            Degree(0),
            Degree(1),
            Degree(2),
            Degree(3),
            Degree(4),
            Degree(5),
            Degree(6)
        ])
        _selectedDegree = State(initialValue: Degree(0))
        _selectedNotes = State(initialValue:Chord(tonic: notes[0], degree: 0).notes.map{note in Note(midi: note.midi + 60)})
        _getNoteLabel = State(initialValue: {note in note.name})
        _getDegreeLabel = State(initialValue: {degree in String(degree.value + 1)})
    }
    
    public var body: some View {
        NavigationView{
            
            VStack{
                ProgressView(value: 100, total: 100)
                DescriptionView("Chords are a set of spefic intervals. In the harmony context they can be generated uppon a given scale, so each note or degree of that scale generates an chord. ")
                
                Spacer()
                NoteCircle($selectedNotes)
                
                Spacer()
                
                
                PickerView(label: "Major Scale Note:", selected: $selectedNote, options: $notes, getOptionLabel: $getNoteLabel).onChange(of: selectedNote, perform: { _ in
                    selectedNotes = Chord(tonic: Note(midi:selectedNote.midi + 60), degree: selectedDegree.value).notes
                })
                
                PickerView(label: "Degree:", selected: $selectedDegree, options: $degrees, getOptionLabel: $getDegreeLabel).onChange(of: selectedDegree, perform: { _ in
                    selectedNotes = Chord(tonic: Note(midi: selectedNote.midi + 60), degree: selectedDegree.value).notes
                })
                
                Spacer()
                FooterNavigation<ScalesView, EndingView>(previousView: ScalesView(),  nextView: EndingView(), previousLabel: "Scales", nextLabel: "Ending")
            }.navigationTitle("Chords")
        }.navigationViewStyle(StackNavigationViewStyle()).navigationBarHidden(true)
    }
}
