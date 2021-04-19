
import Foundation

public class Degree: Selectable {
    public static func == (first: Degree, second: Degree) -> Bool {
        first.value == second.value
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
    
    public var value: Int
    
    public init(_ value: Int){
        self.value = value
    }
}
