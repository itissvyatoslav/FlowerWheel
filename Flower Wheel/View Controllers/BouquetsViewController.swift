//
//  BouquetsViewController.swift
//  Flower Wheel
//
//  Created by Svyatoslav Vladimirovich on 18.07.2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import UIKit

class BouquetsViewController: UIViewController {
    
    var isPayed = false
    
    let backgrounds = [UIImage(named: "background1"), UIImage(named: "background2"), UIImage(named: "background3"), UIImage(named: "background4"), UIImage(named: "background5"), UIImage(named: "background6"), UIImage(named: "background7"), UIImage(named: "background8"), UIImage(named: "background9"), UIImage(named: "background10")]
    
    var flowers = [UIImage?]()
    
    var collection = [UIImage?]()
    
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var backgroundCollectionView: UICollectionView!
    @IBOutlet weak var addingPhotosView: UIView!
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button0Tapped: UIButton!
    @IBOutlet weak var button1Tapped: UIButton!
    @IBOutlet weak var button2Tapped: UIButton!
    @IBOutlet weak var button3Tapped: UIButton!
    
    @IBOutlet weak var addingPhotosCollectionView: UICollectionView!
    
    var isButton0Tapped = false
    var isButton1Tapped = false
    var isButton2Tapped = false
    var isButton3Tapped = false
    
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        collectionHeight.constant = 120
        super.viewDidLoad()
        setCollectionView()
        setButtons()
        setViews()
    }
    
    private func setViews(){
        viewHeight.constant = 0
    }
    
    private func setButtons(){
        button0Tapped.isHidden = true
        button1Tapped.isHidden = true
        button2Tapped.isHidden = true
        button3Tapped.isHidden = true
    }
    
    private func setCollectionView(){
        backgroundCollectionView.delegate = self
        backgroundCollectionView.dataSource = self
        let cellBackground = UINib(nibName: "BackgroundCell",
                                  bundle: nil)
        self.backgroundCollectionView.register(cellBackground,
                                               forCellWithReuseIdentifier: "BackgroundCell")
        let cellAdd = UINib(nibName: "AddImage",
                                  bundle: nil)
        self.backgroundCollectionView.register(cellAdd,
                                               forCellWithReuseIdentifier: "AddImage")
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        print("save")
    }
    
    @IBAction func addBackgroundTapped(_ sender: Any) {
        print("addBackGround")
    }
    
    //MARK:- BUTTONS BOTTOM
    
    private func setTapIndicators(){
        isButton0Tapped = false
        isButton1Tapped = false
        isButton2Tapped = false
        isButton3Tapped = false
    }
    
    @IBAction func button0Tapped(_ sender: Any) {
        collection = flowers
        setButtons()
        button0Tapped.isHidden = false
        viewHeight.constant = self.view.frame.height * 0.3
        collectionHeight.constant = viewHeight.constant
        isButton0Tapped = true
    }
    
    @IBAction func button0DoubleTapped(_ sender: Any) {
        viewHeight.constant = 0
        setButtons()
        isButton0Tapped = false
    }
    
    
    @IBAction func button1Tapped(_ sender: Any) {
        setButtons()
        button1Tapped.isHidden = false
        viewHeight.constant = self.view.frame.height * 0.2
    }
    
    @IBAction func button1DoubleTapped(_ sender: Any) {
        viewHeight.constant = 0
        setButtons()
        isButton1Tapped = false
    }
    
    @IBAction func button2Tapped(_ sender: Any) {
        setButtons()
        button2Tapped.isHidden = false
        viewHeight.constant = self.view.frame.height * 0.3
    }
    
    @IBAction func button2DoubleTapped(_ sender: Any) {
        viewHeight.constant = 0
        setButtons()
        isButton2Tapped = false
    }
    
    @IBAction func button3Tapped(_ sender: Any) {
        setButtons()
        button3Tapped.isHidden = false
        viewHeight.constant = self.view.frame.height * 0.2
    }
    
    @IBAction func button3DoubleTapped(_ sender: Any) {
        viewHeight.constant = 0
        setButtons()
        isButton3Tapped = false
    }
}

// MARK:- EXTENSION

extension BouquetsViewController: UICollectionViewDelegate,  UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == backgroundCollectionView {
            return backgrounds.count
        }
        if collectionView == addingPhotosCollectionView {
            print("NUMBER \(collection.count)")
            return collection.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == backgroundCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BackgroundCell", for: indexPath) as? BackgroundCell{
                cell.imageBackground.image = backgrounds[indexPath.item]
                return cell
            }
            return UICollectionViewCell()
        }
        if collectionView == addingPhotosCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddImage", for: indexPath) as? AddImage {
                cell.imageView.image = collection[indexPath.item]
                return cell
            }
            return UICollectionViewCell()
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 3 {
            bigImage.image =  nil
        } else if indexPath.item < 8 {
            bigImage.image = UIImage(named: "background\(indexPath.item + 1)")
        } else {
            bigImage.image = UIImage(named: "bigBackground\(indexPath.item + 1)")
        }
    }
}
