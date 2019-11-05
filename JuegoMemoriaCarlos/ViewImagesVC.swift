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
        for j in 0...5{
          random6numbers.append(randomRumbers[j])
        }
    return random6numbers
}
var array6RandomNumbers = get6RandomNumbers()


class ViewImagesVC: UIViewController{
    
    @IBOutlet weak var imagesToView: UIImageView!
    @IBOutlet weak var timeCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper2.png")!)
        showImage()
    }
    
    var timerr = 7
    
    func showImage(){
        var index = 0
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true, block:
            { timer in
                if index < 6{
                    self.imagesToView.image = images[randomRumbers[index]]
                    index += 1 //Suma uno al índice cada vez que se recorre el Timer
                    self.timerr -= 1
                    let showTime = String(self.timerr) //Casting de Int a String
                    self.timeCounter.text = showTime
                }else{
                    self.performSegue(withIdentifier: "changeScreen", sender: nil) //Cuando acaban de verse las imágenes se cambia a la siguiente pantalla
                }
        })
    }
    
    @IBAction func Back(_ sender: Any) {
        dismiss(animated: true, completion: nil) //Cerrar pantalla
    }
    
}
