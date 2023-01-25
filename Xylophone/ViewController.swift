//
//  ViewController.swift
//  Xylophone
//
//  Created by Aleksey Kosov on 25.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func keyPressed(_ sender: UIButton) {
        guard let soundName = sender.titleLabel?.text else { return }
        sender.alpha = 0.8
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
        }
        playsound(soundName)
    }

    private func playsound(_ soundName: String) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: soundName, ofType: "wav")!))
            audioPlayer.play()
        } catch {
            print(error)
        }
    }
}

