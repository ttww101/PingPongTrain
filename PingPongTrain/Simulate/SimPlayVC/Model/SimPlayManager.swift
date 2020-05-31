//
//  SimPlayManager.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

enum teamType {
    case home, away
}

enum scoreType {
    case spin, cut, smash, out
}

class SimPlayManager {
    var homequarter = 0
    var homeSpin = 0
    var homeCut = 0
    var homeSmash = 0
    var homeOut = 0
    var homeMem = 0
    
    var awayquarter = 0
    var awaySpin = 0
    var awayCut = 0
    var awaySmash = 0
    var awayOut = 0
    var awayMem = 0
    
    init() {
        reset()
    }
    
    func reset() {
        homequarter = 0
        homeSpin = 0
        homeCut = 0
        homeSmash = 0
        homeOut = 0
        homeMem = 0
        
        awayquarter = 0
        awaySpin = 0
        awayCut = 0
        awaySmash = 0
        awayOut = 0
        awayMem = 0
    }
    
    func addPoint(_ teamSMem: [String]?, _ team: teamType, _ score: scoreType) {
        switch team {
        case .home:
            switch score {
            case .spin:
                homeSpin += 1
                homequarter += 1
            case .cut:
                homeCut += 1
                homequarter += 1
            case .smash:
                homeSmash += 1
                homequarter += 1
            case .out:
                homeOut += 1
                awayquarter += 1
            }
        case .away:
            switch score {
            case .spin:
                awaySpin += 1
                awayquarter += 1
            case .cut:
                awayCut += 1
                awayquarter += 1
            case .smash:
                awaySmash += 1
                awayquarter += 1
            case .out:
                awayOut += 1
                homequarter += 1
            }
        }
    }
    
    func minusPoint(_ teamCoach: [teamRecordModel]?, _ team: teamType, _ score: scoreType, _ completion: @escaping(Bool) -> Void) {
        switch team {
        case .home:
            switch score {
            case .spin:
                if homeSpin > 0 {
                    homeSpin -= 1
                    homequarter -= 1
                    completion(true)
                } else { completion(false) }
            case .cut:
                if homeCut > 0 {
                    homeCut -= 1
                    homequarter -= 1
                    completion(true)
                } else { completion(false) }
            case .smash:
                if homeSmash > 0 {
                    homeSmash -= 1
                    homequarter -= 1
                    completion(true)
                } else { completion(false) }
            case .out:
                if homeOut > 0 {
                    homeOut -= 1
                    awayquarter -= 1
                    completion(true)
                } else { completion(false) }
            }
        case .away:
            switch score {
            case .spin:
                if awaySpin > 0 {
                    awaySpin -= 1
                    awayquarter -= 1
                    completion(true)
                } else { completion(false) }
            case .cut:
                if awayCut > 0 {
                    awayCut -= 1
                    awayquarter -= 1
                    completion(true)
                } else { completion(false) }
            case .smash:
                if awaySmash > 0 {
                    awaySmash -= 1
                    awayquarter -= 1
                    completion(true)
                } else { completion(false) }
            case .out:
                if awayOut > 0 {
                    awayOut -= 1
                    homequarter -= 1
                    completion(true)
                } else { completion(false) }
            }
        }
    }
    
}
