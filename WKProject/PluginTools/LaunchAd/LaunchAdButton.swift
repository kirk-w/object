//
//  LaunchAdButton.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/11.
//  Copyright © 2018年 WK. All rights reserved.
//


import Foundation
import UIKit

class LaunchAdButton: UIButton {
    
    fileprivate var config: LaunchSkipButtonConfig!
    fileprivate var adDuration: Int!
    
    func setDuration(_ duration: Int) {
        adDuration = duration
        isHidden = false
        let time = "\(duration)" as NSString
        switch config.skipBtnType {
        case .none:
            isHidden = true
            
        case .text:
            setTitle("\(config.text)", for: .normal)
            setTitleColor(config.textColor, for: .normal)
            titleLabel?.font = config.textFont
            
        case .timer:
            setTitle("\(time)", for: .normal)
            setTitleColor(config.timeColor, for: .normal)
            titleLabel?.font = config.timeFont
            
        case .textLeftTimerRight:
            let title = NSMutableAttributedString(string: "\(config.text) \(time)")
            title.addAttributes([.foregroundColor: config.textColor, .font: config.textFont], range: NSMakeRange(0, config.text.length))
            title.addAttributes([.foregroundColor: config.timeColor, .font: config.timeFont], range: NSMakeRange(config.text.length+1, time.length))
            setAttributedTitle(title, for: .normal)
            
        case .textRightTimerLeft:
            let time = "\(time)" as NSString
            let title = NSMutableAttributedString(string: "\(time) \(config.text)")
            title.addAttributes([.foregroundColor: config.timeColor, .font: config.timeFont], range: NSMakeRange(0, time.length))
            title.addAttributes([.foregroundColor: config.textColor, .font: config.textFont], range: NSMakeRange(time.length+1, config.text.length))
            setAttributedTitle(title, for: .normal)
            
        case .roundText:
            setTitle("\(config.text)", for: .normal)
            setTitleColor(config.textColor, for: .normal)
            titleLabel?.font = config.textFont
            
        case .roundProgressText:
            
            if animation == nil {
                animation = CABasicAnimation(keyPath: "strokeStart")
                animation?.duration = Double(adDuration)
                animation?.delegate = self
                animation?.fromValue = 0
                animation?.toValue = 0.9999
                animation?.fillMode = kCAFillModeForwards
                animation?.isRemovedOnCompletion = false
                animationLayer.add(animation!, forKey: "strokeStartAnimation")
            }
            setTitle("\(config.text)", for: .normal)
            setTitleColor(config.textColor, for: .normal)
            titleLabel?.font = config.textFont
            layer.addSublayer(animationLayer)
        }
    }
    
    func setSkipApperance(_ config: LaunchSkipButtonConfig) {
        
        self.config = config
        backgroundColor = config.backgroundColor
        var frame = config.frame
        switch config.skipBtnType {
        case .roundText:
            frame.size.width = frame.size.height
            self.frame = frame
            layer.cornerRadius = frame.size.height * 0.5
            layer.borderColor = config.borderColor.cgColor
            layer.borderWidth = config.borderWidth
        case .roundProgressText:
            frame.size.width = frame.size.height
            self.frame = frame
            layer.cornerRadius = frame.size.height * 0.5
            layer.borderColor = UIColor.clear.cgColor
            layer.borderWidth = 0
        default:
            self.frame = frame
            layer.borderColor = config.borderColor.cgColor
            layer.borderWidth = config.borderWidth
            layer.cornerRadius = config.cornerRadius
        }
    }
    private var animation: CABasicAnimation?
    private lazy var animationLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.frame = bounds
        layer.strokeColor = config.strokeColor.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = config.lineWidth
        layer.lineCap = kCALineCapRound
        layer.lineJoin = kCALineJoinRound
        let bezierPath = UIBezierPath(ovalIn: bounds)
        layer.path = bezierPath.cgPath
        layer.strokeStart = 0
        layer.strokeEnd = 1
        return layer
    }()
}
extension LaunchAdButton: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if animationLayer.animation(forKey: "strokeStartAnimation")==anim {
            animation = nil
        }
    }
}
