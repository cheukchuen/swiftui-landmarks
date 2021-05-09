# SwiftUI Essentials

## Creating and Combining Views

This tutorial guides you through building _Landmarks_ — an app for discovering and sharing the places you love. You’ll start by building the view that shows a landmark’s details.

To lay out the views, Landmarks uses _stacks_ to combine and layer the image and text view components. To add a map to the view, you’ll include a standard MapKit component. As you refine the view’s design, Xcode provides real-time feedback so you can see how those changes translate into code.

### Notes

- You use the `@State` attribute to establish a source of truth for data in your app that you can modify from more than one view. SwiftUI manages the underlying storage and automatically updates views that depend on the value.

- By prefixing a state variable with `$`, you pass a binding, which is like a reference to the underlying value. When the user interacts with the map, the map updates the region value to match the part of the map that’s currently visible in the user interface.

- When you specify only the `height` parameter, the view automatically sizes to the width of its content. In this case, `MapView` expands to fill the available space.

## Building Lists and Navigation

With the basic landmark detail view set up, you need to provide a way for users to see the full list of landmarks, and to view the details about each location.

You’ll create views that can show information about any landmark, and dynamically generate a scrolling list that a user can tap to see a detail view for a landmark. To fine-tune the UI, you’ll use Xcode’s canvas to render multiple previews at different device sizes.

### Notes

- Adding Codable conformance makes it easier to load data into the structure from the data file.

- You mark the property in a Codable structure as private because you’ll use it only to create a public computed property.

- Lists work with _identifiable_ data. You can make your data identifiable in one of two ways: by passing along with your data a key path to a property that uniquely identifies each element, or by making your data type conform to the `Identifiable` protocol.

- The Landmark data already has the `id` property required by `Identifiable` protocol; you only need to add a property to decode it when reading the data.

- `ForEach` operates on collections the same way as the list, which means you can use it anywhere you can use a child view, such as in stacks, lists, groups, and more. When the elements of your data are simple value types — like the strings you’re using here — you can use `\.self` as key path to the identifier.

## Handling User Input

In the Landmarks app, a user can flag their favorite places, and filter the list to show just their favorites. To create this feature, you’ll start by adding a switch to the list so users can focus on just their favorites, and then you’ll add a star-shaped button that a user taps to flag a landmark as a favorite.

### Notes

- Because you use state properties to hold information that’s specific to a view and its subviews, you always create state as `private`.

- When you make changes to your view’s structure, like adding or modifying a property, you need to manually refresh the canvas.

- To give the user control over the list’s filter, you need to add a control that can alter the value of `showFavoritesOnly`. You do this by passing a binding to a toggle control.

- A _binding_ acts as a reference to a mutable state. When a user taps the toggle from `off` to `on`, and `off` again, the control uses the binding to update the view’s state accordingly.

- You use the `$` prefix to access a binding to a state variable, or one of its properties.

- To combine static and dynamic views in a list, or to combine two or more different groups of dynamic views, use the `ForEach` type instead of passing your collection of data to `List`.

- To prepare for the user to control which particular landmarks are favorites, you’ll first store the landmark data in an _observable_ object.

- An observable object is a custom object for your data that can be bound to a view from storage in SwiftUI’s environment. SwiftUI watches for any changes to observable objects that could affect a view, and displays the correct version of the view after a change.

- An observable object needs to publish any changes to its data using the `@Published` keyword, so that its subscribers can pick up the change.

- The modelData property gets its value automatically, as long as the environmentObject(_:) modifier has been applied to a parent.

- Use the `@StateObject` attribute to initialize a model object for a given property only once during the life time of the app. This is true when you use the attribute in an app instance, as shown here, as well as when you use it in a view.

- Because you use `@Binding`, changes made inside this view propagate back to the data source.

# Drawing and Animation

## Drawing Paths and Shapes

Users receive a badge whenever they visit a landmark in their list. Of course, for a user to receive a badge, you’ll need to create one. This tutorial takes you through the process of creating a badge by combining paths and shapes, which you then overlay with another shape that represents the location.

If you want to create multiple badges for different kinds of landmarks, try experimenting with the overlaid symbol, varying the amount of repetition, or changing the various angles and scales.

### Notes

- You use paths to combine lines, curves, and other drawing primitives to form more complex shapes like the badge’s hexagonal background.

- The `move(to:)` method moves the drawing cursor within the bounds of a shape as though an imaginary pen or pencil is hovering over the area, waiting to start drawing.

- The `addLine(to:)` method takes a single point and draws it. Successive calls to `addLine(to:)` begin a line at the previous point and continue to the new point.

- Use the `addQuadCurve(to:control:)` method to draw the Bézier curves for the badge’s corners.

- By preserving a 1:1 aspect ratio, the badge maintains its position at the center of the view, even if its ancestor views aren’t square.

- Wrap the path in a `GeometryReader` so the badge can use the size of its containing view

## Animating Views and Transitions

When using SwiftUI, you can individually animate changes to views, or to a view’s state, no matter where the effects are. SwiftUI handles all the complexity of these combined, overlapping, and interruptible animations for you.

In this tutorial, you’ll animate a view that contains a graph for tracking the hikes a user takes while using the Landmarks app. Using the `animation(_:)` modifier, you’ll see just how easy it is to animate a view.

# App Design and Layout

## Composing Complex Interfaces

The category view for Landmarks shows a vertically scrolling list of horizontally scrolling landmarks. As you build this view and connect it to your existing views, you’ll explore how composed views can adapt to different device sizes and orientations.

### Notes

- The `WindowGroup` scene defined in the app body declares `ContentView` as the root view of the app.

## Working with UI Controls

In the Landmarks app, users can create a profile to express their personality. To give users the ability to change their profile, you’ll add an edit mode and design the preferences screen.

You’ll work with a variety of common user interface controls for data entry, and update the Landmarks model types whenever the user saves their changes.
