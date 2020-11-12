//
//  BouquetsViewController.swift
//  Flower Wheel
//
//  Created by Svyatoslav Vladimirovich on 18.07.2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import UIKit
import StickerView

class BouquetsViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var isPayed = false
    
    let backgrounds = [UIImage(named: "background1"), UIImage(named: "background2"), UIImage(named: "background3"), UIImage(named: "background4"), UIImage(named: "background5"), UIImage(named: "background6"), UIImage(named: "background7"), UIImage(named: "background8"), UIImage(named: "background9"), UIImage(named: "background10")]
    
    var flowers = [UIImage]()
    var miniFlowers = [UIImage]()
    
    var packs = [UIImage]()
    var miniPacks = [UIImage]()
    
    var green = [UIImage]()
    var miniGreen = [UIImage]()
    
    var decor = [UIImage]()
    var miniDecor = [UIImage]()
    
    var collection = [UIImage?]()
    var bigCollection = [UIImage]()
    
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var backgroundCollectionView: UICollectionView!
    @IBOutlet weak var addingPhotosView: UIView!
    @IBOutlet weak var imagesView: UIView!
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button0Tapped: UIButton!
    @IBOutlet weak var button1Tapped: UIButton!
    @IBOutlet weak var button2Tapped: UIButton!
    @IBOutlet weak var button3Tapped: UIButton!
    
    @IBOutlet weak var addStickerButton: UIButton!
    
    @IBOutlet weak var addingPhotosCollectionView: UICollectionView!
    var isSendingToStickers = false
    
    var isButton0Tapped = false
    var isButton1Tapped = false
    var isButton2Tapped = false
    var isButton3Tapped = false
    
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        setArrays()
        collection = flowers
        collectionHeight.constant = 120
        super.viewDidLoad()
        setCollectionView()
        setButtons()
        setViews()
    }
    
    @IBAction func addStickerTapped(_ sender: Any) {
        isSendingToStickers = true
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    private func setArrays(){
        for number in 0..<47 {
            flowers.append(UIImage(named: "flower\(number)")!)
            miniFlowers.append(UIImage(named: "miniFlowers\(number)")!)
        }
        for number in 1..<12 {
            packs.append(UIImage(named: "pack\(number)")!)
            miniPacks.append(UIImage(named: "miniPack\(number)")!)
        }
        for number in 1..<24 {
            green.append(UIImage(named: "green\(number)")!)
            miniGreen.append(UIImage(named: "miniGreen\(number)")!)
        }
        
        for number in 1..<32 {
            decor.append(UIImage(named: "decor\(number)")!)
            miniDecor.append(UIImage(named: "miniDecor\(number)")!)
        }
    }
    
    private func setViews(){
        addStickerButton.layer.cornerRadius = 15
        viewHeight.constant = 0
        labelFilter.text = "ОРИГИНАЛ"
        imageFilter.image = UIImage(named: "filter2")
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
        addingPhotosCollectionView.delegate = self
        addingPhotosCollectionView.dataSource = self
        let cellBackground = UINib(nibName: "BackgroundCell",
                                  bundle: nil)
        self.backgroundCollectionView.register(cellBackground,
                                               forCellWithReuseIdentifier: "BackgroundCell")
        let cellAdd = UINib(nibName: "AddImage",
                                  bundle: nil)
        self.addingPhotosCollectionView.register(cellAdd,
                                               forCellWithReuseIdentifier: "AddImage")
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
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
    
    @IBAction func addBackgroundTapped(_ sender: Any) {
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
    
    //MARK:- BUTTONS BOTTOM
    
    private func setTapIndicators(){
        isButton0Tapped = false
        isButton1Tapped = false
        isButton2Tapped = false
        isButton3Tapped = false
    }
    
    @IBAction func button0Tapped(_ sender: Any) {
        bigCollection = flowers
        collection = miniFlowers
        addingPhotosCollectionView.reloadData()
        setButtons()
        button0Tapped.isHidden = false
        viewHeight.constant = self.view.frame.height * 0.4
        collectionHeight.constant = viewHeight.constant
        isButton0Tapped = true
    }
    
    @IBAction func button0DoubleTapped(_ sender: Any) {
        viewHeight.constant = 0
        setButtons()
        isButton0Tapped = false
    }
    
    
    @IBAction func button1Tapped(_ sender: Any) {
        bigCollection = green
        collection = miniGreen
        addingPhotosCollectionView.reloadData()
        setButtons()
        button1Tapped.isHidden = false
        viewHeight.constant = self.view.frame.height * 0.3
    }
    
    @IBAction func button1DoubleTapped(_ sender: Any) {
        viewHeight.constant = 0
        setButtons()
        isButton1Tapped = false
    }
    
    @IBAction func button2Tapped(_ sender: Any) {
        bigCollection = packs
        collection = miniPacks
        addingPhotosCollectionView.reloadData()
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
        bigCollection = decor
        collection = miniDecor
        addingPhotosCollectionView.reloadData()
        setButtons()
        button3Tapped.isHidden = false
        viewHeight.constant = self.view.frame.height * 0.4
    }
    
    @IBAction func button3DoubleTapped(_ sender: Any) {
        viewHeight.constant = 0
        setButtons()
        isButton3Tapped = false
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
        if isOriginal {
            testImage.image = image
        } else {
            testImage.image = convertToGrayScale(image: image)
        }
        
        let stickerView3 = StickerView.init(contentView: testImage)
        stickerView3.center = CGPoint.init(x: self.view.bounds.width / 2, y: self.view.bounds.height / 4)
        stickerView3.delegate = self
        stickerView3.setImage(UIImage.init(named: "Close")!, forHandler: StickerViewHandler.close)
        stickerView3.setImage(UIImage.init(named: "Rotate")!, forHandler: StickerViewHandler.rotate)
        stickerView3.setImage(UIImage.init(named: "Flip")!, forHandler: StickerViewHandler.flip)
        stickerView3.showEditingHandlers = false
        
        self.imagesView.addSubview(stickerView3)
        
        // first off assign handler to stickerView
        self.selectedStickerView = stickerView3
    }
    
    @IBAction func tap(_ sender:UITapGestureRecognizer) {
        self.selectedStickerView?.showEditingHandlers = false
    }
    
    //MARK:- BLACK AND WHITE <-> ORIGINAL
    var isOriginal = true
    var isBigOriginal = true
    
    @IBAction func changeFilter(_ sender: Any) {
        isOriginal = !isOriginal
        if isOriginal {
            imageFilter.image = UIImage(named: "filter2")
            labelFilter.text = "ОРИГИНАЛ"
        } else {
            imageFilter.image = UIImage(named: "filter")
            labelFilter.text = "Ч/Б"
            if let image = bigImage.image {
                if isBigOriginal {
                    bigImage.image = convertToGrayScale(image: image)
                    isBigOriginal = false
                }
            }
        }
        
    }
    
    @IBOutlet weak var labelFilter: UILabel!
    @IBOutlet weak var imageFilter: UIImageView!
    
    
    private func convertToGrayScale(image: UIImage) -> UIImage? {

        // Create image rectangle with current image width/height
       let context = CIContext(options: nil)
        if let filter = CIFilter(name: "CIPhotoEffectNoir") {
            filter.setValue(CIImage(image: image), forKey: kCIInputImageKey)
            if let output = filter.outputImage {
                if let cgImage = context.createCGImage(output, from: output.extent) {
                    return UIImage(cgImage: cgImage)
                }
            }
        }
        return nil
    }
}

// MARK:- EXTENSION

extension BouquetsViewController: UICollectionViewDelegate,  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == backgroundCollectionView {
            return backgrounds.count
        }
        if collectionView == addingPhotosCollectionView {
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
        if collectionView == backgroundCollectionView {
            if indexPath.item == 3 {
                bigImage.image =  nil
            } else if indexPath.item < 8 {
                bigImage.image = UIImage(named: "background\(indexPath.item + 1)")
            } else {
                bigImage.image = UIImage(named: "bigBackground\(indexPath.item + 1)")
            }
            imageFilter.image = UIImage(named: "filter2")
            labelFilter.text = "ОРИГИНАЛ"
            isOriginal = true
            isBigOriginal = true
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

extension BouquetsViewController: StickerViewDelegate{
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
