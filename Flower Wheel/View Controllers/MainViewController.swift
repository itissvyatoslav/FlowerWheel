//
//  MainViewController.swift
//  Flower Wheel
//
//  Created by Svyatoslav Vladimirovich on 14.07.2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var ColorWheel: UIView!
    @IBOutlet weak var Bouquets: UIView!
    @IBOutlet weak var Showcase: UIView!
    @IBOutlet weak var InfoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        let nonConsumablePurchaseMade = UserDefaults.standard.bool(forKey: "nonConsumablePurchaseMade")
        print("NON CONSUMABLE PURCHASE MADE: \(nonConsumablePurchaseMade)")
        let isNotFirstEnter = UserDefaults.standard.bool(forKey: "firstEnter")
        if !isNotFirstEnter {
            presentFirstEnter()
        }
    }
    
    
    private func setView(){
        firstBackView.isHidden = true
        firstAnimateView.isHidden = true
        firstSupportView.isHidden = true
        ColorWheel.layer.cornerRadius = 20
        Bouquets.layer.cornerRadius = 20
        Showcase.layer.cornerRadius = 20
        InfoView.layer.cornerRadius = 20
        setShadows()
    }
    
    private func setShadows(){
        ColorWheel.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
        Bouquets.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
        Showcase.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
        InfoView.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
        ColorWheel.layer.shadowOpacity = 1
        Bouquets.layer.shadowOpacity = 1
        Showcase.layer.shadowOpacity = 1
        InfoView.layer.shadowOpacity = 1
        ColorWheel.layer.shadowOffset = .zero
        Bouquets.layer.shadowOffset = .zero
        Showcase.layer.shadowOffset = .zero
        InfoView.layer.shadowOffset = .zero
        ColorWheel.layer.shadowRadius = 15
        Bouquets.layer.shadowRadius = 15
        Showcase.layer.shadowRadius = 15
        InfoView.layer.shadowRadius = 15
    }
    
    @available(iOS 13.0, *)
    @IBAction func colorWheelTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ColorWheelViewController") as! ColorWheelViewController
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @available(iOS 13.0, *)
    @IBAction func bouquetsTapped(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "nonConsumablePurchaseMade") {
            let vc = self.storyboard?.instantiateViewController(identifier: "BouquetsViewController") as! BouquetsViewController
            self.navigationController?.pushViewController(vc, animated: false)
        } else {
            let vc = self.storyboard?.instantiateViewController(identifier: "AdvertisementViewController") as! AdvertisementViewController
            vc.idVC = "BouquetsViewController"
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    @available(iOS 13.0, *)
    @IBAction func showcaseTapped(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "nonConsumablePurchaseMade") {
            let vc = self.storyboard?.instantiateViewController(identifier: "ShowcaseViewController") as! ShowcaseViewController
            self.navigationController?.pushViewController(vc, animated: false)
        } else {
            let vc = self.storyboard?.instantiateViewController(identifier: "AdvertisementViewController") as! AdvertisementViewController
            vc.idVC = "ShowcaseViewController"
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    @available(iOS 13.0, *)
    @IBAction func infoTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "NewInfoViewController") as! NewInfoViewController
        vc.delegate = self
          self.navigationController?.pushViewController(vc, animated: false)
        
        //let vc = self.storyboard?.instantiateViewController(identifier: "InfoViewController") as! InfoViewController
        //self.navigationController?.pushViewController(vc, animated: false)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    //MARK:- FIRST ENTER
    
    @IBOutlet weak var firstBackView: UIView!
    @IBOutlet weak var firstAnimateView: UIView!
    @IBOutlet weak var firstSupportView: UIView!
    
    @IBOutlet weak var topAnimate: NSLayoutConstraint!
    @IBOutlet weak var leftAnimate: NSLayoutConstraint!
    @IBOutlet weak var bottomAnimate: NSLayoutConstraint!
    @IBOutlet weak var rightAnimate: NSLayoutConstraint!
    
    
    func presentFirstEnter(){
        firstAnimateView.alpha = 0
        firstBackView.isHidden = false
        firstAnimateView.isHidden = false
        firstSupportView.isHidden = false
        firstAnimateView.layer.cornerRadius = 20
        UIView.animate(withDuration: 3) {
            self.firstAnimateView.alpha = 1
        }
        UIView.animate(withDuration: 15) {
            self.topAnimate.constant += 20
            self.leftAnimate.constant += 20
            self.bottomAnimate.constant -= 20
            self.rightAnimate.constant -= 20
        }
        UserDefaults.standard.set(true, forKey: "firstEnter")
    }
}

extension MainViewController: BackFromInfoDelegate {
    func hideFirstEnter() {
        firstBackView.isHidden = true
        firstAnimateView.isHidden = true
        firstSupportView.isHidden = true
    }
}

