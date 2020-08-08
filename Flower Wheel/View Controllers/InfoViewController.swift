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
    
    @IBOutlet weak var viewColors: UIView!
    @IBOutlet weak var colorsLabel: UILabel!
    @IBOutlet weak var ColorsPlus: UILabel!
    @IBOutlet weak var ColorsHeight: NSLayoutConstraint!
    var isColorsTapped = false
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var miniLabel1: UITextView!
    @IBOutlet weak var miniLabel2: UITextView!
    @IBOutlet weak var miniLabel3: UITextView!
    @IBOutlet weak var miniLabel4: UITextView!
    
    //MARK:- COLDWARM
    
    @IBOutlet weak var coldWarmView: UIView!
    @IBOutlet weak var coldwarmLabel: UILabel!
    @IBOutlet weak var coldwarmPlus: UILabel!
    @IBOutlet weak var coldWarmHeight: NSLayoutConstraint!
    var isColdWarmTapped = false
    
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
        viewColors.isHidden = true
        ColorsHeight.constant = 0
        MatchesHeight.constant = 0
    }
    
    private func setText(){
        MatchesTextView.text = "Прежде чем начать работу с цветочным кругом определите:\n\n1. Сколько цветов или оттенков есть у выбранного растения.\n\n2. Какого цвета больше - к тому сектору на цветочном круге и будет относится растение?\n\n3. Можете убрать не подходящие цвета ( трансформировать, обрезать, покрасить)? Если нет - необходимо учитывать все цвета для подборки цветовых сочетаний, которые есть у растения, включая зелень, прожилки, плоды.\n\n4. Определите один доминирующий цвет для букета - которого возьмете от 60-90% по массе. Доминирующий цвет может быть представлен в разных оттенках.\n\n5. Сколько цветов вы хотите сочетать: два, три, четыре, пять.\n\n6. Какой оттенок будет у букета: теплый или холодный?\n\n7. Определите будут сочетания цвета в нюансе ( похожие, соседние, ордственные ) или в контрасте (разные, противоположные)"
        subLabel.text = "чистые цвета с добавлением\nбелого"
        miniLabel1.text = "Светлые цвета. Самые популяные для свадебной или торжественной флористики. Эти оттенки всегда легко сочетаются между собой в любой схеме и даже без цветовой схемы. Новичку лекго создавать контрастные букеты без пятен и провалов в этих оттенках."
        miniLabel2.text = "Чистые оттенки. всегда яркие, сочные букеты. такие букеты больше всего нравятся мужчинам, смотрятся хорошо при оформлении официальных мероприятий или сцены, если хорошо подсвечены. Отлично смотрятся для аранжировки на открутом воздухе или в больших пустых пространствах, на нейтральном фоне. Сочетать такие оттенки нужно применяя принцип \"тотального доминирования\" - когда одного цвета критически больше по массе. Например 75/15 или 90/10"
        miniLabel3.text = "Приглушенные (чистый цвет с добавлением серого) - это тусклые и спокойные оттенки. Отношение к таким цветам у клиента неоднозначное, цветов таких отенков на рынке не так много, как чистых и выбеленных.редко бывают натуральные, такие оттенки получают путем покраски светлых или белых цветков. Смотрятся в букете лучше в сочетании с выбеленными, чистыми, зачерненными. Создавать монобукеты из таких оттенков сложнее."
        miniLabel4.text = "Тёмные и глубокие оттенки. Создавая букет только из зачернённых оттенков цветов и зелени получим мрачный, тёмный букет. Зачернённых оттенков в природе много, часто они встречаются в прожилках, плодах растений. В коммерческой флористике букет только из зачернённых оттенков собирается редко и не пользуется спросом. Сочетание зачернённых оттенков и выбеленных приводит к пятнам, шахматным букетам. Рекомендуем сочетать зачернённый оттенки в малой массе. Например, в пропорции 5/95 или 10/90 от общей массы букета."
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
            viewColors.isHidden = true
            ColorsHeight.constant = 0
            ColorsPlus.text = "+"
            isColorsTapped = false
        } else {
            colorsLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            viewColors.isHidden = false
            ColorsHeight.constant = 1115
            ColorsPlus.text = "-"
            isColorsTapped = true
        }
    }
    
    @IBAction func selectedColdWarm(_ sender: Any) {
        if isColdWarmTapped{
            coldwarmLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
            coldWarmHeight.constant = 0
            coldwarmPlus.text = "+"
            isColdWarmTapped = false
        } else {
            coldwarmLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            coldWarmHeight.constant = 720
            coldwarmPlus.text = "-"
            isColdWarmTapped = true
        }
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
