//
//  KGHomePageTableViewController.swift
//  KazemaGlobal
//
//  Created by Srishti on 06/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import UIKit

class KGHomePageTableViewController: UITableViewController {
    
    @IBOutlet weak var pageControlKrs: UIPageControl!
    @IBOutlet weak var pageControlKmsll: UIPageControl!
    @IBOutlet weak var pageControls: UIPageControl!
    @IBOutlet weak var krsCollectionView: UICollectionView!
    @IBOutlet weak var kmswllCollectionView: UICollectionView!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    var label  = UILabel()
    var currentPageIndex = 0
    var currentKmsllPage = 0
    var currentKrsPage = 0
    var sliderImages = ["banner1","banner2"]
    var kmswllimagesTitle = ["Labour only contract (LO)","Contracts with parts (WPO)","Contracts with parts and compressors(WPC)"]
    var kmswllimagesDesc = ["Labour only contract without parts","Contracts with parts without compressors","Contracts with parts & compressors"]
    var kmswllimages = ["lo","wpc","wpo"]
    var krsimages = ["ductcleaning-300x148","pests-300x141","kitchenhoods-300x184","external-cleaning-300x204","grindingpolish-300x182","carpets-300x286","chandl-1-205x300"]
    var krsimagesTitle = ["Air Conditioning Duct Cleaning Service","Pest Control Service","Kitchen Hoods Cleaning Service","Building External Cleaning Service","Marble Grinding & Polishing Service with Diamond Discs","Carpet Cleaning Service","Chandelier Cleaning Service"]
    var krsimagesDesc = ["Labour only contract without parts","Contracts with parts without compressors","Contracts with parts & compressors"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        pageControlKrs.numberOfPages = krsimages.count
        pageControlKmsll.numberOfPages = kmswllimagesDesc.count
        pageControls.numberOfPages = sliderImages.count
        let columnLayout = ColumnFlowLayout.init(cellsPerRow: 3, minimumInteritemSpacing: 10.0, minimumLineSpacing: 10.0, sectionInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), cellHeight: 207, cellWidth: UIScreen.main.bounds.size.width - 40,scrollDirec: .horizontal)
        
        sliderCollectionView.collectionViewLayout = columnLayout
        sliderCollectionView.reloadData()
        
