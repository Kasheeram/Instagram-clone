//
//  CustomAnimationDismisser.swift
//  InstagramFirebase
//
//  Created by Kashee on 03/06/23.
//

import UIKit

class CustomAnimationDismisser: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // my custom transition animation code logic
        let containerView = transitionContext.containerView
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        containerView.addSubview(toView)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
            // animation??
            fromView.frame = CGRect(x: -fromView.frame.width, y: 0, width: fromView.frame.width, height: fromView.frame.height)
            toView.frame = CGRect(x: 0, y: 0, width: toView.frame.width, height: toView.frame.height)
        } completion: { _ in
            transitionContext.completeTransition(true)
        }

        
//        guard let toView = transitionContext.view(forKey: .to) else { return }
//        containerView.addSubview(toView)
//
//        let startingFrame = CGRect(x: -toView.frame.width, y: 0, width: toView.frame.width, height: toView.frame.height)
//        toView.frame = startingFrame
//
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
//            // animation
//            toView.frame = CGRect(x: 0, y: 0, width: toView.frame.width, height: toView.frame.height)
//            fromView.frame = CGRect(x: fromView.frame.width, y: 0, width: fromView.frame.width, height: fromView.frame.height)
//        } completion: { _ in
//            transitionContext.completeTransition(true)
//        }

    }
    
}