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

class ViewImagesVC: UIViewController{
    
    @IBOutlet weak var imagesToView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper2.png")!)
        showImage()
    }
    
    func showImage(){
        var index = 0
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true, block:
            { timer in
                if index < 6{
                    self.imagesToView.image = images[randomRumbers[index]]
                    index += 1 //Suma uno al índice cada vez que se recorre el Timer
                }else{
                    self.performSegue(withIdentifier: "changeScreen", sender: nil) //Cuando acaban de verse las imágenes se cambia a la siguiente pantalla
                }
        })
    }
    
    @IBAction func Back(_ sender: Any) {
        dismiss(animated: true, completion: nil) //Cerrar pantalla
    }
    
}
