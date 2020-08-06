//
//  InfoViewController.swift
//  Flower Wheel
//
//  Created by Svyatoslav Vladimirovich on 06.08.2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController{
    //MARK:- OUTLETS MATCHES
    
    @IBOutlet weak var matchesLabel: UILabel!
    @IBOutlet weak var MatchesTextView: UITextView!
    @IBOutlet weak var MatchesPlus: UILabel!
    @IBOutlet weak var MatchesHeight: NSLayoutConstraint!
    var isMatchTapped = false
    
    //MARK:- COLORS
    
    @IBOutlet weak var colorsLabel: UILabel!
    @IBOutlet weak var ColorsPlus: UILabel!
    @IBOutlet weak var ColorsHeight: NSLayoutConstraint!
    var isColorsTapped = false
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var miniLabel1: UITextView!
    
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setFirstView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
    }
    
    private func setFirstView(){
        ColorsHeight.constant = 0
        MatchesHeight.constant = 0
    }
    
    private func setText(){
        MatchesTextView.text = "Прежде чем начать работу с цветочным кругом определите:\n\n1. Сколько цветов или оттенков есть у выбранного растения.\n\n2. Какого цвета больше - к тому сектору на цветочном круге и будет относится растение?\n\n3. Можете убрать не подходящие цвета ( трансформировать, обрезать, покрасить)? Если нет - необходимо учитывать все цвета для подборки цветовых сочетаний, которые есть у растения, включая зелень, прожилки, плоды.\n\n4. Определите один доминирующий цвет для букета - которого возьмете от 60-90% по массе. Доминирующий цвет может быть представлен в разных оттенках.\n\n5. Сколько цветов вы хотите сочетать: два, три, четыре, пять.\n\n6. Какой оттенок будет у букета: теплый или холодный?\n\n7. Определите будут сочетания цвета в нюансе ( похожие, соседние, ордственные ) или в контрасте (разные, противоположные)"
        subLabel.text = "чистые цвета с добавлением\nбелого"
        miniLabel1.text = "Светлые цвета. Самые популяные для свадебной или торжественной флористики. Эти оттенки всегда легко сочетаются между собой в любой схеме и даже без цветовой схемы. Новичку лекго создавать контрастные букеты без пятен и провалов в этих оттенках."
    }
    
    //MARK: - ACTIONS
    
    @IBAction func selectedMatches(_ sender: Any) {
        if isMatchTapped{
            matchesLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
            MatchesHeight.constant = 0
            MatchesPlus.text = "+"
            isMatchTapped = false
        } else {
            matchesLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            MatchesHeight.constant = 465
            MatchesPlus.text = "-"
            isMatchTapped = true
        }
    }
    
    @IBAction func selectedColors(_ sender: Any) {
        if isColorsTapped{
            colorsLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
            ColorsHeight.constant = 0
            ColorsPlus.text = "+"
            isColorsTapped = false
        } else {
            colorsLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            ColorsHeight.constant = 1115
            ColorsPlus.text = "-"
            isColorsTapped = true
        }
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
