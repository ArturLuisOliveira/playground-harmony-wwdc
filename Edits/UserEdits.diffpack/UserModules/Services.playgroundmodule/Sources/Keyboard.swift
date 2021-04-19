import AudioToolbox
import Models

public class Keyboard {
    public init(){}
    public func playNotes(_ notes:[Note]){
        var sequence : MusicSequence? = nil
        var musicSequenceStatus = NewMusicSequence(&sequence)
        
        var track : MusicTrack? = nil
        
        var musicTrack = MusicSequenceNewTrack(sequence!, &track)
        
        var time = MusicTimeStamp(1.0)
        
        var midiNotes: [UInt8] = notes.map { note in UInt8(note.midi) }
        
        for index:Int in 0...midiNotes.count - 1 {
            var note = MIDINoteMessage(channel: 0,
                                       note: midiNotes[index],
                                       velocity: 64,
                                       releaseVelocity: 0,
                                       duration: 1.0)
            guard let track = track else {fatalError()}
            musicTrack = MusicTrackNewMIDINoteEvent(track, time, &note)
            time += 1
        }
        
        var musicPlayer : MusicPlayer? = nil
        var player = NewMusicPlayer(&musicPlayer)
        
        player = MusicPlayerSetSequence(musicPlayer!, sequence)
        player = MusicPlayerStart(musicPlayer!)
    }
}

