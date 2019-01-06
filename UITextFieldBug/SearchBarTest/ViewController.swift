import UIKit

let fontSize: CGFloat = 14.0

class ViewController: UIViewController {

  var textfield: UITextField!
  @IBOutlet weak var slider: UISlider!

  override func viewDidLoad() {
    super.viewDidLoad()
    textfield = UITextField(frame: CGRect(x: 52, y: 200, width: 260, height: 19))
    textfield.font = UIFont.systemFont(ofSize: fontSize)
    textfield.backgroundColor = UIColor.red
    textfield.text = "这是一行测试用的文字"
    view.addSubview(textfield)
  }

  @IBAction func sliderValueChanged(_ sender: Any) {
    let textColor = UIColor.black.colorByBlending(
      with: UIColor.white,
      percent: CGFloat(slider.value))
    textfield.defaultTextAttributes = [
      // 注释掉下面这一行，问题就会消失
      .font: UIFont.systemFont(ofSize: fontSize),
      .foregroundColor: textColor
    ]
  }
}
