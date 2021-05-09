import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured

    enum Tab: String {
        case featured = "Featured"
        case list = "List"
    }

    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label(Tab.featured.rawValue, systemImage: "star")
                }
                .tag(Tab.featured)

            LandmarkList()
                .tabItem {
                    Label(Tab.list.rawValue, systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
