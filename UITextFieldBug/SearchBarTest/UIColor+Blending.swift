import UIKit

extension UIColor {

  public func colorByBlending(with color: UIColor, percent: CGFloat = 0.5) -> UIColor {
    let (red, green, blue, alpha) = getRGBA()
    let (oRed, oGreen, oBlue, oAlpha) = color.getRGBA()

    let newRed = red + (oRed - red) * percent
    let newGreen = green + (oGreen - green) * percent
    let newBlue = blue + (oBlue - blue) * percent
    let newAlpha = alpha + (oAlpha - alpha) * percent

    return UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: newAlpha)
  }

  public func getRGBA() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
    let redPointer = UnsafeMutablePointer<CGFloat>.allocate(capacity: 1)
    redPointer.initialize(to: 0)

    let greenPointer = UnsafeMutablePointer<CGFloat>.allocate(capacity: 1)
    greenPointer.initialize(to: 0)

    let bluePointer = UnsafeMutablePointer<CGFloat>.allocate(capacity: 1)
    bluePointer.initialize(to: 0)

    let alphaPointer = UnsafeMutablePointer<CGFloat>.allocate(capacity: 1)
    alphaPointer.initialize(to: 0)

    getRed(redPointer, green: greenPointer, blue: bluePointer, alpha: alphaPointer)

    let redValue = redPointer.pointee
    let greenValue = greenPointer.pointee
    let blueValue = bluePointer.pointee
    let alphaValue = alphaPointer.pointee

    redPointer.deinitialize(count: 1)
    redPointer.deallocate()
    greenPointer.deinitialize(count: 1)
    greenPointer.deallocate()
    bluePointer.deinitialize(count: 1)
    bluePointer.deallocate()
    alphaPointer.deinitialize(count: 1)
    alphaPointer.deallocate()

    return (red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
  }

}
