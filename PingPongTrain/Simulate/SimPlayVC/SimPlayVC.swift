//
//  SimPlayVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

struct SimPlayModel {
    var home: String
    var away: String
    var quarter: Int
    var score: Int
    var win: Int
}

enum stopType {
    case homeStop, awayStop, rest
}

class SimPlayVC: UIViewController {
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var homeGame: UILabel!
    @IBOutlet weak var homeQuarter1: UILabel!
    @IBOutlet weak var homeQuarter2: UILabel!
    @IBOutlet weak var homeQuarter3: UILabel!
    @IBOutlet weak var homeQuarter4: UILabel!
    @IBOutlet weak var homeQuarter5: UILabel!
    
    @IBOutlet weak var awayName: UILabel!
    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var awayGame: UILabel!
    @IBOutlet weak var awayQuarter1: UILabel!
    @IBOutlet weak var awayQuarter2: UILabel!
    @IBOutlet weak var awayQuarter3: UILabel!
    @IBOutlet weak var awayQuarter4: UILabel!
    @IBOutlet weak var awayQuarter5: UILabel!
    
    @IBOutlet weak var quarterL4: UILabel!
    @IBOutlet weak var quarterL5: UILabel!
    
    @IBOutlet weak var restView: UIView!
    @IBOutlet weak var restBtn: UIButton!
    @IBOutlet weak var restImg: UIImageView!
    
    @IBOutlet weak var cornerView1: UIView!
    @IBOutlet weak var cornerView2: UIView!
    
    
    var ocArray: [UILabel] {
        return [quarterL4, quarterL5, homeQuarter4, homeQuarter5, awayQuarter4, awayQuarter5]
    }
    var homeQuarArray: [UILabel] {
        return [homeQuarter1, homeQuarter2, homeQuarter3, homeQuarter4, homeQuarter5]
    }
    var awayQuarArray: [UILabel] {
        return [awayQuarter1, awayQuarter2, awayQuarter3, awayQuarter4, awayQuarter5]
    }
    
    var proGRecord: ProGRecordModel!
    var simPlayModel: SimPlayModel!
    var manager: SimPlayManager!
    var quarter = 1
    var game1 = 0 {
        didSet {
            homeGame.text = "\(game1)"
        }
    }
    var game2 = 0 {
        didSet {
            awayGame.text = "\(game2)"
        }
    }
    var score1 = 0 {
        didSet {
            homeScore.text = "\(score1)"
        }
    }
    var score2 = 0 {
        didSet {
            awayScore.text = "\(score2)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if simPlayModel.quarter == 3 {
            for i in 0..<ocArray.count {
                ocArray[i].isHidden = true
            }
        }
        let team1 = teamRecordModel(name: simPlayModel.home, score: 0, quarter1: 0, quarter2: 0, quarter3: 0, quarter4: 0, quarter5: 0, Spin: 0, Cut: 0, Smash: 0, Out: 0)
        let team2 = teamRecordModel(name: simPlayModel.away, score: 0, quarter1: 0, quarter2: 0, quarter3: 0, quarter4: 0, quarter5: 0, Spin: 0, Cut: 0, Smash: 0, Out: 0)
        proGRecord = ProGRecordModel(team1: team1, team2: team2, quarter: simPlayModel.quarter)
        manager = SimPlayManager()
        restImg.loadGif(name: "cheerup")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setDefault()
    }
    
    // MARK: - Default
    func setDefault() {
        homeName.text = simPlayModel.home
        awayName.text = simPlayModel.away
        score1 = 0
        score2 = 0
        game1 = 0
        game2 = 0
        quarter = 1
    }
    
