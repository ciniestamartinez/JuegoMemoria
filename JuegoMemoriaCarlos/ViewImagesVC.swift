import UIKit

var images : [UIImage] = [UIImage(named: "dog.jpg")!, UIImage(named: "shark.jpg")!, UIImage(named: "crocodile.jpg")!, UIImage(named: "car.jpg")!, UIImage(named: "moto.jpg")!, UIImage(named: "barco.jpg")!, UIImage(named: "españa.jpg")!, UIImage(named: "eeuu.jpg")!, UIImage(named: "china.jpg")!, UIImage(named: "futbol.jpg")!, UIImage(named: "baloncesto.jpg")!, UIImage(named: "tenis.jpg")!]
var numbers : [Int] = []

func getRandomNumbers() -> [Int]{
    for i in 0...images.count - 1{
        numbers.append(i) //Mete los números al array vacío
    }
    numbers.shuffle() //Mezcla los números del array
    return numbers
}
var randomRumbers = getRandomNumbers()

func get6RandomNumbers() -> [Int]{
    var random6numbers = [Int] ()
        for i in 0...5{
          random6numbers.append(randomRumbers[i])
        }
    return random6numbers
}
var array6RandomNumbers = get6RandomNumbers()


class ViewImagesVC: UIViewController{
    
    @IBOutlet weak var imagesToView: UIImageView!
    @IBOutlet weak var timeCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bluebackground.png")!)
        showImage()
    }
    
    var secondsTimer = 7
    
    var timeLevel : Float = 0
    
    func showImage(){
        var index = 0
        difficultyLevel()
        Timer.scheduledTimer(withTimeInterval: TimeInterval(timeLevel), repeats: true, block:
            { timer in
                if index < 6{
                    self.imagesToView.image = images[randomRumbers[index]]
                    index += 1 //Suma uno al índice cada vez que se recorre el Timer
                    self.secondsTimer -= 1
                    let showTime = String(self.secondsTimer) //Casting de Int a String
                    self.timeCounter.text = showTime
                }else{
                    self.performSegue(withIdentifier: "changeScreen", sender: nil) //Cuando acaban de verse las imágenes se cambia a la siguiente pantalla
                }
        })
    }
    
    func difficultyLevel(){
        let difficult: Int = Int(difficulty)
        switch difficult {
        case 0:
            timeLevel = 2.5
        case 1:
            timeLevel = 1.5
        case 2:
            timeLevel = 0.7
        default:
            timeLevel = 1.5
        }
    }
}
