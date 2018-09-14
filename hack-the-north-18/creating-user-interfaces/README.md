# HTN18: Creating User Interfaces

- [Summary Sheet](https://docs.google.com/document/d/1mmH0BXk2zEGJ0ucZoR39PuCKaPnflCpToVv9WA_bG2Y/edit?ts=5b663567)
- [Slides](https://docs.google.com/presentation/d/1FlJqe5BVrnD2z4ydVD04q5jSn5EWhXEPpFP0Ue35z7Q/edit?usp=sharing) 

## Target Audience

Some programming experience required, iOS experience not necessary.

## Prerequisites

- In order to develop iOS apps, you must be using macOS

- Install Xcode from the Mac App Store

- Familiarity with Git and GitHub is recommended, but not necessary.

- Some programming experience is recommended, but not necessary.

## Goals

The goal of this workshop is to help newcomers to iOS app development get started with creating user interfaces with AutoLayout. We will be going through building the interface for an iOS application, so you can follow along with your own computer.

## Introduction and Setup (0:00-5:00)

I’m Devon Boyer, currently in 4A Computer Science at UWaterloo. I have been developing iOS apps since 2013 starting with iOS7.

My first job was at a startup in London, Ontario doing iOS development where I worked on an iOS app for conferences that attendees could use to chat and connect with each other (no longer on the App Store). A year or two later, during my first co-op at UWaterloo I worked at Shopify on the Point of Sale iOS App, mostly working on refactoring the UI to use AutoLayout (more on AutoLayout later).

The focus of this workshop is on learning how to use AutoLayout to create the UI for an app. We will briefly look at how we can get data from the Internet using a public API to display data in the app.

### iOS Development

Most knowledge about iOS is gained through experience working with Apple’s frameworks (UIKit and Foundation) and reading open-source code to learn conventions and design patterns.

80% spent on your time will be spent learning UIKit and other Apple frameworks and 20% will be spent on learning Swift. However, learning idiomatic Swift also requires a lot of practice and experience.

Apple releases a new version of iOS every year and usually adds new frameworks that developers need to become familiar with. Most recently, Apple added ARKit CoreML. Keeping up with the latest iOS conventions and frameworks takes a lot of work.

### Setup

We are going to be building a simple app step-by-step to display information about your GitHub repositories.

Clone the starter project from GitHub.

```bash
git clone https://github.com/devonboyer/workshops.git
```

For help learning how to clone a git repository see https://help.github.com/articles/cloning-a-repository/).

This repository contains the `GitList-Starter` project we will be working on together in this workshop and the finished `GitList` project.

## Swift and Xcode (5:00-10:00)

Swift is an open-source, compiled, type-safe language developed by Apple to replace Objective-C as the lanaguage used to develop iOS apps.

> Industry Fact: The Shopify mobile app was re-written entirely in Swift in 2016.

Swift has a lot of syntactic sugar for working with optionals (more on this later), generics, protocols and preventing many levels of indentation. We are going to focus on writing Swift with an Objective-C style syntax instead of using "idomatic" Swift patterns, which are very powerful but take practice to understand and master.

<sup>
<strong>References</strong><br>
https://en.wikipedia.org/wiki/Swift_(programming_language)
</sup>

### Optionals

Swift introduces the concept of optional types that deal with what happens when a variable has no value (or is "null"). Variables must be declared as optional or not optional. An optional variable can be "null" but a non-optional variable can't be null; this is enfored by the compiler. Optionals prevent you from dereferencing null pointers and work for any type like `Int`, `Bool`, and `Array`.

```Swift
var myName: String = nil        // won't compile because myName is declared as non-optional
print("My name is \(myName).")
```

```Swift     
var myName: String? = nil       // compiles because myName is declared as optional
print("My name is \(String(describing: myName)).")
```

Swift has a lot of syntactic sugar for working with optionals. It will take practice to learn how to make the best use of optionals in your code.

<sup>
<strong>References</strong><br>
https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html
</sup>

### Named parameters

Swift brought over the concept of named parameters from Objective-C. With named parameters the language makes you clearly state the name of each parameter in a function call.

```Swift     
class Message {
    let sender: String
    let body: String
    let sentAt: Date
    
    init(sender: String, body: String, sentAt: Date) {
        self.sender = sender
        self.body = body
        self.sentAt = sentAt
    }
}

let message = Message(sender: "Devon", body: "Welcome to Hack the North!", sentAt: Date())
```

<sup>
<strong>References</strong><br>
https://en.wikipedia.org/wiki/Named_parameter
</sup>

### Xcode

Xcode is the IDE used to develop iOS apps. Just like most IDEs, Xcode hides the gory details of how to compile and run an iOS app.

Xcode is a very feature rich IDE (not all of which are useful). As a warning, the code completion system and Xcode itself may crash from time to time as your coding.

Apple new adds features to Xcode every year, just like they add new frameworks every year.

## Cocoa Touch and 3rd Party Libraries (10:00-12:00)

### Cocoa Touch

Cocoa Touch is the collective term for all of the libraries used to develop iOS apps (like Java Swing from CS349) and includes frameworks like UIKit, MapKit, and ARKit.

Cocoa Touch provides everything you need to build an iOS app but there are many awesome third-party libraries that wrap these frameworks in nicer APIs or provide alternate implementations (like using Google Maps SDK instead of Apple's MapKit).

Cocoa Touch uses the Model-View-Controller (MVC) pattern (more on this later).

### CocoaPods

[CocoaPods](https://cocoapods.org/) is the most popular dependency manager for Swift and Objective-C projects. We will use the `Alamofire` pod in this workshop to help make HTTP requests to the GitHub API to retrieve our list of repositories.

<sup>
<strong>References</strong><br>
https://www.techopedia.com/definition/27562/cocoa-touch-ios
</sup>

## Models, Views and View Controllers (12:00-15:00)

A model object contains data needed to configure the view like the User object we looked at earlier.

A view contains the buttons, labels, text fields that make your app interesting. Many useful built in views in UIKit like `UITableView`.

A view controller represents a "screen" and are responsible for is respnsible for updating the view in response to changes to a model like updating your profile view in the Twitter app if you edit your bio. View controllers also deal with changing the view based to support touch interactions like "pinch to zoom" or changes in orientation when you rotate your phone.

<sup>
<strong>References</strong><br>
https://www.tutorialspoint.com/mvc_framework/mvc_framework_introduction.htm
https://developer.apple.com/documentation/uikit/uiviewcontroller
</sup>

## Workshop (15:00:40:00)

We are going to be building a simple app step-by-step to display some information about your GitHub repositories (if you don't have a GitHub account feel free to use `devonboyer` or any other username).

We will be completing the following tasks in the `GitHub-Starter` app:

1. Create the application window.
2. Implement UITableViewDataSource required methods
3. Make an HTTP request for our GitHub repos
4. Add AutoLayout constraints for the description label
5. Add Autolayout constraints for the CountView subviews
6. Configure fonts and text colors of labels

### AutoLayout

AutoLayout dynamically computes the size and position for your views, based on constraints placed on those views like constraining a button to always be centered horizontaly.

Adding constrains with AutoLayout, like most things in iOS, takes a lot of practice and experience but mastering AutoLayout has been one of the most useful skills I have acquired when developing iOS app, so that is what we will focus on in this workshop.

<sup>
<strong>References</strong><br>
https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/index.html
</sup>

### Interface Builder

"The Interface Builder editor within Xcode makes it simple to design a full user interface without writing any code".

Interface Builder uses a drag and drop interface to add buttons, labels, and text fields to views to build each screen of your app.

Storyboards are a visual representation of the app that shows the UI for each screen and the connections between those screens.

The underlying system that handles layout for Interface Builder is AutoLayout.

#### Issues with Interface Builder 

Here are some problems I have experienced when using Interface Builder (YMMV)

- It is common to have at most one or two storyboards for the entire application. If two people make seemingly independent changes to a storyboard it may still cause merge conflicts (this may not be true anymore since storyboards have improved a lot since iOS7).

- You can't edit the underlying code that is generated for a storyboard, so things like using custom fonts and colors, renaming a class, can only be changed using Interface Builder.

- Making any modifications to the UI like adding or deleting a label, may require you to redo the AutoLayout constraints in Interface Builder.

> Industry Fact: Shopify did not use storyboards when I worked on the Point of Sale app in 2016.

<sup>
<strong>References</strong><br>
https://developer.apple.com/xcode/interface-builder/
https://developer.apple.com/library/archive/documentation/General/Conceptual/Devpedia-CocoaApp/Storyboard.html
</sup>

## Useful Resources

- [WWDC 2017](https://developer.apple.com/videos/wwdc2017/)
- [raywnderlich.com](https://www.raywenderlich.com/)
- [NSHipster](https://nshipster.com/)
