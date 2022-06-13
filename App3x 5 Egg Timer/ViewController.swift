//
//  ViewController.swift
//  App3x 5 Egg Timer
//
//  Created by Marwan Elbahnasawy on 21/05/2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
    var timer = Timer()
    var totalTime : Double!
    var count : Double = 0
    
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        player.stop()
        timer.invalidate()
        progressBar.progress = 0
        count = 0
        progressLabel.text = "In Progress"
        if sender.currentTitle == "Soft" {
            totalTime = 3
        }
        else if sender.currentTitle == "Medium" {
            totalTime = 4
        }
        else {
            totalTime = 5
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fireTimer) , userInfo: nil, repeats: true)
    }
    
    
    @objc func fireTimer (){
        count += 1
        progressBar.progress = Float(count/totalTime)
        print(count)
        print(totalTime)
        if count == totalTime {
            progressLabel.text = "Done"
            playSound()
            timer.invalidate()
        }
    }
    
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
       // player.play()
    }
    
}

