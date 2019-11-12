import UIKit

class SelectImagesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var cuadricula: UICollectionView!
    @IBOutlet weak var selectedImagesCounter: UILabel!
    @IBOutlet weak var lifesCounter: UILabel!
    @IBOutlet weak var notice: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var continueLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var retryLabel: UILabel!
    @IBOutlet weak var successNotice: UILabel!
    @IBOutlet weak var failureNotice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bluebackground.png")!)
        cuadricula.dataSource = self
        cuadricula.delegate = self
    }
    
    var imagecounter = 0 //Contador de imágenes seleccionadas
    var lifeCounter = 5 //Contador de vidas
    var successCounter = 0 //Contador de aciertos
    
    //Número de celdas
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count //Tantas celdas como imágenes tenga el Array
    }
    
    //Rellenar las celdas
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! cell
        cell.imageCell.image = images[indexPath.row] //Pone cada imagen en cada celda
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if lifeCounter == 0{
            return
        }
        if successCounter == 6{
            return
        }
        
        let cell = collectionView.cellForItem(at: indexPath) as! cell
        print(indexPath.row)
        
        var success : Bool = false
        for i in array6RandomNumbers{ //Comparar las imágenes
            if i == indexPath.row{
                UIView.animate(withDuration: 5, animations: {
                    cell.isHidden = true //Esconder la imagen si se pincha
                })
                imagecounter += 1
                successCounter += 1
                success = true
                print("Acierto")
                successNotice.alpha = 1
                failureNotice.alpha = 0
                break //Interrumpir el bucle
            }
        }
        if success == false{
            failureNotice.alpha = 1
            successNotice.alpha = 0
            print("Fallo")
            lifeCounter -= 1
            let showLifes = String(lifeCounter) //Casting de Int a String
            lifesCounter.text = showLifes
            
            if lifeCounter == 0{
                notice.isHidden = false
                notice.text = "Te has quedado sin vidas"
                continueButton.isHidden = true
                continueLabel.isHidden = true
                retryButton.alpha = 1
                retryLabel.alpha = 1
            }
        }
        
        let showCounter = String(imagecounter) //Casting de Int a String
        selectedImagesCounter.text = showCounter
        
        if imagecounter > 5{
            print("Todas acertadas")
            continueButton.isHidden = false
            continueLabel.isHidden = false
            notice.isHidden = false
            notice.text = "Ya has seleccionado todas las imágenes"
        }
    }
}
