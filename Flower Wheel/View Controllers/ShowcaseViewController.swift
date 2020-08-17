//
//  ShowcaseViewController.swift
//  Flower Wheel
//
//  Created by Svyatoslav Vladimirovich on 09.08.2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import UIKit

class ShowcaseViewController: UIViewController{
    
    @IBOutlet weak var backgroundCollectionView: UICollectionView!
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    @IBOutlet weak var addingPhotosCollectionView: UICollectionView!
    @IBOutlet weak var bigImage: UIImageView!
    
    let backgrounds = [UIImage(named: "background1"), UIImage(named: "background2"), UIImage(named: "background3"), UIImage(named: "background4"), UIImage(named: "background5"), UIImage(named: "background6"), UIImage(named: "background7"), UIImage(named: "background8"), UIImage(named: "background9"), UIImage(named: "background10")]
    
    var flowers = [UIImage]()
    var miniFlowers = [UIImage]()
    
    var vases = [UIImage]()
    var miniVases = [UIImage]()
    
    var vaseFlowers = [UIImage]()
    var miniVaseFlowers = [UIImage]()
    
    var showcases = [UIImage]()
    var miniShowcases = [UIImage]()
    
    var collection = [UIImage]()
    
    override func viewDidLoad() {
        setButtonsTapped()
        collectionHeight.constant = 0
        super.viewDidLoad()
        setCollectionView()
        setArrays()
    }
    
    private func setArrays(){
        for number in 0..<47 {
            flowers.append(UIImage(named: "flower\(number)")!)
        }
        
        for number in 0..<47 {
            miniFlowers.append(UIImage(named: "miniFlowers\(number)")!)
        }
        
        for number in 1..<15 {
            vases.append(UIImage(named: "vase\(number)")!)
            miniVases.append(UIImage(named: "miniVase\(number)")!)
        }
        
        for number in 1..<36 {
            vaseFlowers.append(UIImage(named: "vaseFlowers\(number)")!)
            miniVaseFlowers.append(UIImage(named: "miniVaseFlowers\(number)")!)
        }
        
        for number in 1..<36 {
            showcases.append(UIImage(named: "showcase\(number)")!)
            miniShowcases.append(UIImage(named: "miniShowcase\(number)")!)
        }
    }
    
    private func setCollectionView(){
        backgroundCollectionView.delegate = self
        backgroundCollectionView.dataSource = self
        addingPhotosCollectionView.delegate = self
        addingPhotosCollectionView.dataSource = self
        let cellBackground = UINib(nibName: "BackgroundCell",
                                  bundle: nil)
        self.backgroundCollectionView.register(cellBackground,
                                               forCellWithReuseIdentifier: "BackgroundCell")
        let imageCell = UINib(nibName: "AddImage",
                                  bundle: nil)
        self.addingPhotosCollectionView.register(imageCell,
                                               forCellWithReuseIdentifier: "AddImage")
    }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }
    
    //MARK:-BUTTONS
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button0Tapped: UIButton!
    @IBOutlet weak var button1Tapped: UIButton!
    @IBOutlet weak var button2Tapped: UIButton!
    @IBOutlet weak var button3Tapped: UIButton!
    
    private func setButtonsTapped(){
        button0Tapped.isHidden = true
        button1Tapped.isHidden = true
        button2Tapped.isHidden = true
        button3Tapped.isHidden = true
    }
    
    private func setButtons(){
        button0.isHidden = false
        button1.isHidden = false
        button2.isHidden = false
        button3.isHidden = false
    }
    
    @IBAction func button0Tapped(_ sender: Any) {
        setButtons()
        collection = miniShowcases
        addingPhotosCollectionView.reloadData()
        collectionHeight.constant = self.view.frame.height * 0.4
        setButtonsTapped()
        button0.isHidden = true
        button0Tapped.isHidden = false
    }
    
    @IBAction func button1Tapped(_ sender: Any) {
        setButtons()
        collection = miniVases
        addingPhotosCollectionView.reloadData()
        addingPhotosCollectionView.reloadData()
        collectionHeight.constant = self.view.frame.height * 0.4
        setButtonsTapped()
        button1Tapped.isHidden = false
        button1.isHidden = true
    }
    
    @IBAction func button2Tapped(_ sender: Any) {
        setButtons()
        collection = miniVaseFlowers
        addingPhotosCollectionView.reloadData()
        collectionHeight.constant = self.view.frame.height * 0.4
        setButtonsTapped()
        button2Tapped.isHidden = false
        button2.isHidden = true
    }
    
    @IBAction func button3Tapped(_ sender: Any) {
        setButtons()
        collection = miniFlowers
        addingPhotosCollectionView.reloadData()
        collectionHeight.constant = self.view.frame.height * 0.4
        setButtonsTapped()
        button3Tapped.isHidden = false
        button3.isHidden = true
    }
    
    @IBAction func button0DoubleTapped(_ sender: Any) {
        setButtons()
        collectionHeight.constant = 0
        setButtonsTapped()
        button0.isHidden = false
    }
    
    @IBAction func button1DoubleTapped(_ sender: Any) {
        setButtons()
        collectionHeight.constant = 0
        setButtonsTapped()
        button1.isHidden = false
    }
    
    @IBAction func button2DoubleTapped(_ sender: Any) {
        setButtons()
        collectionHeight.constant = 0
        setButtonsTapped()
        button2.isHidden = false
    }
    
    @IBAction func button3DoubleTapped(_ sender: Any) {
        setButtons()
        collectionHeight.constant = 0
        setButtonsTapped()
        button3.isHidden = false
    }
}

//MARK:- EXTENSION

extension ShowcaseViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == backgroundCollectionView {
            return backgrounds.count
        } else {
            return collection.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == backgroundCollectionView{
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BackgroundCell", for: indexPath) as? BackgroundCell{
            cell.imageBackground.image = backgrounds[indexPath.item]
            return cell
        }
        return UICollectionViewCell()
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddImage", for: indexPath) as? AddImage{
                cell.imageView.image = collection[indexPath.item]
                return cell
            }
            return UICollectionViewCell()
        }
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
