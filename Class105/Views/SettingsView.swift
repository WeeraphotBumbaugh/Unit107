
import SwiftUI

enum Theme: String, CaseIterable {
    case dark, light, system
}

struct SettingsView: View {
    
    @AppStorage(SETTINGS_THEME_KEY) private var theme: Theme = .system
    @AppStorage(SETTINGS_GRID_COLUMN_NUMBERS_KEY) private var gridColumnNumber: Int = 2
    @AppStorage(SETTINGS_GRID_SHOW_AUTHOR_KEY) private var gridShowAuthor = true
    @AppStorage(SETTINGS_APP_ACCENT_COLOR_KEY) private var appAccentColor: Color = .accentColor
    
    var body: some View {
        NavigationStack {
            Form{
                Section(header: Text("Appearance")) {
                    Picker("Theme", selection: $theme) {
                        ForEach(Theme.allCases, id: \.self) { theme in
                            Text(String(describing: theme))
                        }
                    }
                    ColorPicker("Accent Color", selection: $appAccentColor)
                }
                Section(header: Text("Grid Settings")) {
                    Stepper("Columns: \(gridColumnNumber)", value: $gridColumnNumber, in: 2...4)
                    Toggle("Show Author", isOn: $gridShowAuthor)
                }
            }
        }
    }
}
