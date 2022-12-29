//
//  ViewController.swift
//  Pomondoro timer
//
//  Created by Turdesán Csaba on 2022. 12. 21..
//

import UIKit
import AVFoundation
import ButtonClickStyle
import GlitchLabel

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    var minutes = 1
    var seconds = 10
   
    @IBOutlet weak var labelTimer: GlitchLabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    
    @IBOutlet weak var stopButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTimer.blendMode = .multiply
     
        refreshtimer()
    }
    
   
 // MARK: - Timer stop/start
    
    var timer : Timer?

    func startTimer() {
      if timer == nil {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
      }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
 //MARK: - Sound
    func playSound(soundName: String) {
        
        guard let path = Bundle.main.path(forResource: soundName, ofType: "wav") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
//MARK: - Breaktime
    /*
    func breakTime() {
       
        labelTimer.text = "BREAK!"
       
      
        
        minutesLabel.text = "\(minutes)"
        secondsLabel.text = "\(seconds / 5)"
     
    
        
        } */
        
//MARK: - RefreshTimer
    func refreshtimer() {
        
        minutes = 25
        seconds = 1801
        
        labelTimer.text = "Pomondoro Timer"
        
        view.backgroundColor = UIColor.systemCyan
        
        startButtonOutlet.isHidden = false
        stopButtonOutlet.isHidden = false
       
        
        secondsLabel.text = "\(seconds / 30)"
        minutesLabel.text = "\(minutes)"
    }
//MARK: - Time to String
    func timeString2(time: TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i", seconds)
    }
//MARK: - THE TIMER
   func runTimer() {
 
         minutes = 25
         seconds = 1801
        //24 /1500
        labelTimer.text = "Learning Time"
        
        minutesLabel.text = "\(minutes)"
        secondsLabel.text = timeString2(time: TimeInterval(seconds))
        
        startTimer()
       
        }
 //MARK: - Refresh the timer with math
    @objc func updateTimer() {
        
        seconds -= 1
        
        secondsLabel.text = timeString2(time: TimeInterval(seconds))
        
        switch seconds {
        case 1800:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 1740:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 1680:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 1620:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 1560:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 1500:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 1440:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 1380:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 1320:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 1260:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 1200:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 1140:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 1080:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 1020:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 960:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 900:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 840:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 780:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 720:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 660:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 600:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 540:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 480:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 420:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 360:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
///
        case 300:
            playSound(soundName: "C-felso")
            labelTimer.text = "BREAK"
            view.backgroundColor = UIColor.brown
            minutes += 4
            minutesLabel.text = ("\(minutes)")
///
        case 240:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 180:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 120:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 60:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
        case 0:
            minutes -= 1
            minutesLabel.text = ("\(minutes)")
            playSound(soundName: "C-felso")
            stopTimer()
            refreshtimer()
            
        default:
            print("asd")
        }
  
        print("\(minutes):\(seconds)")
    
    }
    
//MARK: - Buttons
    @IBAction func startButton(_ sender: UIButton) {
        
        playSound(soundName: "C-felso")
        runTimer()
        sender.isHidden = true
        }
      
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        sender.buttonClickStylePulsateNew(duration: 2, value: 4, visible: true)
        seconds = 2
        minutes = 0
        startButtonOutlet.isHidden = false
        stopButtonOutlet.isHidden = false
        stopTimer()
        refreshtimer()
      
    }
}

