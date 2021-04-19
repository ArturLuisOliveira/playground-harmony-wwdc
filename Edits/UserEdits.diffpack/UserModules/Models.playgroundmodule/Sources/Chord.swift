
import Foundation

let MAJOR_CHORD_SEMITONES = [0, 4, 7]
let MINOR_CHORD_SEMITONES = [0, 3, 7]
let DIMINISHED_CHORD_SEMITONES = [0, 3, 6]

let DEGREE_CHORD_SEMITONES = [
    0: MAJOR_CHORD_SEMITONES,
    1: MINOR_CHORD_SEMITONES,
    2: MINOR_CHORD_SEMITONES,
    3: MAJOR_CHORD_SEMITONES,
    4: MAJOR_CHORD_SEMITONES,
    5: MINOR_CHORD_SEMITONES,
    6: DIMINISHED_CHORD_SEMITONES
]

public struct Chord {
    public var degree: Int
    public var scale: Scale
    
    public var notes: [Note] {
        guard let chordSemitones = DEGREE_CHORD_SEMITONES[degree] else { return [] }
        let notes =  chordSemitones.map { interval in
            Note(midi: scale.notes[degree].midi + interval)
        }
        return notes
    }
    
    public var chordName:String {
        switch degree {
        case 0: return "\(scale.notes[degree].name) Major"
        case 1: return "\(scale.notes[degree].name) Minor"
        case 2: return "\(scale.notes[degree].name) Minor"
        case 3: return "\(scale.notes[degree].name) Major"
        case 4: return "\(scale.notes[degree].name) Major"
        case 5: return "\(scale.notes[degree].name) Minor"
        case 6: return "\(scale.notes[degree].name) Diminished"
        default: return ""
        }
    }
    
    public init(tonic: Note, degree: Int){
        self.scale = Scale(root: tonic)
        self.degree = degree
    }
}
