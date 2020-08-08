//
//  InfoViewController.swift
//  Flower Wheel
//
//  Created by Svyatoslav Vladimirovich on 06.08.2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import UIKit
import SafariServices

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
    @IBOutlet weak var coldWarmTV1: UITextView!
    @IBOutlet weak var coldWarmTV2: UITextView!
    
    //MARK:- BRIGHTNES
    
    @IBOutlet weak var brightnesLabel: UILabel!
    @IBOutlet weak var brightnesPlus: UILabel!
    @IBOutlet weak var brightnesTV: UITextView!
    @IBOutlet weak var brightnesHeight: NSLayoutConstraint!
    @IBOutlet weak var brightnesView: UIView!
    var isBrightnesTapped = false
    
    //MARK:- MASKS
    
    @IBOutlet weak var maskLabel: UILabel!
    @IBOutlet weak var maskPlus: UILabel!
    @IBOutlet weak var maskView: UIView!
    @IBOutlet weak var maskHeight: NSLayoutConstraint!
    var isMasksTapped =  false
    @IBOutlet weak var mask1TV: UITextView!
    @IBOutlet weak var mask2TV: UITextView!
    @IBOutlet weak var mask3TV: UITextView!
    @IBOutlet weak var mask4TV: UITextView!
    @IBOutlet weak var mask5TV: UITextView!
    @IBOutlet weak var mask6TV: UITextView!
    @IBOutlet weak var mask7TV: UITextView!
    @IBOutlet weak var mask8TV: UITextView!
    @IBOutlet weak var mask9TV: UITextView!
    
    //MARK:- BOUQUET
    
    @IBOutlet weak var bouquetLabel: UILabel!
    @IBOutlet weak var bouquetPlus: UILabel!
    @IBOutlet weak var bouquetView: UIView!
    @IBOutlet weak var bouquetTV: UITextView!
    @IBOutlet weak var bouquetHeight: NSLayoutConstraint!
    var isBouquetTapped = false
    
    //MARK:- VIDEO
    
    @IBOutlet weak var videoLabel: UILabel!
    @IBOutlet weak var videoPlus: UILabel!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var videoHeight: NSLayoutConstraint!
    var isVideoTapped = false
    
    //MARK:- INST
    
    @IBOutlet weak var instLabel: UILabel!
    @IBOutlet weak var instPlus: UILabel!
    @IBOutlet weak var instHeight: NSLayoutConstraint!
    @IBOutlet weak var instView: UIView!
    var isInstTapped = false
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
        setFirstView()
    }
    
    private func setFirstView(){
        matchesLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        colorsLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        coldwarmLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        brightnesLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        maskLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        brightnesHeight.constant = 0
        brightnesView.isHidden = true
        coldWarmView.isHidden = true
        coldWarmHeight.constant = 0 
        viewColors.isHidden = true
        ColorsHeight.constant = 0
        MatchesHeight.constant = 0
        maskHeight.constant = 0
        maskView.isHidden = true
        bouquetLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        bouquetHeight.constant = 0
        bouquetView.isHidden = true
        videoLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        videoHeight.constant = 0
        instLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        instView.isHidden = true
        instHeight.constant = 0
    }
    
    //MARK:- TEXT
    
    private func setText(){
        MatchesTextView.text = "Прежде чем начать работу с цветочным кругом определите:\n\n1. Сколько цветов или оттенков есть у выбранного растения.\n\n2. Какого цвета больше - к тому сектору на цветочном круге и будет относится растение?\n\n3. Можете убрать не подходящие цвета ( трансформировать, обрезать, покрасить)? Если нет - необходимо учитывать все цвета для подборки цветовых сочетаний, которые есть у растения, включая зелень, прожилки, плоды.\n\n4. Определите один доминирующий цвет для букета - которого возьмете от 60-90% по массе. Доминирующий цвет может быть представлен в разных оттенках.\n\n5. Сколько цветов вы хотите сочетать: два, три, четыре, пять.\n\n6. Какой оттенок будет у букета: теплый или холодный?\n\n7. Определите будут сочетания цвета в нюансе ( похожие, соседние, ордственные ) или в контрасте (разные, противоположные)"
        subLabel.text = "чистые цвета с добавлением\nбелого"
        miniLabel1.text = "Светлые цвета. Самые популяные для свадебной или торжественной флористики. Эти оттенки всегда легко сочетаются между собой в любой схеме и даже без цветовой схемы. Новичку лекго создавать контрастные букеты без пятен и провалов в этих оттенках."
        miniLabel2.text = "Чистые оттенки. всегда яркие, сочные букеты. такие букеты больше всего нравятся мужчинам, смотрятся хорошо при оформлении официальных мероприятий или сцены, если хорошо подсвечены. Отлично смотрятся для аранжировки на открутом воздухе или в больших пустых пространствах, на нейтральном фоне. Сочетать такие оттенки нужно применяя принцип \"тотального доминирования\" - когда одного цвета критически больше по массе. Например 75/15 или 90/10"
        miniLabel3.text = "Приглушенные (чистый цвет с добавлением серого) - это тусклые и спокойные оттенки. Отношение к таким цветам у клиента неоднозначное, цветов таких отенков на рынке не так много, как чистых и выбеленных.редко бывают натуральные, такие оттенки получают путем покраски светлых или белых цветков. Смотрятся в букете лучше в сочетании с выбеленными, чистыми, зачерненными. Создавать монобукеты из таких оттенков сложнее."
        miniLabel4.text = "Тёмные и глубокие оттенки. Создавая букет только из зачернённых оттенков цветов и зелени получим мрачный, тёмный букет. Зачернённых оттенков в природе много, часто они встречаются в прожилках, плодах растений. В коммерческой флористике букет только из зачернённых оттенков собирается редко и не пользуется спросом. Сочетание зачернённых оттенков и выбеленных приводит к пятнам, шахматным букетам. Рекомендуем сочетать зачернённый оттенки в малой массе. Например, в пропорции 5/95 или 10/90 от общей массы букета."
        coldWarmTV1.text = "Эти цвета психологически воспинимаются, как тёплые, так как содежат больше жёлтого."
        coldWarmTV2.text = "Эти цвета воспринимаются холодными, так как содержат больше синего.\n\nСочетание цвета по температуре в букете может быть в видимом контрасте (противопостовление) или ньюансе (схожесть). Например, выберете только тёплые цвета растений, упаковки, декора. Такая температуа будет в нюансе - теплый букет. Если вы хотите совмещать тёплые и холодные тона, нужно определиться какая температура будет доминировать. Например: холодные цвета взять в пропорции 80% от всего букета, а тёплые в пропорции 20%. Это будет видимый температурный контраст. Есть тона, которые являются промежуточными и могут менять температуру в зависимости от окружения. К таким тонам относятся выбеленные (высветленные оттенки, зачерненные). Например светло желтые розы - могут быть тёплыми, если будет окружение оранжевых роз, и холодными, если будет окружение светло-синих.\n\nДля того, чтобы вам было легче разобраться, мы приготовили для вас видео урок с примерами и подробным разбором. Посмотрите в разделе \"видео уроки\"."
        brightnesTV.text = "Светлота важное свойство цвета, понимание светлоты помогает флористу избежать пятен в букете, эффекта шахматной доски. Простая проверка - переведите ваш букет в чёрно-белый режим. Гармоничный по светлоте букет будет серым, без белых пятен и черных провалов. Весь секрет в пропорции тона и цвета.\n\nКак понять какого тона, какого цвета сколько брать и как совмещать между собой? Нужно знать правила совмещения темного и светлого во флористике. Мы упростили задачу и составили специальную маску светлоты. Это пример беспроигрышного гармоничного сочетания насыщенности. Схема светлоты показывает вам какую пропорцию цвета и тона бать в букете. Простыми словами: при переходе от черного к белому берите промежуточные оттенки, отдавайте предпочтение одному доминирующему цвету, которого возьмете гораздо больше в пропорции к остальным. Дополнительные оттенки совмещайте с главным, согласно таблице светлоты. Пример таблицы светлоты чистых цветов: 100%- отдает белый цвет , 75% света отдает желтый, 65% света оранжевый, 50% отдают красный и зеленый, 35% отдает синий, и 25% фиолетовый и 0% условно отдает света черный. Старайтесь в одном букете совмещать цвета по оттенкам так, чтобы они отдавали примерно одинаковое количество света. Хотите разобраться в этой теме подробнее? Посмотреть больше примеров, наглядных работ - переходите по ссылкам в разделе “Видео уроки” или “Наш инстаграм”."
        mask1TV.text = "Цветовое колесо состоит из 12 сегментов. Как совмещать цвета между собой покажут цветовые схемы."
        mask2TV.text = "Монохромное сочетание - сочетание оттенков одного цвета (один сегмент), но разных по насыщенности. Например: красный чистый, красный выбеленный, красный тусклый и зачернённый. Это сочетание всегда беспроигрышное, гармоничное, спокойное."
        mask3TV.text = "Сочетание трёх соседних цветов. Например, жёлто-оранжевый, оранжевый, красно-оранжевый. Спокойное, гармоничное, простое в работе сочетание. Можно встретить название этой схемы как: аналоговая триада, аналоговое сочетания 3 цветов, родственное сочетание."
        mask4TV.text = "Аналоговая схема, сочетающая от 2 до 5 цветовых секторов в одном букете. Сочетание соседних 2-х, 3-х, 4-х или 5 цветов. Более яркое, но гармоничное сочетание родственных цветов. Это сочетание позволяет совмещать в одном букете до 5 цветов цветочного круга. Простое в работе, безошибочное сочетание для яркого букета со спокойным переходом без контрастов."
        mask5TV.text = "Противоположные секторы круга, еще называют это сочетание комплементарным или дополняющим. Эта схема позволяет сочетать в букете 2 контрастных цвета. Букет получается яркий и сочный. Чтобы избежать пятен в букете - выберете один цвет главным и вставьте в букет его от 70% . Учитывайте светлоту каждого выбранного цвета, чтобы подобрать сочетание по тону. Воспользуйтесь маской светолоты."
        mask6TV.text = "Классическая триада - это три цвета равноудаленных друг от друга в цветовом колесе. Яркое сильное цветовое сочетание. Букет может содержать до 3 контрастных цветов. Чтобы получить гармоничный букет, выберете один цвет главным, учитывайте светлоту оттенков. Не берите 3 цвета в равной пропорции, воспользуйтесь маской светлоты."
        mask7TV.text = "Раздельная комплементарная триада - три цвета, но более спокойное сочетание, в отличие от классической триады. Букет может содержать до 3 контрастных цветов. Чтобы получить гармонию в контрастном букете, необходимо выбрать один главный цвет, остальные цвета подобрать согласно оттенкам светлоты."
        mask8TV.text = "Тетрада прямоугольная - это 4 контрастных цвета, которые можно сочетать в одном букете. Богатая пара 4 цветов. Такие букеты получаются разноцветными и насыщенными. Эта удобная схема совмещения с зелёным, так как этот цвет почти всегда неотъемлемый в букете. Чтобы получить гармонию в таком ярком букете, выберете один цвет доминирующим, работайте с насыщенностью оттенков. Для этого воспользуйтесь маской светлоты."
        mask9TV.text = "Тетрада квадратная - эта схема одна из самых модных, ярких. Сочетание 4 равноудалённых цветов в цветовом круге. Такая схема часто может стать причиной пятнистого букета. Чтобы этого не произошло, выберете один главный цвет, возьмите его больше в % соотношении, а остальные подберите согласно светлоте. Воспользуйтесь маской светлоты.\n\nНачинающему флористу сложно сочетать цвета без опыта. Поможет простое упражнение - анализируйте работы флористов в интернете, разбирайте готовые букеты согласно схемам. Тренируйте насмотренность вместе с нами. Наглядные примеры цветовых сочетаний, согласно цветовому колесу, можно посмотеть в нашем инстаграме."
        bouquetTV.text = "Для большинства букетов фоном будет считаться стена холодильника в вашем цветочном или фон для фото в каталог. Фоном для букета может быть упаковка, если она доминирует и создает задний план по полному абрису букета (крайним точкам). Например односторонние букеты часто упаковываются с задним фоном.\n\nЦвет фона должен или подходить букету (работает любая из цветовых схем цветового круга), или быть нейтральным - ахроматичным. Ахроматичные цвета - черный, белый, серый. Выбирайте для ваших фото подходящий фон, который гармонично сочетается по цвету и свету с букетом. Например, для светлых букетов подойдут светлые тона фона, для ярких - тёмные.\n\nВитрина цветочного лучше смотрится с букетами и срезкой, если будет в ахроматичных цветах. Например, чёрный, серый, зачернённые оттенки. Белый цвет не подходит для витрины цветочного, так как отражает максимум света и берет всё внимание на себя. Витрина смотрится пустая, даже если внутри много цветов.\n\nВыбирая дизайн упаковки для букета, которая будет являться фоном, учитывайте её сочетание в букете, так же как и цветы. Упаковка, лента, декор, зелень - это все части букета. Выбирая их, необходимо работать согласно схемам в контрасте или нюансе. Хотите узнать больше? Смотрите наши видео уроки."
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
            coldWarmView.isHidden = true
            coldwarmPlus.text = "+"
            isColdWarmTapped = false
        } else {
            coldwarmLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            coldWarmHeight.constant = 697
            coldWarmView.isHidden = false
            coldwarmPlus.text = "-"
            isColdWarmTapped = true
        }
    }
    
    @IBAction func selectedBrightnes(_ sender: Any) {
        if isBrightnesTapped{
            brightnesLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
            brightnesHeight.constant = 0
            brightnesView.isHidden = true
            brightnesPlus.text = "+"
            isBrightnesTapped = false
        } else {
            brightnesLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            brightnesHeight.constant = 555
            brightnesView.isHidden = false
            brightnesPlus.text = "-"
            isBrightnesTapped = true
        }
    }
    
    @IBAction func selectedMask(_ sender: Any) {
        if isMasksTapped{
            maskLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
            maskHeight.constant = 0
            maskView.isHidden = true
            maskPlus.text = "+"
            isMasksTapped = false
        } else {
            maskLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            maskHeight.constant = 2200
            maskView.isHidden = false
            maskPlus.text = "-"
            isMasksTapped = true
        }
    }
    
    @IBAction func selectedBouquet(_ sender: Any) {
        if isBouquetTapped {
            bouquetLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
            bouquetHeight.constant = 0
            bouquetView.isHidden = true
            bouquetPlus.text = "+"
            isBouquetTapped = false
        } else {
            bouquetLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            bouquetHeight.constant = 560
            bouquetView.isHidden = false
            bouquetPlus.text = "-"
            isBouquetTapped = true
        }
    }
    
    @IBAction func selectedVideo(_ sender: Any) {
        if isVideoTapped {
            videoLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
            videoHeight.constant = 0
            videoView.isHidden = true
            videoPlus.text = "+"
            isVideoTapped = false
        } else {
            videoLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            videoHeight.constant = 200
            videoView.isHidden = false
            videoPlus.text = "-"
            isVideoTapped = true
        }
    }
    
    @IBAction func selectedInst(_ sender: Any) {
        if isInstTapped {
            instLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
            instHeight.constant = 0
            instView.isHidden = true
            instPlus.text = "+"
            isInstTapped = false
        } else {
            instLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            instHeight.constant = 35
            instView.isHidden = false
            instPlus.text = "-"
            isInstTapped = true
        }
    }
    
    @IBAction func instTapped(_ sender: Any) {
        showSafariVC(url: "https://instagram.com/flower_colour_wheel?igshid=kajh1pyhhfu0")
    }
    
    func showSafariVC(url: String){
        guard let url = URL(string: url) else {
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
