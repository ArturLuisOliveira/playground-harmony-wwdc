import Foundation

public struct Interval {
    public var note1: Note
    public var note2: Note
    
    public init(note1:Note, note2: Note) {
        self.note1 = note1
        self.note2 = note2
    }
    
    public var name:String {
        if(note1 == note2) { return "Perfect unison" }
        let higherNote = note1.midi > note2.midi ? note1 : note2
        let smallerNote = note1.midi > note2.midi ? note2 : note1
        let semitones = higherNote.midi - smallerNote.midi
        switch semitones {
        case 0: return "Perfect unison"
        case 1: return "Minor second"
        case 2: return "Major second"
        case 3: return "Minor third"
        case 4: return "Major third"
        case 5: return "Perfect fourth"
        case 6: return "Diminished fifth"
        case 7: return "Perfect fifth"
        case 8: return "Minor sixth"
        case 9: return "Major sixth"
        case 10: return "Minor seventh"
        case 11: return "Major seventh"
        case 12: return "Perfect octave"
        default: return ""
        }
    }
    
}
