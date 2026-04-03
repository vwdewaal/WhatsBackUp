# WhatsApp Archive Viewer (Flutter)

A local-only Flutter app that imports WhatsApp chat ZIP exports and renders them in a WhatsApp-like, read-only chat UI.

## What it does
- Imports `.zip` files exported from WhatsApp chat export.
- Extracts and stores content locally on device.
- Parses chat text into messages (including multiline messages).
- Displays a WhatsApp-style conversation view for archived chats.
- Attempts to render image attachments inline.

## Privacy / network behavior
- This app is designed for offline use.
- It does not require backend services or cloud sync.
- Imported files stay in app-local storage.

## Run
```bash
flutter pub get
flutter run
```

## Supported chat line formats
- `[MM/DD/YY, HH:MM AM] Name: message`
- `MM/DD/YY, HH:MM - Name: message`

System messages and unknown formats are still shown when possible.
