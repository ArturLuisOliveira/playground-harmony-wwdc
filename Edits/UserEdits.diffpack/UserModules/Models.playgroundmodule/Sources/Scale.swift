import Foundation

let MAJOR_SCALE_INTERVALS = [0, 2, 4, 5, 7, 9, 11]

public struct Scale {
    var root: Note
    public var notes: [Note] {
        MAJOR_SCALE_INTERVALS.map{ interval in Note(midi: root.midi + interval) }
    }
    
    public init(root:Note) {
        self.root = root
    }
}
