
import XCTest

final class Class105UITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    private func launch() -> XCUIApplication {
        let app = XCUIApplication()
        app.launchArguments += ["-ui-testing"]
        app.launch()
        return app
    }

    func test_mainScreen_showsCoreControls() {
        let app = launch()

        let add = app.buttons["addBookButton"]
        XCTAssertTrue(add.waitForExistence(timeout: 2), "Expected an Add button with accessibilityIdentifier 'addBookButton'")
    }

    func test_addBook_navigatesToEditor_and_returnsToList() {
        let app = launch()

        app.buttons["addBookButton"].tap()

        let titleField  = app.textFields["titleField"]
        let authorField = app.textFields["authorField"]
        XCTAssertTrue(titleField.waitForExistence(timeout: 2))
        XCTAssertTrue(authorField.waitForExistence(timeout: 2))

        titleField.clearAndType("UI Test Book")
        authorField.clearAndType("UITest Author")

        let summary = app.textViews["summaryField"]
        if summary.exists { summary.clearAndType("Written by tests.") }

        let save = app.buttons["saveButton"]
        XCTAssertTrue(save.exists)
        save.tap()

        let newRow = app.staticTexts["bookRow_UI Test Book"]
        XCTAssertTrue(newRow.waitForExistence(timeout: 2), "Expected a row with identifier 'bookRow_UI Test Book'")
    }
}

private extension XCUIElement {
    func clearAndType(_ text: String) {
        tap()
        if let value = self.value as? String, !value.isEmpty {
            let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: value.count)
            typeText(deleteString)
        }
        typeText(text)
    }
}
