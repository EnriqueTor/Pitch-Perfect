//
//  PlaySoundViewController.swift
//  PitchPerfect
//
//  Created by Enrique Torrendell on 11/30/16.
//  Copyright © 2016 Enrique Torrendell. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController, UIDocumentInteractionControllerDelegate {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var shareSound: UIBarButtonItem!

    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        
        switch(ButtonType(rawValue: sender.tag)!) {
            
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        
        stopAudio()
        
    }
    
//    @IBAction func share() {
//        
//        var controller = UIDocumentInteractionController()
//        
//        controller = UIDocumentInteractionController(URL: selectedAudioUrl!)
//        
//        if UIApplication.shared.canOpenURL(NSURL(string:"w‌​hatsapp://app")! as URL) {
//            
//            controller = UIDocumentInteractionController(URL: selectedAudioUrl!)
//            
//            controller.uti = "net.whatsapp.audio"
//            
//            controller.delegate=self
//            
//            controller.presentOpenInMenu(from: CGRect.zero, in: self.view, animated: true)
//            
//        } else {
//            print("error")
//        }
//        
//        
//        
//    }
    
}
