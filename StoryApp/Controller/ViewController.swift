//
//  ViewController.swift
//  StoryApp
//
//  Created by Cansu Aktas on 2023-08-13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var storyText: UILabel!
    
    @IBOutlet weak var option1Button: UIButton!
    
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var resetButton: UIButton!

    var storyBrain = StoryBrain()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        let storyIndex = storyBrain.storyIndex
        storyText.text = storyBrain.stories[storyIndex].title
        if(storyBrain.isEnd()) {
            option1Button.isHidden = true
            option2Button.isHidden = true
            resetButton.isHidden = false
        } else {
            option1Button.isHidden = false
            option2Button.isHidden = false
            resetButton.isHidden = true
            option1Button.setTitle(storyBrain.stories[storyIndex].choice1, for: .normal)
            option2Button.setTitle(storyBrain.stories[storyIndex].choice2, for: .normal)
        }
        

    }

    @IBAction func choiceMade(_ sender: UIButton) {
        
        storyBrain.nextStory(choice: (sender.titleLabel?.text)!)
        updateUI()
        
    }
    
    @IBAction func reset(_ sender: UIButton) {
        
        storyBrain.reset()
        updateUI()
        
    }


}

