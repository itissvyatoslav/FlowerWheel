//
//  ShowcaseViewController.swift
//  Flower Wheel
//
//  Created by Svyatoslav Vladimirovich on 09.08.2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import UIKit
import StickerView

class ShowcaseViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    @IBOutlet weak var backgroundCollectionView: UICollectionView!
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    @IBOutlet weak var addingPhotosCollectionView: UICollectionView!
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var imagesView: UIView!
    
    @IBOutlet weak var addStickerButton: UIButton!
    
    
    
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
    var bigCollection = [UIImage]()
    
    var isSendingToStickers = false
    
    override func viewDidLoad() {
        setButtonsTapped()
        collectionHeight.constant = 0
        super.viewDidLoad()
        setCollectionView()
        setArrays()
        addStickerButton.layer.cornerRadius = 15
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
        
        for number in 8..<36 {
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
        selectedStickerView = nil
        _selectedStickerView = nil
        let image = createImage(from: imagesView)
        let imageData = image.pngData()!
        let compressedImage = UIImage(data: imageData)
        UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
    }
    
    func createImage(from aView:UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: aView.frame.width, height: aView.frame.height), true, 0)
        aView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    @IBAction func addTapped(_ sender: Any) {
        bigImage.contentMode = .scaleAspectFit
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if isSendingToStickers {
            //if let selectedImage = info[.originalImage] as? UIImage {
            //    self.initialize(image: selectedImage)
            //}
            if let selectedImage = info[.editedImage] as? UIImage {
                self.initialize(image: selectedImage)
            }
        } else {
            if let selectedImage = info[.originalImage] as? UIImage {
                bigImage.image = selectedImage
            }
            if let selectedImage = info[.editedImage] as? UIImage {
                bigImage.image = selectedImage
            }
        }
        isSendingToStickers = false
        
        dismiss(animated: true, completion: nil)
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
        bigCollection = showcases
        collection = miniShowcases
        addingPhotosCollectionView.reloadData()
        collectionHeight.constant = self.view.frame.height * 0.4
        setButtonsTapped()
        button0.isHidden = true
        button0Tapped.isHidden = false
    }
    
    @IBAction func button1Tapped(_ sender: Any) {
        setButtons()
        bigCollection = vases
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
        bigCollection = vaseFlowers
        collection = miniVaseFlowers
        addingPhotosCollectionView.reloadData()
        collectionHeight.constant = self.view.frame.height * 0.4
        setButtonsTapped()
        button2Tapped.isHidden = false
        button2.isHidden = true
    }
    
    @IBAction func button3Tapped(_ sender: Any) {
        setButtons()
        bigCollection = flowers
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
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK:- STICKER
    
    private var _selectedStickerView:StickerView?
    var selectedStickerView:StickerView? {
        get {
            return _selectedStickerView
        }
        set {
            // if other sticker choosed then resign the handler
            if _selectedStickerView != newValue {
                if let selectedStickerView = _selectedStickerView {
                    selectedStickerView.showEditingHandlers = false
                }
                _selectedStickerView = newValue
            }
            // assign handler to new sticker added
            if let selectedStickerView = _selectedStickerView {
                selectedStickerView.showEditingHandlers = true
                selectedStickerView.superview?.bringSubviewToFront(selectedStickerView)
            }
        }
    }
    
    func initialize(image: UIImage){
        let testImage = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: image.size.width/8, height: image.size.height/8))
        testImage.image = image
        
        let stickerView3 = StickerView.init(contentView: testImage)
        stickerView3.center = CGPoint.init(x: self.view.bounds.width / 2, y: self.view.bounds.height / 4)
        stickerView3.delegate = self
        stickerView3.setImage(UIImage.init(named: "Close")!, forHandler: StickerViewHandler.close)
        stickerView3.setImage(UIImage.init(named: "Rotate")!, forHandler: StickerViewHandler.rotate)
        stickerView3.setImage(UIImage.init(named: "Flip")!, forHandler: StickerViewHandler.flip)
        stickerView3.showEditingHandlers = false
        //self.bigImage.addSubview(stickerView3)
        self.imagesView.addSubview(stickerView3)
        
        // first off assign handler to stickerView
        self.selectedStickerView = stickerView3
    }
    
    @IBAction func tap(_ sender:UITapGestureRecognizer) {
        self.selectedStickerView?.showEditingHandlers = false
    }
    
    
    @IBAction func addStickerTapped(_ sender: Any) {
        isSendingToStickers = true
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
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
        
        if collectionView == backgroundCollectionView {
            bigImage.contentMode = .scaleToFill
            if indexPath.item == 3 {
                bigImage.image =  nil
            } else if indexPath.item < 8 {
                bigImage.image = UIImage(named: "background\(indexPath.item + 1)")
            } else {
                bigImage.image = UIImage(named: "bigBackground\(indexPath.item + 1)")
            }
        }
        
        if collectionView == addingPhotosCollectionView {
            self.initialize(image: bigCollection[indexPath.row])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.addingPhotosCollectionView{
            return CGSize(width: 90, height: 90)
        } else {
            return CGSize(width: 42, height: 42)
        }
    }
}

// MARK:- STICKER EXTENSION

extension ShowcaseViewController: StickerViewDelegate{
    func stickerViewDidTap(_ stickerView: StickerView) {
        self.selectedStickerView = stickerView
    }
    
    func stickerViewDidBeginMoving(_ stickerView: StickerView) {
        self.selectedStickerView = stickerView
    }
    
    /// Other delegate methods which we not used currently but choose method according to your event and requirements.
    func stickerViewDidChangeMoving(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidEndMoving(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidBeginRotating(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidChangeRotating(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidEndRotating(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidClose(_ stickerView: StickerView) {
        
    }
}
