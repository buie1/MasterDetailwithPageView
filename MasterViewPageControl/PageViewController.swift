//
//  PageViewController.swift
//  MasterViewPageControl
//
//  Created by Jonathan Buie on 10/24/16.
//  Copyright © 2016 Jonathan Buie. All rights reserved.
//

import UIKit

class PageViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    
    // MARK: Variables
    
    var pageViewController: UIPageViewController!
    var detail: NSDate!
    let pages = ["Detail","DetailBlue","DetailRed"]
    
    var currentIndex: Int!
    private var pendingIndex: Int!
    
    
    
    //MARK: IBOutlets
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    
    // MARK: Page View Controller Datasource
    //http://samwize.com/2016/03/08/using-uipageviewcontroller-with-custom-uipagecontrol/
    
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerBeforeViewController
        viewController: UIViewController) -> UIViewController? {
        
        
        currentIndex = pages.indexOf(viewController.restorationIdentifier!)
        if currentIndex == 0{
            return nil
        }
        //let previousIndex = abs((currentIndex - 1) % pages.count)
        let previousIndex = (currentIndex - 1 ) % pages.count
        return viewControllerAtIndex(previousIndex)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerAfterViewController
        viewController: UIViewController) -> UIViewController? {
        currentIndex = pages.indexOf(viewController.restorationIdentifier!)
        if currentIndex == pages.count - 1 {
            return nil
        }
        //let nextIndex = abs((currentIndex+1) % pages.count)
        let nextIndex = (currentIndex+1) % pages.count
        return viewControllerAtIndex(nextIndex)
        
    }
    
    func viewControllerAtIndex(index: Int)-> UIViewController? {
        let vc = storyboard?.instantiateViewControllerWithIdentifier(pages[index])
        
        if vc?.restorationIdentifier == "Detail"{
            //(vc as! DisplayTextViewController).descriptionString = member.describeMe()
            if self.detail != nil {
                (vc as! DetailViewController).detailItem = self.detail.description
            }else{
                vc as! DetailViewController
            }
        }else if vc?.restorationIdentifier == "DetailBlue"{
            //(vc as! AnimateViewController).animateImage = member.getAnimate()
            if self.detail != nil{
                (vc as! DetailViewControllerBlue).detailItem = self.detail.description
            }else{
                vc as! DetailViewControllerBlue
            }
        }else if vc?.restorationIdentifier == "DetailRed"{
            if self.detail != nil{
                (vc as! DetailViewControllerRed).detailItem = self.detail.description
            }else{
                vc as! DetailViewControllerRed
            }
        }
        return vc
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        pendingIndex = pages.indexOf((pendingViewControllers.last?.restorationIdentifier)!)
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            currentIndex = pendingIndex
            if let index = currentIndex {
                pageControl.currentPage = index
            }
        }
    }
    
    // MARK: View Lifecycle Funcitons
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let vc = storyboard?.instantiateViewControllerWithIdentifier("DetailsPageViewController"){
            self.addChildViewController(vc)
            self.view.addSubview(vc.view)
            
            self.navigationItem.setHidesBackButton(false, animated: false)
            
            
            pageViewController = vc as! UIPageViewController
            pageViewController.dataSource = self
            pageViewController.delegate = self
            
            pageViewController.setViewControllers([viewControllerAtIndex(0)!], direction: .Forward, animated: true, completion: nil)
            pageViewController.didMoveToParentViewController(self)
            
        }
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}