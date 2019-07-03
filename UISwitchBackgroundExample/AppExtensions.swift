//
//  AppExtensions.swift
//  UISwitchBackgroundExample
//
//  Created by Nicolas Manoogian on 7/3/19.
//  Copyright © 2019 Nic Manoogian. All rights reserved.
//

import UIKit

extension UIView {
    class func springAnimate(duration: TimeInterval, animations: @escaping () -> (), options: UIView.AnimationOptions = .allowUserInteraction, completion: ((Bool) -> ())? = nil) {
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: options, animations: animations, completion: completion)
    }
    
    func constraintsEqualToSuperview(_ edgeInsets: UIEdgeInsets = UIEdgeInsets.zero, priority: UILayoutPriority = .required) -> [NSLayoutConstraint] {
        self.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        if let superview = self.superview {
            constraints.append(self.constraining(.leading, .equal, to: superview, constant: edgeInsets.left, priority: priority))
            constraints.append(self.constraining(.trailing, .equal, to: superview, constant: -edgeInsets.right, priority: priority))
            constraints.append(self.constraining(.top, .equal, to: superview, constant: edgeInsets.top, priority: priority))
            constraints.append(self.constraining(.bottom, .equal, to: superview, constant: -edgeInsets.bottom, priority: priority))
        }
        return constraints
    }
    
    func constraining(_ attribute: NSLayoutConstraint.Attribute, _ relation: NSLayoutConstraint.Relation, to constant: CGFloat, multiplier: CGFloat = 1.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint =  NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: nil, attribute: .notAnAttribute, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        return constraint
    }
    
    func constraining(_ attribute: NSLayoutConstraint.Attribute, _ relation: NSLayoutConstraint.Relation, to otherAttribute: NSLayoutConstraint.Attribute, of item: AnyObject? = nil, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint =  NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: item ?? self, attribute: otherAttribute, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        return constraint
    }
    
    func constraining(_ attribute: NSLayoutConstraint.Attribute, _ relation: NSLayoutConstraint.Relation, to item: AnyObject, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: item, attribute: attribute, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        return constraint
    }
    
    func constraining(_ attributes: [NSLayoutConstraint.Attribute], _ relation: NSLayoutConstraint.Relation, to item: AnyObject, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0, priority: UILayoutPriority = .required) -> [NSLayoutConstraint] {
        return attributes.map { self.constraining($0, relation, to: item, multiplier: multiplier, constant: constant, priority: priority) }
    }
    
    func constraining(_ attributes: [NSLayoutConstraint.Attribute], _ relation: NSLayoutConstraint.Relation, to constant: CGFloat, multiplier: CGFloat = 0.0, priority: UILayoutPriority = .required) -> [NSLayoutConstraint] {
        return attributes.map { self.constraining($0, relation, to: constant, multiplier: multiplier, priority: priority) }
    }
    
    func constraints(size: CGSize) -> [NSLayoutConstraint] {
        return [
            constraining(.width, .equal, to: size.width),
            constraining(.height, .equal, to: size.height)
        ]
    }
    
    var firstScrollView: UIScrollView? {
        for v in self.subviews {
            if let v = v as? UIScrollView { return v }
        }
        return nil
    }
}
