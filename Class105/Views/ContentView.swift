
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var ctx
    @State private var seeded = false
    
    var body: some View {
        TabView {
            BookListView()
                .tabItem { Label("My Books", systemImage: "books.vertical.fill") }
            FavoritesView()
                .tabItem { Label("Favorites", systemImage: "heart.fill") }
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape") }
        }
    }

}
