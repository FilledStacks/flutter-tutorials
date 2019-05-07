# Flutter using AppSkeletons - ScopedModel architecture

This project has been generated with [AppSkeletons](https://www.appskeletons.com).

This project serves as a starting point and guideline for how to develop a production application in Flutter using the ScopeModel architecture. This architecture can be implemented in more than one way, but this is the way we found it to work best for long term code health.

ScopedModel is not a pattern for large apps, but using it this way you can push the limits of what you can achieve in terms on the size of your apps.

### About this template

There are two mind sets when creating an app using ScopedModel, that I've seen. In both of these the actual work is delegated to services. The model just uses services and it's functionality to produce the correct state for the app UI based on the user's interactions.

#### One AppModel with FeatureModel mixins 
In this way you have one AppModel that extends Mixins, that are also of type Model but groups certain functionality together. UserModel, AuthenticationModel, InformationModel, etc. You pass the combined one AppModel from the top of your application widget tree and access it anywhere in the app using the ScopedModelDescendent.

**Pros:**
  - State is managed in one place (and all the benefits of that).
  - All functionality is Easily accessible from one model using inherited widget functionality.
  - Combining multiple functionalities can be done in the Main AppModel class since all feature models functionalities are available through the mixins.

**Cons:**
  - notifyListeners can have multiple bindings alive at any point.
  - All state is reduced per view without any clear indication inside the model which parts of the state is there for a specific view. 
  - View specific models has to keep a reference to the main AppModel incase of custom view only state functionality. Like views that have 3 different internal states for different UI.

#### One Model per view

**Pros:**
  - View has it's own dedicated Model
  - All state functionality and reduction for a view is contained in it's own Model
  - Better logical and mental grouping (View + View's Model)

**Cons:**
  - More Models to be aware of and manage
  - More boiler plate code when creating a new view ([appskeletons](https://www.appskeletons.com) can take care of that :)
  - Harder to make use of Logic from other models (which should never happen anyway)

I have implemented my first production Flutter app for a client using ScopedModel with the first structure I described. For this template I am now leaning towards the second one because of how mixed up the state management became having to cater for multiple views from a single feature model.

### The implementation

This project Starts off by registering all the services and available app models in the `service_locator.dart` file. We use [get_it](https://pub.dartlang.org/packages/get_it) for our dependenct injection. `setupLocator` is called before the application is instantiated in `main.dart` to ensure that all services area available from the locator. To use the locator anywhere import `service_locator.dart` and use locator<Type>() to get your registered instance.

Each view has a ScopedModel at the root and gets the model from the locator. The Model's binding functionality is accessed using the ScopedModelDescendant. 

## Getting Started

1. Make sure all the packages are fetched. Run the flutter packages get command or open Pubspec.yaml and save.
2. Go to debug tab (in Visual Code) and set configuration to Dart & Flutter. Ignore for Android Studio
3. Run application

## Structure and placement

The root folder is split into 4 sections, models, scoped_models, services and ui.

### Models

Contains all the application's data models. If multiple models belongs to certain features I recommend placing them in their own folders to keep the code clean.

### Scoped Models

In this scoped_models folder you'll place all the models associated with your views. One per view.

**Naming convention:** [viewname]_model.dart i.e. home_model.dart

### Services

This will contain separate services that houses all the actual functionality for your app. Fetching information, caching it locally, updating the DB, all those should be separate services in here. When registering these with the service locator it's usually registered as a singleton. 

**Naming convention:** [functionality]_service.dart i.e. authentication_service.dart

### UI

Contains all the code relating to the user interface. Flutter is a code first approach to building UI (which is great) so all the code files can live together in harmony without having to fuss about if it's an asset or a code file like in native programming. We only have one folder (as a start) and with more code I usually introduce a components folder as well as a util folder for shared UI helper functions. The structure is as follows.

**views/**: Contains the files for each of the views in your applications.

Naming convention: [viewname]_view.dart

## Conclusion

There are many other things you can setup in your app all depending on your code style. I have a full video on my [Youtube channel](https://www.youtube.com/channel/UC2d0BYlqQCdF9lJfydl_02Q) describing how to setup this template from scratch.