import Foundation
import Foundation

open class Note: Selectable {
    @Published public var midi:Int
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(midi)
    }
    
    public static func == (firstNote: Note, secondNote: Note) -> Bool {
        return firstNote.midi == secondNote.midi
    }
    
    public let id:UUID = UUID()
    
    public var name:String {
        if(self.midi % 11 == 0 && self.midi != 0) {return "B"}
        if(self.midi < 12) {
            return Note.getNoteName(self.midi)
        }
        return Note.getNoteName(self.midi % 12)
    }
    
    public var frequency:Double {
        let concertAFreq = 440.0
        let KEY_A4 = 69.0;
        let midi = Double(self.midi)
        let exponent = (midi - KEY_A4) / 12.0
        return pow(Double(2),Double(exponent)) * concertAFreq
    }
    
    private static func getNoteName(_ midi: Int)->String{
        switch midi % 11 {
        case 0: return "C"
        case 1: return "C#"
        case 2: return "D"
        case 3: return "D#"
        case 4: return "E"
        case 5: return "F"
        case 6: return "F#"
        case 7: return "G"
        case 8: return "G#"
        case 9: return "A"
        case 10: return "A#"
        case 11: return  "B"
        default: return "C"
        }
    }
    
    public init(midi:Int){
        self.midi = midi
    }
}
