import UIKit
import PlaygroundSupport

// Container for our animating view
let containerView = NinjaContainerView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))

let ninja = containerView.ninja

// Show the container view in the Assistant Editor
PlaygroundPage.current.liveView = containerView

//// Animating the ninja from left to right.
//UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
//    containerView.moveNinjaToBottomRight()
//}.startAnimation()

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

