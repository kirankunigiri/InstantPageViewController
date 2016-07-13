# SimplePageViewController ![Platform](https://img.shields.io/badge/platform-ios-orange.svg)
![License MIT](https://img.shields.io/badge/license-Unlicense-blue.svg)
![License MIT](https://img.shields.io/badge/build-passing-brightgreen.svg)

**How a Page View Controller should be. Simple.**
An extremely easy and quick way to create a Page View Controller. Also has the ability to scroll infinitely with one line of code!

**Note:** This page also contains a **detailed tutorial** on how to use this class and UIPageViewControllers. If you already know the basics, you can skip to the end, but it is highly suggested to read everything.

## Installation
Just download the source and add the SimplePageViewController.swift file to your project.

## What is this?
This project is fairly small. It's just one Swift file! But the SimplePageViewController class and examples can let you quickly and easily setup a Page View. It will also help you get a good understanding of how to use UIPageViewControllers yourself and customize them.

Apple's UIPageViewController makes you type up a lot of code that's unecessary for the standard Page View. This class simplifies it for you, and makes it extremely simple to setup a Page View in just minutes.

## Guide

Simple Page View Controller works by using a regular UIViewController, but adding a UIPageViewController on as a child. We'll refer to the UIViewController view as the **base view** (because it's at the bottom) and the overlying UIPageViewController view as the **page view**. By using this model, you can make certain items be static and stay on the screen (without moving along with it's respective page) by adding them to the base view. This is useful if you want to have, for example, an iPhone screen that stays in the middle, while the content moves from page to page.

There are 2 ways to use Simple Page View Controller. The first is to subclass it, allowing you to edit the base view via Storyboard. The second is to programmatically create it.

### Subclass or Programmatically create it?

When you subclass it, you can set this class to a ViewController on Storyboard. You now have control of the base view using Storyboard and can add static elements to it. When you programmatically create it and present it with a segue, you will have to edit the base view (if needed) using code. So ultimately, if you need to have a base view with static elements, subclass it!

### So how do I use it?

Let's get started using the subclass way. First, create a ViewController in storyboard. Then, create a new ViewController class, and make it a subclass of SimplePageViewController, and add in the SimplePageViewControllerDataSource.

It may seem weird, but we have to set the dataSource to self before calling ```super.viewDidLoad()```. Because this is a subclass, the ```super.viewDidLoad()``` needs the dataSource to run, and you need to set it beforehand.

```
class SubclassExampleViewController: SimplePageViewController, SimplePageViewControllerDataSource {

  override func viewDidLoad() {
    self.dataSource = self
    super.viewDidLoad()
  }
  
}
```

Next, we need to conform to the data source protocol. There's only one function that we'll have to conform to: ```getViewControllerList() -> [UIViewController]```. All we have to do is just return the list of the view controllers we want in the Page View! It can't get simpler than this.

If you don't know how to create ViewControllers programmatically, it's simple. You can create your view controllers in storyboard and give them all a Storyboard Identifier. Then, you can use ```self.storyboard?.instantiateViewControllerWithIdentifier("_IDENTIFIER_NAME_")``` to create one. You can also just create one reusable ViewController, and change it's content (Ex: ImageView, Label) depending on the page number.

```
func getViewControllerList() -> [UIViewController] {
  var viewControllerList: [UIViewController] = []
  
  // Fill up the array with your own view controllers.
  
  return viewControllerList
}
```

You can also add the ability to make it scroll infinitely! Just set the `scrollsInfinitely` property to true.

### Programmatically create it

There's only one difference here. Instead of subclassing it, you just create one programmatically and present it. This snippet of code will automatically present a Page View (but be sure to conform to the data source as we did before). Also, because it's not a subclass, you do not have to set the ```dataSource``` before ```super.viewDidLoad()```.

```
// Create the SimplePageViewController
let pageVC = SimplePageViewController()
pageVC.dataSource = self
pageVC.view.backgroundColor = UIColor.whiteColor()

// Present it
self.presentViewController(pageVC, animated: true) {}
```
## License
Unlicense. Do whatever you want. No credit required.  
