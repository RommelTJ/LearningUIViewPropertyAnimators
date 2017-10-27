import UIKit
import PlaygroundSupport

// Container for our animating view
let containerView = NinjaContainerView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))

let ninja = containerView.ninja

// Show the container view in the Assistant Editor
PlaygroundPage.current.liveView = containerView

//// 1. Animating the ninja from left to right.
//UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
//    containerView.moveNinjaToBottomRight()
//}.startAnimation()

/* 2. Chaining animations
let animator = UIViewPropertyAnimator(duration: 1, curve: .easeInOut)

// Animating the ninja from left to right.
animator.addAnimations {
    containerView.moveNinjaToBottomRight()
}

// Adding a second animation to the existing animator.
animator.addAnimations {
    ninja.alpha = 0
}

// Completion handlers can also be chained.
animator.addCompletion {
    _ in
    print("Animation completed")
}

animator.addCompletion {
    position in
    switch position {
    case .end: print("Completion handler called at end of animation")
    case .current: print("Completion handler called mid-way through animation")
    case .start: print("Completion handler called  at start of animation")
    }
}

animator.startAnimation()
*/

/* 3. Scrubbing
let animator = UIViewPropertyAnimator(duration: 5, curve: .easeIn)

// Add our first animation block.
animator.addAnimations {
    containerView.moveNinjaToBottomRight()
}

// Add a scrubber
let scrubber = UISlider(frame: CGRect(x: 0, y: 0, width: containerView.frame.width, height: 50))
containerView.addSubview(scrubber)

let eventListener = EventListener()
eventListener.eventFired = {
    animator.fractionComplete = CGFloat(scrubber.value)
}

scrubber.addTarget(eventListener, action: #selector(EventListener.handleEvent), for: .valueChanged)
 
 */

/* 4. Reversing
let animator = UIViewPropertyAnimator(duration: 2, curve: .easeIn)

animator.addAnimations {
    UIView.animateKeyframes(withDuration: animator.duration, delay: 0, options: [.calculationModeCubic], animations: {
        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
            ninja.center = containerView.center
        })
        UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
            containerView.moveNinjaToBottomRight()
        })
    }, completion: nil)
}

let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 30)))
button.setTitle("Reverse", for: .normal)
button.setTitleColor(.black, for: .normal)
button.setTitleColor(.gray, for: .highlighted)

let listener = EventListener()
listener.eventFired = {
    // Note: This only works if the state of the animation is still
    // active (i.e. the animation is currently in-progress).
    animator.isReversed = true
}

button.addTarget(listener, action: #selector(EventListener.handleEvent), for: .touchUpInside)
containerView.addSubview(button)

animator.startAnimation()
*/

/* 5. Time Curves */
let bezierParams = UICubicTimingParameters(controlPoint1: CGPoint(x: 0.05, y: 0.95), controlPoint2: CGPoint(x: 0.15, y: 0.95))

let animator = UIViewPropertyAnimator(duration: 4, timingParameters: bezierParams)

animator.addAnimations {
    containerView.moveNinjaToBottomRight()
}

animator.startAnimation()

