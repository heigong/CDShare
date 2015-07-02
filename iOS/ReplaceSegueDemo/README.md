# ReplaceSegueDemo

Demonstrate a customized UIStoryboardSegue that make destinationController replace sourceController rather than regular Push.

The key is to replace the sourceController with destinationController in navigationController's viewControllers stack.

```
    override func perform() {
        let sourceController: UIViewController = self.sourceViewController as! UIViewController
        let destinationController: UIViewController = self.destinationViewController as! UIViewController
        let navigationController = sourceController.navigationController!
        let controlerStack = NSMutableArray(array: navigationController.viewControllers)
        
        controlerStack.replaceObjectAtIndex(controlerStack.indexOfObject(sourceController), withObject:destinationController)
        
        navigationController.setViewControllers(controlerStack as [AnyObject], animated: true)
    }
```
