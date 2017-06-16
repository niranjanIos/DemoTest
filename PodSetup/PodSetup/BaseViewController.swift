//
//  BaseViewController.swift
//  HomePlus
//
//  Created by user on 24/11/16.
//  Copyright © 2016 Infograins. All rights reserved.
//

import UIKit
import REFrostedViewController

extension UIViewController {
    var titleString: String{
        switch self {
        case is HomeViewController:
            return "Home".localized
        case is ForgotPasswordViewController:
            return "for_pass".localized
        case is LoginViewController:
            return "login".localized
        case is HotSpotViewController:
            return "Hot_Spot".localized
        case is SignUpViewController:
            return "signup".localized
        case is CenasListViewController:
            return "cenas_info".localized
        case is CenasCombinedViewController:
            return "cenas_info".localized
        case is PostCenasViewController:
            return ""
        case is PickUpAddressViewController:
            return "pickup_address".localized
        case is ProviderTypeViewController:
            return "selectype".localized
        case is CommentsViewController:
            return "comment".localized
        case is CenasSelectionViewController:
            return "selectype".localized
        case is SearchViewController:
            return "search".localized
        case is NearByViewController:
            return "Near_By_Cenas".localized
        case is EditProfileViewController:
            return "edit_profile".localized
        case is MyCenasViewController:
            return "my_cenas".localized
        case is SuscriptionViewController:
            return "subscription".localized
        case is TransactionHistoryViewController:
            return "transition_history".localized
        case is UpgradePlanViewController:
            return "upgrade_plan".localized
        case is SuscriptionViewController:
            return "subscription".localized
        case is OrderHistoryListViewController:
            return "order_history".localized
        case is OrderCenasViewController:
            return ""
        case is CenasInformationViewController:
            return "cenas_info".localized
        case is ChangePasswordViewController:
            return "change_pass".localized
        case is ChattingViewController:
            return "conversation".localized
        case is ChatRequestViewController:
            return "friend_request".localized
        case is HotSpotViewController:
            return "Hot_Spot".localized
        case is SettingViewController:
            return "Setting".localized
        case is ProviderTypeViewController:
            return "selectype".localized
        case is OrderListOnCenasViewController:
            return "book_history".localized
        case is SharingListViewController:
            return "share_cenas".localized
        default:
            return ""
        }
    }
}

extension UIViewController {
    
    func popViewController() -> UIViewController?{
        return self.navigationController?.popViewController(animated:true)
    }
    func showNavigation() {
        self.navigationController?.isNavigationBarHidden = false;
    }
    func hideNavigation() {
        self.navigationController?.isNavigationBarHidden = true;
    }
    func hideBackButton(){
        self.navigationController?.navigationItem.hidesBackButton = true
    }
    func showSideMenu(){
        if AppPreferences.currentLanguage == AppLanguage.arabic{
           self.frostedViewController.direction = .right
        }else{
            self.frostedViewController.direction = .left
        }
        self.frostedViewController?.presentMenuViewController()

    }
    func hideSideMenu(){
        self.frostedViewController?.hideMenuViewController()
    }
    
    func hideTabBar(){
        self.tabBarController?.tabBar.isHidden = true
    }
    func showTabBar(){
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func showAnnouncment(withMessage message: String, closer:(()-> Void)? = nil){
        let alertController =   UIAlertController(title: Utils.AppName(), message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { (action:UIAlertAction!) in
            closer?()
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

class RootNavigationController: UINavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().barStyle = .black
        UINavigationBar.appearance().barTintColor = UIColor.init(netHex: Constants.AppPrefrencesConstants.Color.ThemeColorHexCode)
//        if AppPreferences.isAppFirstLaunch(){
//            UserDefaults.standard.set(false, forKey:"termsfulfill" )
//            UserDefaults.standard.synchronize()
//        }
//        let status = UserDefaults.standard.bool(forKey: "termsfulfill" )
//        var identifier: String
//                let userData = SharedPreference.getUserData()
//            if userData.isLogin && userData.isProfileVerified {
//                identifier = "RoastedViewController"
//            }else{
//                identifier = LoginViewController.identifier
//            }
        let  controller = storyboard?.instantiateViewController(withIdentifier: LoginViewController.identifier)
        self.pushViewController(controller!, animated: true);
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showNavigation()
        let myString = self.titleString

        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.black, NSFontAttributeName:UIFont.systemFont(ofSize: 15.0)]

    let myAttribute = [ NSForegroundColorAttributeName: UIColor.black ]
        let myAttrString = NSAttributedString(string: myString, attributes: myAttribute)
        // set attributed text on a UILabel
        self.navigationItem.title = self.titleString
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

protocol ViewControllerIdentifier{
    static var identifier:String {get}
}

extension BaseViewController: ViewControllerIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
    func setUpMenuButton(){
        let leftButton = UIButton(type: .custom)
        leftButton.setImage(#imageLiteral(resourceName: "menu"), for: UIControlState.normal)
        leftButton.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: NavigationIconSize.Navigation.Menu)
        leftButton.addTarget(self, action: #selector(self.menuClick), for: .touchUpInside)
        leftButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        let leftBarButton = UIBarButtonItem()
        leftBarButton.customView = leftButton
//        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationItem.leftBarButtonItem = leftBarButton
        if UIApplication.isRTL(){
            self.navigationItem.leftBarButtonItem = leftBarButton
        }
    }
    
    func setUpBackButton(){
        let leftButton = UIButton(type: .custom)
        leftButton.setImage(#imageLiteral(resourceName: "darkback"), for: UIControlState.normal)
        leftButton.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: NavigationIconSize.Navigation.Menu)
        leftButton.addTarget(self, action: #selector(self.backClick), for: .touchUpInside)
        leftButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        let leftBarButton = UIBarButtonItem()
        leftBarButton.customView = leftButton
       
        self.navigationController?.navigationBar.tintColor = UIColor.gray
//        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationItem.leftBarButtonItem = leftBarButton
        if UIApplication.isRTL(){
            self.navigationItem.leftBarButtonItem = leftBarButton
        }
    }
    func setUptitle() {
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        self.navigationController?.navigationBar.topItem?.title = self.titleString
    }
    @objc fileprivate func menuClick(){
        self.showSideMenu()
    }
    @objc  func backClick(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    func hideMenuButton() {
        self.navigationItem.leftBarButtonItem = nil;
    }
    
    func presentViewControllerToNavigation(_ viewControllerToPresent: UIViewController, animated: Bool,
                                           modalPresentationStyle: UIModalPresentationStyle = .overCurrentContext,
                                           compilation: (() -> Void)?) {
        
        guard let navigation = self.navigationController else{return}
        
        self.presentViewController(viewControllerToPresent, presentingViewController: navigation, animated: animated, compilation: compilation)
    }
    func presentViewController(_ viewControllerToPresent: UIViewController,
                               presentingViewController: UIViewController,
                               animated: Bool,
                               modalPresentationStyle: UIModalPresentationStyle = .overCurrentContext,
                               compilation: (() -> Void)?){
        
        viewControllerToPresent.modalPresentationStyle = modalPresentationStyle
        presentingViewController.present(viewControllerToPresent, animated: animated, completion: compilation)
    }
    
}

struct NavigationIconSize{
    struct Navigation{
        static var Menu:CGSize {
            return CGSize(width: 20, height: 20)
        }
        static var Back:CGSize {
            return CGSize(width: 20, height: 20)
        }
    }
}

