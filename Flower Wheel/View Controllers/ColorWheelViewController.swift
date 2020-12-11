//
//  ColorWheelViewController.swift
//  Flower Wheel
//
//  Created by Svyatoslav Vladimirovich on 15.07.2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import UIKit

class ColorWheelViewController: UIViewController, UIGestureRecognizerDelegate{
    
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
        //UserDefaults.standard.set(false, forKey: "firstEnter")
        setRotation()
        setImages()
        setIndicators()
        indicator1.isHidden = false
        bigImage.image = UIImage(named: "intensive1")
        nameLabel.text = ""
        countLabel.text = ""
        rotate(to: rotation)
        let pan = UIPanGestureRecognizer(target: self, action:#selector(self.pan))
        pan.minimumNumberOfTouches = 1
        pan.maximumNumberOfTouches = 1
        pan.delegate = self
        self.view.addGestureRecognizer(pan)
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
            if bigImage.image == UIImage(named: "wheelwithtext") {
                bigImage.image = UIImage(named: "intensive1")
            }
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
            if bigImage.image == UIImage(named: "wheelwithtext") {
                bigImage.image = UIImage(named: "intensive1")
            }
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
            if bigImage.image == UIImage(named: "wheelwithtext") {
                bigImage.image = UIImage(named: "intensive1")
            }
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
            if bigImage.image == UIImage(named: "wheelwithtext") {
                bigImage.image = UIImage(named: "intensive1")
            }
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
            if bigImage.image == UIImage(named: "wheelwithtext") {
                bigImage.image = UIImage(named: "intensive1")
            }
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
            if bigImage.image == UIImage(named: "wheelwithtext") {
                bigImage.image = UIImage(named: "intensive1")
            }
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
            if bigImage.image == UIImage(named: "wheelwithtext") {
                bigImage.image = UIImage(named: "intensive1")
            }
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
            if bigImage.image == UIImage(named: "wheelwithtext") {
                bigImage.image = UIImage(named: "intensive1")
            }
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
        if isSelectedBigButton && selectedIndexMask != 0 {
            maskImage.image = UIImage(named: "Mask0\(selectedIndexMask)")
            isSelectedBigButton = false
        }
    }
    
    @IBAction func white2Tapped(_ sender: Any) {
        setIndicators()
        bigImage.image = UIImage(named: "white2")
        indicator4.isHidden = false
        if isSelectedBigButton && selectedIndexMask != 0 {
            maskImage.image = UIImage(named: "Mask0\(selectedIndexMask)")
            isSelectedBigButton = false
        }
    }
    
    @IBAction func originalTapped(_ sender: Any) {
        setIndicators()
        bigImage.image = UIImage(named: "colorwheel")
        indicator3.isHidden = false
        if isSelectedBigButton && selectedIndexMask != 0 {
            maskImage.image = UIImage(named: "Mask0\(selectedIndexMask)")
            isSelectedBigButton = false
        }
    }
    
    @IBAction func intensive2Tapped(_ sender: Any) {
        setIndicators()
        bigImage.image = UIImage(named: "intensive2")
        indicator2.isHidden = false
        if isSelectedBigButton && selectedIndexMask != 0 {
            maskImage.image = UIImage(named: "Mask0\(selectedIndexMask)")
            isSelectedBigButton = false
        }
    }
    
    var isFirstTapped = false
    
    @IBAction func intensive1Tapped(_ sender: Any) {
        setIndicators()
        if  isFirstTapped {
            if selectedIndexMask != 0 {
                bigImage.image = UIImage(named: "intensive1")
                isFirstTapped = !isFirstTapped
            }
            if isSelectedBigButton {
                bigImage.image = UIImage(named: "intensive1")
                isFirstTapped = !isFirstTapped
            } else {
                if selectedIndexMask == 0 {
                    bigImage.image = UIImage(named: "wheelwithtext")
                    maskImage.image = nil
                    isFirstTapped = !isFirstTapped
                }
            }
        } else {
            bigImage.image = UIImage(named: "intensive1")
            isFirstTapped = !isFirstTapped
        }
        indicator1.isHidden = false
    }
    
    @available(iOS 13.0, *)
    @IBAction func bigButtonTapped(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "nonConsumablePurchaseMade") {
            if selectedIndexMask != 0 {
                setIndicators()
                if isSelectedBigButton {
                    bigImage.image = UIImage(named: "intensive1")
                    maskImage.image = UIImage(named: "Mask0\(selectedIndexMask)")
                    isSelectedBigButton = false
                } else {
                    maskImage.image = UIImage(named: "BigMask\(selectedIndexMask)")
                    isSelectedBigButton = true
                }
                indicator1.isHidden = false
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
    
    //MARK:- NEW ROTATION
    
    func angle(from location: CGPoint) -> CGFloat {
        let deltaY = location.y - view.center.y
        let deltaX = location.x - view.center.x
        let angle = atan2(deltaY, deltaX) * 180 / .pi
        return angle < 0 ? abs(angle) : 360 - angle
    }
    
    fileprivate let rotateAnimation = CABasicAnimation()
    func rotate(to: CGFloat, duration: Double = 0) {
        rotateAnimation.fromValue = to
        rotateAnimation.toValue = to
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = 0
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.fillMode = CAMediaTimingFillMode.forwards
        rotateAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        maskImage.layer.add(rotateAnimation, forKey: "transform.rotation.z")
    }
    
    fileprivate var rotation: CGFloat = UserDefaults.standard.rotation
    fileprivate var startRotationAngle: CGFloat = 0
    @objc func pan(_ gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: view)
        let gestureRotation = CGFloat(angle(from: location)) - startRotationAngle
        switch gesture.state {
        case .began:
            // set the start angle of rotation
            startRotationAngle = angle(from: location)
        case .changed:
            rotate(to: rotation - gestureRotation.degreesToRadians)
        case .ended:
            // update the amount of rotation
            rotation -= gestureRotation.degreesToRadians
        default :
            break
        }
        // save the final position of the rotation to defaults
        UserDefaults.standard.rotation = rotation
    }
}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

extension UserDefaults {
    /// rotation persistant computed property
    var rotation: CGFloat {
        get {
            return CGFloat(double(forKey: "rotation"))
        }
        set {
            set(Double(newValue), forKey: "rotation")
        }
    }
}
