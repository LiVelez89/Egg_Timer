

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var secondsPassed: Float = 0.0
    var totalTime: Float = 0.0
    var alarm: AVAudioPlayer!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = Float(eggTimes[hardness]!)
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] (Timer) in
            self.updateTimer()
            
        })
        
    }
    func updateTimer() {
        
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        } else {
            self.timer.invalidate()
            playAlarm()
            self.titleLabel.text = "DONE!"
        }
        
    }
    
    func playAlarm() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        alarm = try! AVAudioPlayer(contentsOf: url!)
        alarm.play()
    
    }
    
    
}
