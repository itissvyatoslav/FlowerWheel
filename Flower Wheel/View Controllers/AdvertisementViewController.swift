//
//  AdvertisementViewController.swift
//  Flower Wheel
//
//  Created by Svyatoslav Vladimirovich on 17.07.2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import UIKit
import StoreKit

class AdvertisementViewController: UIViewController{
    
    @IBOutlet weak var cornerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descrLabel: UILabel!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var payButtonView: UIView!
    @IBOutlet weak var restoreLabel: UILabel!
    
    
    var idVC = "default  id" // Для перехода на нужный VC
    
    //MARK:- IAP
    
    var myProduct: SKProduct?
    
    func fetchProduct(){
        let request = SKProductsRequest(productIdentifiers: [subscribe_id])
        request.delegate = self
        request.start()
    }
    
    let subscribe_id = "flowerwheel.softweather"

    var nonConsumablePurchaseMade = UserDefaults.standard.bool(forKey: "nonConsumablePurchaseMade")
    
    
    let gradientLayer = CAGradientLayer()
    
    override func viewWillAppear(_ animated: Bool) {
        if DataModel.sharedData.cameFromPay {
            navigationController?.popViewController(animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        fetchProduct()
    }
    
    private func setView(){
        setButton()
        restoreLabel.text = "Восстановить\nпокупки"
        cornerView.layer.cornerRadius = 16
        nameLabel.text = "Flower Wheel"
        descrLabel.text = "Доступ ко всем платным переходам, эффектам, стикерам."
        payLabel.text = "Платеж списывается через App Store после подтверждения покупки. Сумма автоматически спишется после окончания 7 пробных дней, если ее не отменить не позже, чем за 24 часа до момента окончания, и отмена вступает в силу в конце текущего периода. Управлять подписками и отключить автоматическое списание можно в настройках учетной записи App Store. За покупку, отмененную в ходе пробного периода средства списываться не будут."
    }
    
    private func setButton(){
        
        payButtonView.layer.addSublayer(gradientLayer)
        //gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: payButtonView.frame.size.width, height: payButtonView.frame.size.height)
        gradientLayer.colors = [UIColor(red: 35/255, green: 54/255, blue: 121/255, alpha: 1).cgColor, UIColor(red: 87/255, green: 110/255, blue: 194/255, alpha: 1).cgColor]
        payButtonView.layer.cornerRadius = 30.5
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    @available(iOS 13.0, *)
    @IBAction func payTapped(_ sender: Any) {
        guard let myProduct = myProduct else {
            return
        }
        
        if SKPaymentQueue.canMakePayments() {
            let payment = SKPayment(product: myProduct)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
        }
        
        //DataModel.sharedData.isPayed = true
        DataModel.sharedData.cameFromPay = true
        //purchaseMyProduct()
    }
    
    @IBAction func agreementTapped(_ sender: Any) {
        print("agreement")
    }
    
    @IBAction func restoreTapped(_ sender: Any) {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    
    @available(iOS 13.0, *)
    func goNextVC(){
        if idVC == "BouquetsViewController" {
            let vc = self.storyboard?.instantiateViewController(identifier: "BouquetsViewController") as! BouquetsViewController
            self.navigationController?.pushViewController(vc, animated: false)
            
        }
        
        if idVC == "ColorWheelViewController" {
            let vc = self.storyboard?.instantiateViewController(identifier: "ColorWheelViewController") as! ColorWheelViewController
            self.navigationController?.pushViewController(vc, animated: false)
        }
        
        if idVC == "ShowcaseViewController" {
            let vc = self.storyboard?.instantiateViewController(identifier: "ShowcaseViewController") as! ShowcaseViewController
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
}

extension AdvertisementViewController: SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if let product = response.products.first {
            myProduct = product
            print(product.productIdentifier)
            print(product.price)
            print(product.localizedTitle)
            print(product.localizedDescription)
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing:
                break
            case .purchased, .restored:
                nonConsumablePurchaseMade = true
                UserDefaults.standard.set(nonConsumablePurchaseMade, forKey: "nonConsumablePurchaseMade")
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                if #available(iOS 13.0, *) {
                    goNextVC()
                }
                break
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                break
            default:
                break
            }
        }
        
        
        
    }
    
    func canMakePurchases() -> Bool {  return SKPaymentQueue.canMakePayments()  }
    
    func purchaseMyProduct(product: SKProduct) {
        
    }
}