        let columnLayout1 = ColumnFlowLayout.init(cellsPerRow: 3, minimumInteritemSpacing: 5.0, minimumLineSpacing: 10.0, sectionInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), cellHeight: 313, cellWidth: 274,scrollDirec: .horizontal)
        
        kmswllCollectionView.collectionViewLayout = columnLayout1
        kmswllCollectionView.reloadData()
        
        let columnLayout2 = ColumnFlowLayout.init(cellsPerRow: 3, minimumInteritemSpacing: 5.0, minimumLineSpacing: 10.0, sectionInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), cellHeight: 313, cellWidth: 274,scrollDirec: .horizontal)
        
        krsCollectionView.collectionViewLayout = columnLayout2
        krsCollectionView.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    //    MARK: Set Navigationbar
    func setNavigationBar(){
        // Middle Button
        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 35.0, height: 35.0)
        self.navigationItem.titleView = imageView
        
        //Right Bar Button
        let button = UIButton(type: .custom)
        button.setImage(UIImage (named: "bell"), for: .normal)
        button.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
        label = UILabel(frame: CGRect(x: 20, y: 0, width: 18, height: 18))
        label.backgroundColor = UIColor.red
        label.text = "3"
        label.textColor = UIColor.white
        label.font = label.font.withSize(10)
        label.textAlignment = .center
        label.layer.cornerRadius = label.frame.size.width/2
        label.layer.masksToBounds = true
        button.addSubview(label)
        let barButtonItem = UIBarButtonItem(customView: button)
        
        let button2 = UIButton(type: .custom)
        button2.setImage(UIImage (named: "globe"), for: .normal)
        button2.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
        
        let barButtonItem2 = UIBarButtonItem(customView: button2)
        self.navigationItem.rightBarButtonItems = [barButtonItem, barButtonItem2]
        
        //Left Bar Button
        let button3 = UIButton(type: .custom)
        button3.setImage(UIImage (named: "sidebar"), for: .normal)
        button3.frame = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0)
        button3.addTarget(target, action: #selector(toggleSidemenu), for: .touchUpInside)
        let barButtonItem3 = UIBarButtonItem(customView: button3)
        self.navigationItem.leftBarButtonItem = barButtonItem3
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @objc func toggleSidemenu()
    {
        DispatchQueue.main.async(execute: {
            self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
        })
    }
    
    //Mark:- BUTTON ACTION
    
    @IBAction func viewAllMaintenanceButtonAction(_ sender: UIButton) {
        let maintenancePageVC = self.storyboard?.instantiateViewController(withIdentifier: "KGKazemaMaintenanceServiceViewController") as!  KGKazemaMaintenanceServiceViewController
        maintenancePageVC.isFromProfile = true
        self.navigationController?.pushViewController(maintenancePageVC, animated: true)
    }
    @IBAction func viewAllButtonAction(_ sender: UIButton) {
        let cleaningPageVC = self.storyboard?.instantiateViewController(withIdentifier: "KGCleaningServiceViewController") as!  KGCleaningServiceViewController
        cleaningPageVC.isFromProfile = true
        self.navigationController?.pushViewController(cleaningPageVC, animated: true)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    
    
}
extension KGHomePageTableViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == sliderCollectionView ? 2 : collectionView == kmswllCollectionView ? 3: 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sliderCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! KGHomeCollectionViewCell
            cell.sliderImageView.image = UIImage(named: sliderImages[indexPath.row])
            
            return cell
        }else if collectionView == kmswllCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KMMSWLLCell", for: indexPath) as! KGKazemaMaintenanceServiceCollectionViewCell
            cell.kmswllImageView.image = UIImage(named: kmswllimages[indexPath.row])
            cell.kmswllTitle.text = kmswllimagesTitle[indexPath.row]
            cell.kmswllDescription.text = kmswllimagesDesc[indexPath.row]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KRSCell", for: indexPath) as! KGKleanRiteServiceCollectionViewCell
          
           cell.krsImageView.image = UIImage(named: krsimages[indexPath.row])
            cell.krsTitle.text = krsimagesTitle[indexPath.row]
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == kmswllCollectionView{
            let descriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "KGDescriptionPageViewController") as!  KGDescriptionPageViewController
            descriptionVC.isFromProfile = true
            descriptionVC.desubtitle = "By Kazema Maintenance"
            if indexPath.row == 0{
                descriptionVC.desString = "•  Labor only contracts without parts."
                descriptionVC.destitle = "Labor only contracts (LO)"
            }else if indexPath.row == 1{
                descriptionVC.desString = "•  Contracts with parts without Compressors."
                descriptionVC.destitle = "Contracts with parts (WPO)"
            }else{
                descriptionVC.desString = "•  Contracts with parts with Compressors."
                descriptionVC.destitle = "Contracts with parts and Compressors (WPC)"
            }
            self.navigationController?.pushViewController(descriptionVC, animated: true)
        }else if collectionView == krsCollectionView{
            let descriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "KGDescriptionPageViewController") as!  KGDescriptionPageViewController
            descriptionVC.isFromProfile = true
            descriptionVC.desubtitle = "By Klean Rite"
            if indexPath.row == 0{
                let bullet = "•  "
                var strings = [String]()
                strings.append("Cleaning and Sanitizing Air-Conditioning ducts from dust and pollutants..")
                strings.append("Getting rid of harmful bacteria, fungus by using materials approved by EPA.")
                strings.append("Getting rid of smoke caused by Fire and removal of odor inside A/C duct.")
                strings.append("Relief from Sick Building Syndrome such as allergy & headache.")
                strings.append("Providing customers with CD of A/C duct before and after cleaning.")
                strings = strings.map { return bullet + $0 }
                
                var attributes = [NSAttributedString.Key: Any]()
                attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
                attributes[.foregroundColor] = UIColor.black
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
                attributes[.paragraphStyle] = paragraphStyle
                
                let string = strings.joined(separator: "\n")
                
                descriptionVC.desKrsString = NSAttributedString(string: string, attributes: attributes)
                descriptionVC.destitle = "Air Conditioning Duct Cleaning Service"
            }else if indexPath.row == 1{
                
                let bullet = " "
                var strings = [String]()
                strings.append("We implement the latest techniques in destroying pests in residential buildings as well as sites under construction.We use safe pest control materials which are approved by Ministry of Health(MOH).")
                strings.append("Licensed by MOH since 1998 (No.17).")
                
                strings = strings.map { return bullet + $0 }
                
                var attributes = [NSAttributedString.Key: Any]()
                attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
                attributes[.foregroundColor] = UIColor.black
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
                attributes[.paragraphStyle] = paragraphStyle
                
                let string = strings.joined(separator: "\n")
                
                descriptionVC.desKrsString = NSAttributedString(string: string, attributes: attributes)
                descriptionVC.destitle = "Pest Control Service"
            }else if indexPath.row == 2{
                // let bullet = "•  "
                
                var strings = [String]()
                strings.append("Avoid the risk of fires caused by oil, grease, pollutants inside your kitchen hood and exhaust fans. We at Klean Rite clean the following :")
                strings.append("• Restaurants kitchen hood.")
                strings.append("• Hotels Kitchen Hood.")
                strings.append("• Hospitals Kitchen Hood.")
                strings.append("We Provide customers with CD of your kitchen hood before and after cleaning.")
                
                var attributes = [NSAttributedString.Key: Any]()
                attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
                attributes[.foregroundColor] = UIColor.black
                
                let string = strings.joined(separator: "\n\n")
                descriptionVC.desKrsString = NSAttributedString(string: string, attributes: attributes)
                descriptionVC.destitle = "Kitchen Hoods Cleaning Service"
            }else if indexPath.row == 3{
                var strings = [String]()
                strings.append("We are using Pure Clean System from UK for cleaning the following:")
                strings.append("• Stone cleaning and protection")
                strings.append("• Glass cleaning")
                strings.append("• Sigma cleaning")
                strings.append("By Using")
                strings.append("• 100% pure water")
                strings.append("• No scaffolding required")
                strings.append("• Without wiping")
                var attributes = [NSAttributedString.Key: Any]()
                attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
                attributes[.foregroundColor] = UIColor.black
                
                let string = strings.joined(separator: "\n\n")
                descriptionVC.desKrsString = NSAttributedString(string: string, attributes: attributes)
                descriptionVC.destitle = "Building External Cleaning Service"
            }else if indexPath.row == 4{
                var strings = [String]()
                strings.append("Klean rite provides specialist services of marble grinding and polishing with diamond discs and use the best machines to give the marble re-brightness by using latest techniques to ensure superb quality")
                var attributes = [NSAttributedString.Key: Any]()
                attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
                attributes[.foregroundColor] = UIColor.black
                let string = strings.joined(separator: "")
                descriptionVC.desKrsString = NSAttributedString(string: string, attributes: attributes)
                descriptionVC.destitle = "Marble Grinding & Polishing Service with Diamond Discs"
            }else if indexPath.row == 5{
                let bullet = "•  "
                var strings = [String]()
                strings.append("Carpet cleaning and sanitizing without using shampoo.")
                strings.append("Persian rug Cleaning.")
                strings.append("Upholstery Cleaning.")
                strings.append("Bring brightness to all types of carpets and sofas.")
                strings = strings.map { return bullet + $0 }
                
                var attributes = [NSAttributedString.Key: Any]()
                attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
                attributes[.foregroundColor] = UIColor.black
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
                attributes[.paragraphStyle] = paragraphStyle
                
                let string = strings.joined(separator: "\n")
                
                descriptionVC.desKrsString = NSAttributedString(string: string, attributes: attributes)
                descriptionVC.destitle = "Carpet Cleaning Service"
            }else {
                let bullet = "•  "
                var strings = [String]()
                strings.append("Chandelier cleaning and polishing.")
                strings.append("Ensure brightness and best shines of chandeliers.")
                strings = strings.map { return bullet + $0 }
                
                var attributes = [NSAttributedString.Key: Any]()
                attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
                attributes[.foregroundColor] = UIColor.black
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
                attributes[.paragraphStyle] = paragraphStyle
                
                let string = strings.joined(separator: "\n")
                
                descriptionVC.desKrsString = NSAttributedString(string: string, attributes: attributes)
                descriptionVC.destitle = "Chandelier Cleaning Service"
            }
            self.navigationController?.pushViewController(descriptionVC, animated: true)
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPageIndex = Int(scrollView.contentOffset.x / sliderCollectionView.frame.size.width)
        pageControls.currentPage = currentPageIndex
        
        currentKmsllPage = Int(scrollView.contentOffset.x / kmswllCollectionView.frame.size.width)
        pageControlKmsll.currentPage = currentKmsllPage
        
          currentKrsPage = Int(scrollView.contentOffset.x / krsCollectionView.frame.size.width)
        pageControlKrs.currentPage = currentKrsPage
    }
    
    
}