    // MARK: - Game
    func recordGame() {
        switch quarter {
        case 1:
            proGRecord.team1.quarter1 = manager.homequarter
            proGRecord.team2.quarter1 = manager.awayquarter
        case 2:
            proGRecord.team1.quarter2 = manager.homequarter
            proGRecord.team2.quarter2 = manager.awayquarter
        case 3:
            proGRecord.team1.quarter3 = manager.homequarter
            proGRecord.team2.quarter3 = manager.awayquarter
        case 4:
            proGRecord.team1.quarter4 = manager.homequarter
            proGRecord.team2.quarter4 = manager.awayquarter
        case 5:
            proGRecord.team1.quarter5 = manager.homequarter
            proGRecord.team2.quarter5 = manager.awayquarter
        default:
            return
        }
        homeQuarArray[quarter - 1].text = "\(manager.homequarter)"
        awayQuarArray[quarter - 1].text = "\(manager.awayquarter)"
        if manager.homequarter > manager.awayquarter {
            homeQuarArray[quarter - 1].textColor = .red
            awayQuarArray[quarter - 1].textColor = .lightGray
        } else {
            homeQuarArray[quarter - 1].textColor = .lightGray
            awayQuarArray[quarter - 1].textColor = .red
        }
        
        proGRecord.team1.Spin += manager.homeSpin
        proGRecord.team1.Cut += manager.homeCut
        proGRecord.team1.Smash += manager.homeSmash
        proGRecord.team1.Out += manager.homeOut
        proGRecord.team1.score = game1
        
        proGRecord.team2.Spin += manager.awaySpin
        proGRecord.team2.Cut += manager.awayCut
        proGRecord.team2.Smash += manager.awaySmash
        proGRecord.team2.Out += manager.awayOut
        proGRecord.team2.score = game2
        
        manager.reset()
    }
    func showStopView(_ type: stopType) {
        switch type {
        case .homeStop:
            restBtn.setTitle("主队暂停    结束", for: .normal)
        case .awayStop:
            restBtn.setTitle("客队暂停    结束", for: .normal)
        case .rest:
            restBtn.setTitle("中场休息    结束", for: .normal)
        }
        restView.isHidden = false
    }
    func scoreOver() {
        if score1 == simPlayModel.score {
            game1 += 1
            recordGame()
            gameOver()
        } else if score2 == simPlayModel.score {
            game2 += 1
            recordGame()
            gameOver()
        }
    }
    func gameOver() {
        if game1 == simPlayModel.win || game2 == simPlayModel.win {
            let profileStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let desVC = profileStoryboard.instantiateViewController(withIdentifier: "SimGameOverVC")
            
            guard let simGameOverVC = desVC as? SimGameOverVC else { return }
            
            simGameOverVC.proGRecordModel = proGRecord
            simGameOverVC.openCell = true
            
            self.present(simGameOverVC, animated: true) {
                self.navigationController?.popToRootViewController(animated: false)
            }
        } else {
            showStopView(.rest)
        }
    }

    // MARK: - UI Event
    @IBAction func addSpinPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.addPoint(nil, .home, .spin)
            score1 += 1
        case 1:
            manager.addPoint(nil, .away, .spin)
            score2 += 1
        default:
            return
        }
        scoreOver()
    }
    
    @IBAction func addCutPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.addPoint(nil, .home, .cut)
            score1 += 1
        case 1:
            manager.addPoint(nil, .away, .cut)
            score2 += 1
        default:
            return
        }
        scoreOver()
    }
    
    @IBAction func addSmashPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.addPoint(nil, .home, .smash)
            score1 += 1
        case 1:
            manager.addPoint(nil, .away, .smash)
            score2 += 1
        default:
            return
        }
        scoreOver()
    }
    
    @IBAction func addOutPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.addPoint(nil, .home, .out)
            score2 += 1
        case 1:
            manager.addPoint(nil, .away, .out)
            score1 += 1
        default:
            return
        }
        scoreOver()
    }
    
    @IBAction func minusSpinPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.minusPoint(nil, .home, .spin) {[weak self] (success) in
                if success { self?.score1 -= 1 }
            }
        case 1:
            manager.minusPoint(nil, .away, .spin) {[weak self] (success) in
                if success { self?.score2 -= 1 }
            }
        default:
            return
        }
    }
    
    @IBAction func minusCutPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.minusPoint(nil, .home, .cut) {[weak self] (success) in
                if success { self?.score1 -= 1 }
            }
        case 1:
            manager.minusPoint(nil, .away, .cut) {[weak self] (success) in
                if success { self?.score2 -= 1 }
            }
        default:
            return
        }
    }
    
    @IBAction func minusSmashPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.minusPoint(nil, .home, .smash) {[weak self] (success) in
                if success { self?.score1 -= 1 }
            }
        case 1:
            manager.minusPoint(nil, .away, .smash) {[weak self] (success) in
                if success { self?.score2 -= 1 }
            }
        default:
            return
        }
    }
    
    @IBAction func minusOutPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.minusPoint(nil, .home, .out) {[weak self] (success) in
                if success { self?.score2 -= 1 }
            }
        case 1:
            manager.minusPoint(nil, .away, .out) {[weak self] (success) in
                if success { self?.score1 -= 1 }
            }
        default:
            return
        }
    }
    
    @IBAction func restBtnPressed(_ sender: UIButton) {
        quarter += 1
        score1 = 0
        score2 = 0
        restView.isHidden = true
    }
}
