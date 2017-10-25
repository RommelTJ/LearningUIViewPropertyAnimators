import UIKit
import PlaygroundSupport

// Container for our animating view
let containerView = NinjaContainerView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))

let ninja = containerView.ninja

// Show the container view in the Assistant Editor
PlaygroundPage.current.liveView = containerView

// Animating the ninja from left to right.
UIViewPropertyAnimator(duration: 1, curve: .easeInOut) {
    containerView.moveNinjaToBottomRight()
}.startAnimation()

