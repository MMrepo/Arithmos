//
//  CALayer+Functional.swift
//  Arithmos
//
//  Created by Mateusz on 09.12.2017.
//  Copyright © 2017 vindur. All rights reserved.
//

import CoreGraphics

public enum CALayerAnimatableProperties:String {
    case rotation = "transform.rotation.z"
    case translation = "transform.translation"
    case scale = "transform.scale"
    case position = "position"
    
    public var keyPath: String {
        return self.rawValue
    }
}

public extension CALayer {
    
    public enum AnimationType {
        case implicit
        case none
        case custom(CAAnimation)
    }
    
    @discardableResult public func rotate(with angle:CGFloat, withAnimation animationType:AnimationType = .implicit) -> Self {
        guard let oldAngle = self.value(for: .rotation) as? Double else { // TODO: throw an error here
            return self
        }
        let angleValue = NSNumber(value: Double(angle) + oldAngle)
        return setValue(angleValue, for: .rotation, withAnimation: animationType)
    }
    
    @discardableResult public func rotate(to angle:CGFloat, withAnimation animationType:AnimationType = .implicit) -> Self {
        let angleValue = NSNumber(value: Double(angle))
        return setValue(angleValue, for: .rotation, withAnimation: animationType)
    }
    
    @discardableResult public func move(to point:CGPoint, withAnimation animationType:AnimationType = .implicit) -> Self {
        let pointValue = NSValue(cgPoint: point)
        return setValue(pointValue, for: .position, withAnimation: animationType)
    }
    
    @discardableResult public func move(by vector:CGVector, withAnimation animationType:AnimationType = .implicit) -> Self {
        guard let oldPosition = self.value(for: .position) as? CGPoint else { // TODO: throw an error here
            return self
        }
        let pointValue = NSValue(cgPoint: oldPosition.moved(by: vector))
        return setValue(pointValue, for: .position, withAnimation: animationType)
    }
    
    @discardableResult public func moveCenter(to point:CGPoint, withAnimation animationType:AnimationType = .implicit) -> Self {
        let vectorFromCenter = self.frame.center.vector(to: self.position)
        let newPoint = point.moved(by: vectorFromCenter)
        return self.move(to: newPoint, withAnimation: animationType)
    }
    
    @discardableResult public func moveCenter(by vector:CGVector, withAnimation animationType:AnimationType = .implicit) -> Self {
        let vectorFromCenter = self.frame.center.vector(to: self.position)
        let newVector = vector + vectorFromCenter
        return self.move(by: newVector, withAnimation: animationType)
    }
    
    @discardableResult public func fit(into:CGRect, withAnimation animationType:AnimationType = .implicit) -> Self {
        return fit(into: into.size).moveCenter(to: into.center)
    }
    
    @discardableResult public func fit(into:CGSize, withAnimation animationType:AnimationType = .implicit) -> Self {
        let boundingBox = self.frame
        let widthScale = into.width/boundingBox.width
        let heightScale = into.height/boundingBox.height
        let factor = min(widthScale, heightScale)
        
        return scaleTo(factor)
    }
    
    @discardableResult public func scaleTo(_ scale:CGFloat, withAnimation animationType:AnimationType = .implicit) -> Self {
        
        let scaleValue = NSNumber(value: Double(scale))
        return setValue(scaleValue, for: .scale, withAnimation:animationType)
    }
    
    @discardableResult public func scaleBy(_ scale:CGFloat, withAnimatio animationType:AnimationType = .implicit) -> Self {
        guard let oldScale = self.value(for: .scale) as? Double else { // TODO: throw an error here
            return self
        }
        let scaleValue = NSNumber(value: Double(scale) * oldScale)
        return setValue(scaleValue, for: .scale, withAnimation:animationType)
    }
    
    @discardableResult public func setValue(_ value: Any?, for CALayerTransformationType: CALayerAnimatableProperties, withAnimation animationType:AnimationType = .implicit) -> Self {
        return setValue(value, forKeyPath:CALayerTransformationType.keyPath, withAnimation:animationType)
    }
    
    public func value(for CALayerTransformationType: CALayerAnimatableProperties) ->  Any? {
        return value(forKeyPath: CALayerTransformationType.keyPath)
    }
    
    @discardableResult public func setValue(_ value: Any?, forKeyPath keyPath: String, withAnimation animationType:AnimationType = .implicit) -> Self {
        
        CATransaction.begin()
        
        switch animationType {
        case .none:
            CATransaction.setDisableActions(true)
        case .implicit:
            CATransaction.setDisableActions(false)
        case .custom(let animation):
            CATransaction.setDisableActions(true)
            self.add(animation, forKey: keyPath)
        }
        
        self.setValue(value, forKeyPath: keyPath)
        CATransaction.commit()
        
        return self
    }
    
    public func animate(withDuration duration: CFTimeInterval = 0.25, timingFunction: CAMediaTimingFunction? = nil, _ scope:(CALayer)->()) {
        CATransaction.begin()
        CATransaction.setAnimationDuration(duration)
        CATransaction.setAnimationTimingFunction(timingFunction)
        scope(self)
        CATransaction.commit()
    }
    
    public func stopAnimations() {
        self.removeAllAnimations()
    }
    
    //MARK: - public helpers for most common values
    
    public var rotationAngle: CGFloat? {
        return self.value(for: .rotation) as? CGFloat
    }
    
    public var normalizedRotationAngle: CGFloat? {
        return rotationAngle?.normalizedAngle()
    }
    
    public var scale: CGFloat? {
        return self.value(for: .scale) as? CGFloat
    }
}

public extension CABasicAnimation {
    convenience public init(for property: CALayerAnimatableProperties, from: Any?, to: Any?, by: Any? = nil, duration: CFTimeInterval) {
        self.init(keyPath: property.keyPath)
        self.fromValue = from
        self.toValue = to
        self.byValue = by
        self.duration = duration
    }
}

private extension CALayer {
//    func performCentered <Arguments, Result>(_ method: (Arguments) -> Result, withArguments arguments: Arguments) -> Result {
//        print("vectorFromCenter: \(vectorFromCenter)")
//        let result = method(arguments)
//        let newPosition = self.frame
//        self.anchorPoint = oldAnchorPoint
//        let oldposition = self.frame
//        print("revert old anchorPoint: \(self.anchorPoint)")
//        print("newPosition: \(newPosition) ||| oldposition: \(oldposition)")
//        self.frame = newPosition
//        return result
//    }
}

