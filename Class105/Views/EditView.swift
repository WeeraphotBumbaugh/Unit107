
import SwiftUI
import SwiftData
import PhotosUI

struct EditView: View {
    
    @StateObject private var viewModel: EditViewModel
    @Environment(\.dismiss) var dismiss
    @State private var pickerItem: PhotosPickerItem?

    init(book: PersistentBook?, modelContext: ModelContext) {
        _viewModel = StateObject(wrappedValue: EditViewModel(book: book, modelContext: modelContext))
    }

    var body: some View {
        NavigationStack {
            Form {

                Section("Book Cover") {
                    HStack(spacing: 12) {
                        ImageField(image: $viewModel.imageData)
                            .frame(width: 64, height: 64)
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            .accessibilityLabel("Selected cover preview")

                        if viewModel.imageData != nil {
                            Button("Remove") { viewModel.imageData = nil }
                                .foregroundStyle(.red)
                        }
                    }
                }

                Section("Book Details") {
                    TextField("Title", text: $viewModel.title)
                        .accessibilityIdentifier("titleField")

                    TextField("Author", text: $viewModel.author)
                        .accessibilityIdentifier("authorField")

                    Picker("Status", selection: $viewModel.status) {
                        ForEach(ReadingStatus.allCases, id: \.self) { s in
                            Text(s.rawValue).tag(s as ReadingStatus)
                        }
                    }
                    Picker("Genre", selection: $viewModel.genre) {
                        ForEach(Genre.allCases, id: \.self) { g in
                            Text(g.rawValue).tag(g as Genre)
                        }
                    }
                    Toggle("Favorite", isOn: $viewModel.isFavorite)

                    TextEditor(text: $viewModel.summary)
                        .frame(height: 120)
                        .accessibilityIdentifier("summaryField")
                }

                Section("My Rating & Review") {
                    Stepper("Rating: \(viewModel.rating)", value: $viewModel.rating, in: 0...5)
                    TextEditor(text: $viewModel.review)
                        .frame(height: 120)
                }
            }
            .navigationTitle(viewModel.navigationTitle)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.save()
                        dismiss()
                    }
                    .disabled(viewModel.isSaveDisabled)
                    .accessibilityIdentifier("saveButton")
                }
            }
        }
    }
}
