# Whop

Clone and run. No additional steps needed.

## How it works

I'm using protocol oriented programming with dependency injection. All services are injected via a protocol so we can create mocks for testing (see ContentViewModelTests).

ContentView -> ContentViewModel -> ContentInteractor (Network Layer) -> Any other service you want to inject
