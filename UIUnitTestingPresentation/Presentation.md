## Unit-/Snapshot-Tests vs UI-Tests

### Unit-Tests

- Test a component of the code in isolation
- Instantiate only the object graph that is to be tested
- Fast & reliable feedback

### UI-Tests

- Test the UI as a black box by exercising gestures on the device
- The whole app is started for every single test
- Very slow and not always reliable

### Snapshot-Tests

- Compare screenshots of the interface with reference screenshots
- Instantiate only UI components
- Much faster than UI-Tests and a little bit slower than Unit-Tests


https://www.goodreads.com/book/show/50824142-ios-unit-testing-by-example
