# ReplaceSegueDemo

Demonstrate a customized UIStoryboardSegue that make destinationController replace sourceController rather than regular Push.

1. The sequence of events:
viewDidLoad -> viewWillAppear -> viewWillLayoutSubviews(1) -> viewDidLayoutSubviews(1) -> viewDidAppear -> viewWillLayoutSubviews(2) -> viewDidLayoutSubviews(2)

You can see that viewWillLayoutSubviews and viewDidLayoutSubviews are actually get called twice.

2. When a view's parent is the root view, it gets the expected frame in the first viewDidLayoutSubviews.

3. When a view's patent is non-root view, it gets the expected frame in the viewDidAppear.

4. In #3, the more correct description is, when a view's autolayout depends on a non-root view, then it gets the expected frame in the viewDidAppear.
