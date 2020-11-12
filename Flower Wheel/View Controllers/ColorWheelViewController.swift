//
//  ColorWheelViewController.swift
//  Flower Wheel
//
//  Created by Svyatoslav Vladimirovich on 15.07.2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import UIKit

class ColorWheelViewController: UIViewController{
    
    @IBOutlet weak var imageMask1: UIImageView!
    @IBOutlet weak var imageMask2: UIImageView!
    @IBOutlet weak var imageMask3: UIImageView!
    @IBOutlet weak var imageMask4: UIImageView!
    @IBOutlet weak var imageMask5: UIImageView!
    @IBOutlet weak var imageMask6: UIImageView!
    @IBOutlet weak var imageMask7: UIImageView!
    @IBOutlet weak var imageMask8: UIImageView!
    
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var maskImage: UIImageView!
    
    @IBOutlet weak var maskView: UIView!
    
    @IBOutlet weak var indicator1: UIImageView!
    @IBOutlet weak var indicator2: UIImageView!
    @IBOutlet weak var indicator3: UIImageView!
    @IBOutlet weak var indicator4: UIImageView!
    @IBOutlet weak var indicator5: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var isPayed = false
    var selectedIndexMask = 0
    var isSelectedBigButton = false
    var selectedMask = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRotation()
        setImages()
        setIndicators()
        indicator1.isHidden = false
        bigImage.image = UIImage(named: "intensive1")
        nameLabel.text = ""
        countLabel.text = ""
    }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    private func setRotation(){
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(sender:)))
        maskView.addGestureRecognizer(rotate)
    }
    
    @objc func handleRotation(sender: UIRotationGestureRecognizer){
        guard sender.view != nil else {return}
        
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = sender.view!.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
    
    private func setImages(){
        imageMask1.image = UIImage(named: "Mask1")
        imageMask2.image = UIImage(named: "Mask2")
        imageMask3.image = UIImage(named: "Mask3")
        imageMask4.image = UIImage(named: "Mask4")
        imageMask5.image = UIImage(named: "Mask5")
        imageMask6.image = UIImage(named: "Mask6")
        imageMask7.image = UIImage(named: "Mask7")
        imageMask8.image = UIImage(named: "Mask8")
    }
    
    private func setIndicators(){
        indicator1.isHidden = true
        indicator2.isHidden = true
        indicator3.isHidden = true
        indicator4.isHidden = true
        indicator5.isHidden = true
    }
    
    @IBAction func imageMask1Tapped(_ sender: Any) {
        setImages()
        if selectedMask == 1 {
            nameLabel.text = ""
            countLabel.text = ""
            selectedIndexMask = 0
            selectedMask = 0
            maskImage.image = nil
        } else {
            imageMask1.image = UIImage(named: "MaskOrange1")
            nameLabel.text = "Монохромная"
            countLabel.text = "1"
            selectedIndexMask = 1
            if isSelectedBigButton {
                maskImage.image = UIImage(named: "BigMask\(selectedIndexMask)")
            } else {
                maskImage.image = UIImage(named: "Mask0\(selectedIndexMask)")
            }
            selectedMask = 1
        }
    }
    
    @IBAction func imageMask2Tapped(_ sender: Any) {
        setImages()
        if selectedMask == 2 {
            nameLabel.text = ""
            countLabel.text = ""
            selectedIndexMask = 0
            selectedMask = 0
            maskImage.image = nil
        } else {
            imageMask2.image = UIImage(named: "MaskOrange2")
            nameLabel.text = "Соседние"
            countLabel.text = "5"
            selectedIndexMask = 2
            if isSelectedBigButton {
                maskImage.image = UIImage(named: "BigMask\(selectedIndexMask)")
            } else {
                maskImage.image = UIImage(named: "Mask0\(selectedIndexMask)")
            }
            selectedMask = 2
        }
    }
    
    @IBAction func imageMask3Tapped(_ sender: Any) {
        setImages()
        if selectedMask == 3 {
            nameLabel.text = ""
            countLabel.text = ""
            selectedIndexMask = 0
            selectedMask = 0
            maskImage.image = nil
        } else {
            imageMask3.image = UIImage(named: "MaskOrange3")
            nameLabel.text = "Комплементарная"
            countLabel.text = "2"
            selectedIndexMask = 3
            if isSelectedBigButton {
                maskImage.image = UIImage(named: "BigMask\(selectedIndexMask)")
            } else {
                maskImage.image = UIImage(named: "Mask0\(selectedIndexMask)")
            }
            selectedMask = 3
        }
    }
    
    @IBAction func imageMask4Tapped(_ sender: Any) {
        setImages()
        if selectedMask == 4 {
            nameLabel.text = ""
            countLabel.text = ""
            selectedIndexMask = 0
            selectedMask = 0
            maskImage.image = nil
        } else {
            imageMask4.image = UIImage(named: "MaskOrange4")
            nameLabel.text = "Аналоговая"
            countLabel.text = "3"
            selectedIndexMask = 4
            if isSelectedBigButton {
                maskImage.image = UIImage(named: "BigMask\(selectedIndexMask)")
            } else {
                maskImage.image = UIImage(named: "Mask0\(selectedIndexMask)")
            }
            selectedMask = 4
        }
    }
    
    @IBAction func imageMask5Tapped(_ sender: Any) {
        setImages()
        if selectedMask == 5 {
            nameLabel.text = ""
            countLabel.text = ""
            selectedIndexMask = 0
            selectedMask = 0
            maskImage.image = nil
        } else {
            imageMask5.image = UIImage(named: "MaskOrange5")
            nameLabel.text = "Триада раздельная"
            countLabel.text = "3"
            selectedIndexMask = 5
            if isSelectedBigButton {
                maskImage.image = UIImage(named: "BigMask\(selectedIndexMask)")
            } else {
                maskImage.image = UIImage(named: "Mask0\(selectedIndexMask)")
            }
            selectedMask = 5
        }
    }
    
    @IBAction func imageMask6Tapped(_ sender: Any) {
        setImages()
        if selectedMask == 6 {
            nameLabel.text = ""
            countLabel.text = ""
            selectedIndexMask = 0
            selectedMask = 0
            maskImage.image = nil
        } else {
            imageMask6.image = UIImage(named: "MaskOrange6")
            nameLabel.text = "Триада равноудаленная"
            countLabel.text = "3"
            selectedIndexMask = 6
            if isSelectedBigButton {
                maskImage.image = UIImage(named: "BigMask\(selectedIndexMask)")
            } else {
                maskImage.image = UIImage(named: "Mask0\(selectedIndexMask)")
            }
            selectedMask = 6
        }
    }
    
    @IBAction func imageMask7Tapped(_ sender: Any) {
        setImages()
        if selectedMask == 7 {
            nameLabel.text = ""
            countLabel.text = ""
            selectedIndexMask = 0
            selectedMask = 0
            maskImage.image = nil
        } else {
            imageMask7.image = UIImage(named: "MaskOrange7")
            nameLabel.text = "Тетрада прямоугольная"
            countLabel.text = "4"
            selectedIndexMask = 7
            if isSelectedBigButton {
                maskImage.image = UIImage(named: "BigMask\(selectedIndexMask)")
            } else {
                maskImage.image = UIImage(named: "Mask0\(selectedIndexMask)")
            }
            selectedMask = 7
        }
    }
    
    @IBAction func imageMask8Tapped(_ sender: Any) {
        setImages()
        if selectedMask == 8 {
            nameLabel.text = ""
            countLabel.text = ""
            selectedIndexMask = 0
            selectedMask = 0
            maskImage.image = nil
        } else {
            imageMask8.image = UIImage(named: "MaskOrange8")
            nameLabel.text = "Тетрада квадратная"
            countLabel.text = "4"
            selectedIndexMask = 8
            if isSelectedBigButton {
                maskImage.image = UIImage(named: "BigMask\(selectedIndexMask)")
            } else {
                maskImage.image = UIImage(named: "Mask0\(selectedIndexMask)")
            }
            selectedMask = 8
        }
    }
    
    @IBAction func white1Tapped(_ sender: Any) {
        setIndicators()
        bigImage.image = UIImage(named: "white1")
        indicator5.isHidden = false
    }
    
    @IBAction func white2Tapped(_ sender: Any) {
        setIndicators()
        bigImage.image = UIImage(named: "white2")
        indicator4.isHidden = false
    }
    
    @IBAction func originalTapped(_ sender: Any) {
        setIndicators()
        bigImage.image = UIImage(named: "colorwheel")
        indicator3.isHidden = false
    }
    
    @IBAction func intensive2Tapped(_ sender: Any) {
        setIndicators()
        bigImage.image = UIImage(named: "intensive2")
        indicator2.isHidden = false
    }
    
    @IBAction func intensive1Tapped(_ sender: Any) {
        setIndicators()
        bigImage.image = UIImage(named: "intensive1")
        indicator1.isHidden = false
    }
    
    @available(iOS 13.0, *)
    @IBAction func bigButtonTapped(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "nonConsumablePurchaseMade") {
            if selectedIndexMask != 0 {
                if isSelectedBigButton {
                    maskImage.image = UIImage(named: "Mask0\(selectedIndexMask)")
                    isSelectedBigButton = false
                } else {
                    maskImage.image = UIImage(named: "BigMask\(selectedIndexMask)")
                    isSelectedBigButton = true
                }
            }
        } else {
            let vc = self.storyboard?.instantiateViewController(identifier: "AdvertisementViewController") as! AdvertisementViewController
            vc.idVC = "ColorWheelViewController"
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
