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
