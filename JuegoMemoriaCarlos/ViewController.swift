import UIKit

var difficulty : Int = 0

class ViewController: UIViewController {
    
    @IBOutlet weak var numberDifficultyLevel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bluebackground.png")!)
    }
    
    
    @IBAction func Slider(_ sender: UISlider) {
        numberDifficultyLevel.text = String(Int(sender.value))
        difficulty = Int(sender.value)
    }
}

