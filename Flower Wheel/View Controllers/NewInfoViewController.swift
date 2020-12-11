//
//  NewInfoViewController.swift
//  Flower Wheel
//
//  Created by Svyatoslav Vladimirovich on 11.11.2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import UIKit
import SafariServices


protocol BackFromInfoDelegate {
    func hideFirstEnter()
}

class NewInfoViewController: UIViewController {
    
    var delegate: BackFromInfoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instructionViewHeight.constant = 0
        firstImageBug.isHidden = true
        secondImageBug.isHidden = true
        thirdImageBug.isHidden = true
        guideViewHeight.constant = 0
        coldWarmHeight.constant = 0
        imageColdWarmBug1.isHidden = true
        labelColdWarmBug1.isHidden = true
        labelColdWarmBug2.isHidden = true
        imageColdWarmBug2.isHidden = true
        labelColdWarmBug3.isHidden = true
        labelColdWarmBug4.isHidden = true
        labelColdWarmBug5.isHidden = true
        labelColdWarmBug6.isHidden = true
        lightsViewHeight.constant = 0
        lightsImageBug1.isHidden = true
        lightsImageBug2.isHidden =  true
        lightsImageBug3.isHidden = true
        lightsImageBug4.isHidden = true
        lightsLabelBug1.isHidden = true
        lightsLabelBug2.isHidden = true
        ligthsLabelBug3.isHidden = true
        lightsLabelBug4.isHidden = true
        lightsLabelBug5.isHidden = true
        lightsLabelBug6.isHidden = true
        lightsLabelBug7.isHidden = true
        lightsLabelBug8.isHidden = true
        brightViewHeight.constant = 0
        maskViewHeight.constant = 0
        maskView.isHidden = true
        backgroundView.isHidden = true
        backgroundViewHeight.constant = 0
        showcaseViewHeight.constant = 0
        showcaseView.isHidden = true
        videoViewHeight.constant = 0
        instaView.isHidden = true
        instaViewHeight.constant = 0
        videoView.isHidden = true
    }
    
    @IBAction func backTapped(_ sender: Any) {
        delegate?.hideFirstEnter()
        navigationController?.popViewController(animated: false)
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    
    
    //MARK:- INFO
    
    @IBOutlet weak var instructionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var firstImageBug: UIImageView!
    @IBOutlet weak var secondImageBug: UIImageView!
    @IBOutlet weak var thirdImageBug: UIImageView!
    
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var instructionPlus: UILabel!
    
    
    @IBAction func instructionTapped(_ sender: Any) {
        instructionLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        instructionPlus.text = "-"
        firstImageBug.isHidden = false
        secondImageBug.isHidden = false
        thirdImageBug.isHidden = false
        instructionViewHeight.constant = 2300
    }
    
    @IBAction func instructionToCloseTapped(_ sender: Any) {
        instructionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        instructionPlus.text = "+"
        firstImageBug.isHidden = true
        secondImageBug.isHidden = true
        thirdImageBug.isHidden = true
        instructionViewHeight.constant = 0
    }
    
    
    @IBOutlet weak var guideViewHeight: NSLayoutConstraint!
    @IBOutlet weak var guideLabel: UILabel!
    @IBOutlet weak var guidePlus: UILabel!
    
    
    @IBAction func guideTapped(_ sender: Any) {
        guideLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        guidePlus.text = "-"
        guideViewHeight.constant = 400
    }
    
    @IBAction func guideToCloseTapped(_ sender: Any) {
        guideLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        guidePlus.text = "+"
        guideViewHeight.constant = 0
    }
    
    @IBOutlet weak var coldWarmHeight: NSLayoutConstraint!
    
    @IBOutlet weak var imageColdWarmBug1: UIImageView!
    @IBOutlet weak var labelColdWarmBug1: UILabel!
    @IBOutlet weak var labelColdWarmBug2: UILabel!
    @IBOutlet weak var imageColdWarmBug2: UIImageView!
    @IBOutlet weak var labelColdWarmBug3: UILabel!
    @IBOutlet weak var labelColdWarmBug4: UILabel!
    @IBOutlet weak var labelColdWarmBug5: UILabel!
    @IBOutlet weak var labelColdWarmBug6: UILabel!
    
    @IBOutlet weak var coldWarmLabel: UILabel!
    @IBOutlet weak var coldWarmPlus: UILabel!
    
    
    @IBAction func coldWarmTapped(_ sender: Any) {
        coldWarmLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        coldWarmPlus.text = "-"
        coldWarmHeight.constant = 670
        imageColdWarmBug1.isHidden = false
        labelColdWarmBug1.isHidden = false
        labelColdWarmBug2.isHidden = false
        imageColdWarmBug2.isHidden = false
        labelColdWarmBug3.isHidden = false
        labelColdWarmBug4.isHidden = false
        labelColdWarmBug5.isHidden = false
        labelColdWarmBug6.isHidden = false
    }
    
    
    @IBAction func coldWarmToCloseTapped(_ sender: Any) {
        coldWarmLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        coldWarmPlus.text = "+"
        coldWarmHeight.constant = 0
        imageColdWarmBug1.isHidden = true
        labelColdWarmBug1.isHidden = true
        labelColdWarmBug2.isHidden = true
        imageColdWarmBug2.isHidden = true
        labelColdWarmBug3.isHidden = true
        labelColdWarmBug4.isHidden = true
        labelColdWarmBug5.isHidden = true
        labelColdWarmBug6.isHidden = true
    }
    
    
    @IBOutlet weak var lightsViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var lightsImageBug1: UIImageView!
    @IBOutlet weak var lightsImageBug2: UIImageView!
    @IBOutlet weak var lightsImageBug3: UIImageView!
    @IBOutlet weak var lightsImageBug4: UIImageView!
    
    @IBOutlet weak var lightsLabelBug1: UILabel!
    @IBOutlet weak var lightsLabelBug2: UILabel!
    @IBOutlet weak var ligthsLabelBug3: UILabel!
    @IBOutlet weak var lightsLabelBug4: UILabel!
    @IBOutlet weak var lightsLabelBug5: UILabel!
    @IBOutlet weak var lightsLabelBug6: UILabel!
    @IBOutlet weak var lightsLabelBug7: UILabel!
    @IBOutlet weak var lightsLabelBug8: UILabel!
    
    @IBOutlet weak var lightsLabel: UILabel!
    @IBOutlet weak var lightsPlus: UILabel!
    
    
    @IBAction func lightsTapped(_ sender: Any) {
        lightsLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        lightsPlus.text = "-"
        lightsViewHeight.constant = 1080
        lightsImageBug1.isHidden = false
        lightsImageBug2.isHidden = false
        lightsImageBug3.isHidden = false
        lightsImageBug4.isHidden = false
        lightsLabelBug1.isHidden = false
        lightsLabelBug2.isHidden = false
        ligthsLabelBug3.isHidden = false
        lightsLabelBug4.isHidden = false
        lightsLabelBug5.isHidden = false
        lightsLabelBug6.isHidden = false
        lightsLabelBug7.isHidden = false
        lightsLabelBug8.isHidden = false
    }
    
    @IBAction func lightsToCloseTapped(_ sender: Any) {
        lightsLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lightsPlus.text = "+"
        lightsViewHeight.constant = 0
        lightsImageBug1.isHidden = true
        lightsImageBug2.isHidden =  true
        lightsImageBug3.isHidden = true
        lightsImageBug4.isHidden = true
        lightsLabelBug1.isHidden = true
        lightsLabelBug2.isHidden = true
        ligthsLabelBug3.isHidden = true
        lightsLabelBug4.isHidden = true
        lightsLabelBug5.isHidden = true
        lightsLabelBug6.isHidden = true
        lightsLabelBug7.isHidden = true
        lightsLabelBug8.isHidden = true
    }
    
    @IBOutlet weak var brightViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var brightLabel: UILabel!
    @IBOutlet weak var brightPlus: UILabel!
    
    
    @IBAction func brightTapped(_ sender: Any) {
        brightLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        brightPlus.text = "-"
        brightViewHeight.constant = 620
    }
    
    @IBAction func brightTappedToClose(_ sender: Any) {
        brightLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        brightPlus.text = "+"
        brightViewHeight.constant = 0
    }
    
    @IBOutlet weak var maskViewHeight: NSLayoutConstraint!
    @IBOutlet weak var maskView: UIView!
    @IBOutlet weak var maskLabel: UILabel!
    @IBOutlet weak var maskPlus: UILabel!
    @IBOutlet weak var bugMaskLabel1: UILabel!
    
    
    
    @IBAction func maskTap(_ sender: Any) {
        bugMaskLabel1.numberOfLines = 0
        maskLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        maskPlus.text = "-"
        maskView.isHidden = false
        maskViewHeight.constant = 2050
    }
    
    @IBAction func maskToCloseTap(_ sender: Any) {
        maskLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        maskPlus.text = "+"
        maskView.isHidden = true
        maskViewHeight.constant = 0
    }
    
    @IBOutlet weak var backgroundViewHeight: NSLayoutConstraint!
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var backgroundLabel: UILabel!
    @IBOutlet weak var backgroundPlus: UILabel!
    
    
    @IBAction func backgroundTapped(_ sender: Any) {
        backgroundLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        backgroundPlus.text = "-"
        backgroundView.isHidden = false
        backgroundViewHeight.constant = 500
    }
    
    @IBAction func backgroundToCloseTapped(_ sender: Any) {
        backgroundLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        backgroundPlus.text = "+"
        backgroundView.isHidden = true
        backgroundViewHeight.constant = 0
    }
    
    @IBOutlet weak var showcaseViewHeight: NSLayoutConstraint!
    @IBOutlet weak var showcaseView: UIView!
    @IBOutlet weak var showcaseLabel: UILabel!
    @IBOutlet weak var showcasePlus: UILabel!
    
    
    @IBAction func showcaseTapped(_ sender: Any) {
        showcaseLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        showcasePlus.text = "-"
        showcaseViewHeight.constant = 440
        showcaseView.isHidden = false
    }
    
    @IBAction func showcaseToCloseTapped(_ sender: Any) {
        showcaseLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        showcasePlus.text = "+"
        showcaseViewHeight.constant = 0
        showcaseView.isHidden = true
    }
    
    
    @IBOutlet weak var videoViewHeight: NSLayoutConstraint!
    @IBOutlet weak var videoPlus: UILabel!
    @IBOutlet weak var videoLabel: UILabel!
    @IBOutlet weak var videoView: UIView!
    
    
    
    @IBAction func youtubeTapped(_ sender: Any) {
        showSafariVC(url: "https://www.youtube.com/watch?v=MNhIq3LF7sg&feature=youtu.be")
    }
    
    
    @IBAction func videoTapped(_ sender: Any) {
        videoView.isHidden = false
        videoLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        videoPlus.text = "-"
        videoViewHeight.constant = 128
    }
    
    @IBAction func videoToCloseTapped(_ sender: Any) {
        videoView.isHidden = true
        videoLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        videoPlus.text = "+"
        videoViewHeight.constant = 0
    }
    
    @IBOutlet weak var instaViewHeight: NSLayoutConstraint!
    @IBOutlet weak var instaView: UIView!
    
    @IBOutlet weak var instaLabel: UILabel!
    @IBOutlet weak var instaPlus: UILabel!
    
    @IBAction func instaTapped(_ sender: Any) {
        instaLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        instaPlus.text = "-"
        instaView.isHidden = false
        instaViewHeight.constant = 60
    }
    
    @IBAction func instaToCloseTapped(_ sender: Any) {
        instaLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        instaPlus.text = "+"
        instaView.isHidden = true
        instaViewHeight.constant = 0
    }
    
    @IBAction func insta(_ sender: Any) {
        showSafariVC(url: "https://instagram.com/flower_colour_wheel?igshid=kajh1pyhhfu0")
    }
    
    func showSafariVC(url: String){
        guard let url = URL(string: url) else {
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}
