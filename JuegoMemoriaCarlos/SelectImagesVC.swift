import UIKit

class SelectImagesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var cuadricula: UICollectionView!
    @IBOutlet weak var selectedImagesCounter: UILabel!
    @IBOutlet weak var notice: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var retryButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper2.png")!)
        cuadricula.dataSource = self
        cuadricula.delegate = self
    }
    
    var counter = 0 //Contador de imágenes seleccionadas
    
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
        let cell = collectionView.cellForItem(at: indexPath) as! cell
        print(indexPath.row)
        
        
        for i in randomRumbers{
            if i == indexPath.row{
               cell.isHidden = true //Esconder la imagen si se pincha
            }
        }
        
        counter += 1
        let showCounter = String(counter) //Casting de Int a String
        selectedImagesCounter.text = showCounter
        
        if counter > 5{
            notice.isHidden = false
            notice.text = "Ya no puedes seleccionar más imágenes"
        }
        if counter > 6{
            notice.isHidden = false
            notice.text = "Te has pasado, tienes que volver a empezar"
            continueButton.isHidden = true
            retryButton.alpha = 1
            /*sleep(3)
            dismiss(animated: true, completion: nil)*/
        }
    }
}
