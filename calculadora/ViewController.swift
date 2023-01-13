//
//  ViewController.swift
//  calculadora
//
//  Created by Escuela de Tecnologías Aplicadas on 9/1/23, Alumno: Miguel Carpio Contreras.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ceroBoton: UIButton!
    @IBOutlet weak var comaBoton: UIButton!
    @IBOutlet weak var igualBoton: UIButton!
    @IBOutlet weak var unoBoton: UIButton!
    @IBOutlet weak var dosBoton: UIButton!
    @IBOutlet weak var masBoton: UIButton!
    @IBOutlet weak var tresBoton: UIButton!
    @IBOutlet weak var cuatroBoton: UIButton!
    @IBOutlet weak var cincoBoton: UIButton!
    @IBOutlet weak var seisBoton: UIButton!
    @IBOutlet weak var menosBoton: UIButton!
    @IBOutlet weak var sieteBoton: UIButton!
    @IBOutlet weak var ochoBoton: UIButton!
    @IBOutlet weak var nueveBoton: UIButton!
    @IBOutlet weak var multiBoton: UIButton!
    @IBOutlet weak var diviBoton: UIButton!
    @IBOutlet weak var porcenBoton: UIButton!
    @IBOutlet weak var dualBoton: UIButton!
    @IBOutlet weak var borrarBoton: UIButton!
    @IBOutlet weak var cuadroNumero: UILabel!
    
    var thePot = 0
    var firstElement = 0
    var finalResult = 0
    var checkOper = false
    var sRou = false
    
    var losOperandos: Operaciones?

    enum Operaciones {
        case sumar, restar, multiplicar, dividir, porcentaje
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cuadroNumero.text = "0"
        borrarBoton.setTitle("AC", for: .normal)
    }
    
    //
    @IBAction func deleteTextAction(_ sender: UIButton) {
        cuadroNumero.text = "0"
        finalResult = 0
        firstElement = 0
        checkOper = false
        sRou = false
        borrarBoton.setTitle("AC", for: .normal)
        
    }
    
    //cambiar el numero entre negativo y positivo
    @IBAction func negativePositive(_ sender: UIButton) {
        
        if cuadroNumero.text == "0" {
            cuadroNumero.text = "0"
        }else if cuadroNumero.text!.first == "-" {
            cuadroNumero.text!.removeFirst()
        }else{
            cuadroNumero.text = "-" + cuadroNumero.text!
        }
    }
    
    //los botones de numeros tendran un tag asignado equivalente a su valor
    @IBAction func numButton(_ sender: UIButton) {
        let tagNum = sender.tag
        print(tagNum)
        print(checkOper)
        
        borrarBoton.setTitle("C", for: .normal)
        
      
        if cuadroNumero.text == "0" {
            cuadroNumero.text! = "\(tagNum)"
        }else if checkOper == true{
            if sRou != true {
                cuadroNumero.text! = "\(tagNum)"
                sRou = true
            }else{
                cuadroNumero.text! += "\(tagNum)"
            }
            
        }else{
            cuadroNumero.text! += "\(tagNum)"
        }
    }
    
    //accion de los botones de operadores
    @IBAction func OperatorButton(_ sender: UIButton) {
        let tagOpe = sender.tag
        print(tagOpe)

        if let text = cuadroNumero.text, let value = Int(text), firstElement == 0 {
            firstElement = value
        }
        
        if checkOper == true {
            if let calculo = losOperandos {
                var secondElement = 0
                
                if let text = cuadroNumero.text, let value = Int(text) {
                    secondElement = value
                }

                switch calculo {
                case .sumar:
                    firstElement = firstElement + secondElement
                    print(finalResult)
                    
                    break

                case .restar:
                    firstElement = firstElement - secondElement
                    print(finalResult)
                    break

                case .multiplicar:
                    firstElement = firstElement * secondElement
                    print(finalResult)
                    break

                case .dividir:
                    firstElement = firstElement / secondElement
                    print(finalResult)
                    
                    break
                    
                case .porcentaje:
                    firstElement = (secondElement * firstElement) / 100
                    print(finalResult)
                    
                    break
                }
                cuadroNumero.text = "\(firstElement)"
                finalResult = firstElement
            }
        }
        
        switch tagOpe {
            
        case 11:
            losOperandos = .sumar
            checkOper = true
            sRou = false
            break
        case 12:
            losOperandos = .restar
            checkOper = true
            sRou = false
            break
        case 13:
            losOperandos = .multiplicar
            checkOper = true
            sRou = false
            break
        case 14:
            losOperandos = .dividir
            checkOper = true
            sRou = false
            break
        case 15:
            cuadroNumero.text = "\(finalResult)"
            checkOper = false
            sRou = false
            break
        case 16:
            losOperandos = .porcentaje
            checkOper = true
            sRou = false
            break
        
        default:
            checkOper = true
            sRou = false
            break
        }
    }
    
}

