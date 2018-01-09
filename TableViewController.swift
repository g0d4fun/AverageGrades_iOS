//
//  TableViewController.swift
//  GradesAverage
//
//  Created by Rafael Filipe Carreira Henriques on 03/01/2018.
//  Copyright © 2018 Rafael Filipe Carreira Henriques. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    let classesName = [["Análise Matemática I", "Álgebra Linear", "Gestão",
                              "Introdução à Programação","Sistemas Dígitais", "Tecnologias WEB"],
                             ["Análise Matemática II", "Eletrónica", "Fundamentos de Computação Gráfica", "Métodos Estatísticos", "Programação", "Tecnologia e Arquitetura de Computadores"],
                             ["Base de Dados", "Introdução à Inteligência Artifícial", "Introdução às Redes e Comunicação", "Investigação Operacional", "Programação Orientada a Objectos", "Sistemas Operativos"],
                             ["Conhecimento e Raciocínio", "Empreendedorismo e Inovação", "Interação Pessoa Máquina", "Modelação e Design", "Programação Avançada", "Sistemas Operativos II"],
                             ["Arquiteturas Móveis", "Estruturas de Dados", "Gestão de Projeto de Software","Programação Distríbuida", "Programação WEB"],["Ética e Deontologia", "Projeto ou Estágio"] ]
    
    let ects = [[6,5,5,5,5,4],
                [6,4,5,5,5,5],
                [5,5,5,5,5,5],
                [5,5,5,5,5,5],
                [6,6,6,6,6],
                [3,27]]
    
    var grades : [[Int]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        table.delegate = self
        table.dataSource = self
        
        let defaults = UserDefaults.standard
        
        if(defaults.object(forKey: "SavedGrades") == nil){
            let gradesBuild = [[-1,-1,-1,-1,-1,-1],
                          [-1,-1,-1,-1,-1,-1],
                          [-1,-1,-1,-1,-1,-1],
                          [-1,-1,-1,-1,-1,-1],
                          [-1,-1,-1,-1,-1],
                          [-1,-1]]
            defaults.set(gradesBuild, forKey: "SavedGrades")
        }
        grades = defaults.array(forKey: "SavedGrades")  as? [[Int]] ?? [[Int]]()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 6
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return classesName[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section){
        case 0:
            return "1 Year - 1 Semester"
        case 1:
            return "1 Year - 2 Semester"
        case 2:
            return "2 Year - 1 Semester"
        case 3:
            return "2 Year - 2 Semester"
        case 4:
            return "3 Year - 1 Semester"
        case 5:
            return "3 Year - 2 Semester"
        default:
            return "Issue"
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! TableViewCell

            let className = classesName[indexPath.section][indexPath.row]
            let ectsAux = ects[indexPath.section][indexPath.row]
            cell.UIClassName?.text = className;
            cell.UIEcts?.text = ectsAux.description + "  ects";
        
            let gradeAux = grades[indexPath.section][indexPath.row]
            if(gradeAux >= 10 && gradeAux <= 20){
                cell.UIGrade?.text = gradeAux.description
            }else{
                cell.UIGrade?.text = "";
            }

        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! TableViewCell
        
        let cell = table.cellForRow(at: indexPath) as! TableViewCell
        
        let className = classesName[indexPath.section][indexPath.row]
        let ectsAux = ects[indexPath.section][indexPath.row]
        cell.UIClassName?.text = className;
        cell.UIEcts?.text = ectsAux.description + "  ects";
        
        let gradeAuxString : String = (cell.UIGrade?.text)!
        if let gradeAux = Int(gradeAuxString){
            
            if(gradeAux >= 10 && gradeAux <= 20){
                
                cell.UIGrade?.text = gradeAux.description
                grades[indexPath.section][indexPath.row] = gradeAux
            }else{
                grades[indexPath.section][indexPath.row] = -1
                cell.UIGrade?.text = "";
            }
            //Save on Database
            let defaults = UserDefaults.standard
            defaults.set(grades, forKey: "SavedGrades")
        }else{
            
            cell.UIGrade.text = "";
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
