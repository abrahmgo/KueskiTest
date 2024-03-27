# KueskiTest
![](https://img.shields.io/github/stars/pandao/editor.md.svg) ![](https://img.shields.io/github/forks/pandao/editor.md.svg) ![](https://img.shields.io/github/tag/pandao/editor.md.svg) ![](https://img.shields.io/github/release/pandao/editor.md.svg) ![](https://img.shields.io/github/issues/pandao/editor.md.svg) ![](https://img.shields.io/bower/v/editor.md.svg)

### Features

- List and grid view
- Online and mock app
- Check your favorites movies
- Pagination
- Moview detail


## How to install?
                
----

### Token and api

Open the file `.env` and paste your own tokens

### Gemfile and Pods

You must have certain dependencies so, use Gemfile to install it, run
```swift
bundle install
bundle exec pod install --repo-update
```

### Problems?

Use homebrew to install the dependencies and then run the previous commands


### Workspace and SPM

If everything works great, open `KueskiTest.xcworkspace` and SPM start installing certain dependencies.

### Run

select the  target `TheMoviewDB` and your favorite iphone, run it.

### Project Dependencies

- Nuke (for image)
- Alamofire (for request)

### Do you want to run in mock mode?

Go to file `APIConfig` in main app, and change the var `useSampleData` to true to run with sample data, or false if you want to run with real data

### The app

The demo was coded with a combination between swift ui and ui kit, everything was separated into layers, taking into account clean architecture as a reference, where the lower layers do not know upper layers, everything is decoupled

### Why use a gemfile?

It is essential that the entire development team work on the same version of dependencies, thus ensuring that they work in the same environment
