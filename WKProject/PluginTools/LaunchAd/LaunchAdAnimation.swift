//
//  LaunchAdAnimation.swift
//  WKProject
//
//  Created by 王珂 on 2018/7/11.
//  Copyright © 2018年 WK. All rights reserved.
//

import UIKit

class LaunchAdAnimation: NSObject, CAAnimationDelegate {
    
    private let animationDuration = 0.8
    private var animationView: UIView!
    
    func animationType(_ animationType: LaunchAnimationType, animationView: UIView, animationClosure: @escaping LaunchClosure) {
        
        switch animationType {
        case .crossDissolve, .curlUp, .flipFromBottom, .flipFromLeft, .flipFromRight, .flipFromTop:
            
            let closure = {
                UIView.setAnimationsEnabled(false)
                animationClosure()
                UIView.setAnimationsEnabled(true)
            }
            UIView.transition(with: UIApplication.shared.keyWindow!, duration: animationDuration, options: animationOptions(animationType), animations: closure, completion: nil)
        default:
            
            var frame = animationView.frame
            switch animationType {
            case .slideFromTop:
                DispatchQueue.main.asyncAfter(deadline: .now()+0.2, execute: {
                    UIView.animate(withDuration: self.animationDuration, animations: {
                        frame.origin.y = -frame.size.height
                        animationView.frame = frame
                    }, completion: { _ in
                        animationClosure()
                    })
                })
            case .slideFromBottom:
                DispatchQueue.main.asyncAfter(deadline: .now()+0.2, execute: {
                    UIView.animate(withDuration: self.animationDuration, animations: {
                        frame.origin.y = frame.size.height
                        animationView.frame = frame
                    }, completion: { _ in
                        animationClosure()
                    })
                })
            case .slideFromLeft:
                DispatchQueue.main.asyncAfter(deadline: .now()+0.2, execute: {
                    UIView.animate(withDuration: self.animationDuration, animations: {
                        frame.origin.x = -frame.size.width
                        animationView.frame = frame
                    }, completion: { _ in
                        animationClosure()
                    })
                })
                
            case .slideFromRight:
                DispatchQueue.main.asyncAfter(deadline: .now()+0.2, execute: {
                    UIView.animate(withDuration: self.animationDuration, animations: {
                        frame.origin.x = frame.size.width
                        animationView.frame = frame
                    }, completion: { _ in
                        animationClosure()
                    })
                })
            default: break
            }
        }
    }
    
    private func animationOptions(_ animationType: LaunchAnimationType) -> UIViewAnimationOptions {
        switch animationType {
        case .curlUp:
            return .transitionCurlUp
        case .flipFromBottom:
            return .transitionFlipFromBottom
        case .flipFromTop:
            return .transitionFlipFromTop
        case .flipFromLeft:
            return .transitionFlipFromLeft
        case .flipFromRight:
            return .transitionFlipFromRight
        default:
            return .transitionCrossDissolve
        }
    }
}
