# Browser History File Locations

This document provides the default file paths where different web browsers store their history.

## Google Chrome
- **Windows:**  
  ```
  C:\Users\Username\AppData\Local\Google\Chrome\User Data\Default\History
  ```
- **Mac:**  
  ```
  ~/Library/Application Support/Google/Chrome/Default/History
  ```
- **Linux:**  
  ```
  ~/.config/google-chrome/Default/History
  ```
- Chrome stores history in an SQLite database file named `History`.

## Mozilla Firefox
- **Windows:**  
  ```
  C:\Users\Username\AppData\Roaming\Mozilla\Firefox\Profiles\YourProfile\places.sqlite
  ```
- **Mac:**  
  ```
  ~/Library/Application Support/Firefox/Profiles/YourProfile/places.sqlite
  ```
- **Linux:**  
  ```
  ~/.mozilla/firefox/YourProfile/places.sqlite
  ```
- Firefox stores history in an SQLite database file named `places.sqlite`.

## Microsoft Edge
- **Windows:**  
  ```
  C:\Users\Username\AppData\Local\Microsoft\Edge\User Data\Default\History
  ```
- Edge uses an SQLite database file named `History`.

## Safari (Mac Only)
- **Mac:**  
  ```
  ~/Library/Safari/History.db
  ```
- Safari stores history in an SQLite database file named `History.db`.

## Notes
- `Username` should be replaced with your actual username.
- `YourProfile` refers to the active Firefox profile directory.
- To access these locations, you may need to enable hidden files and folders.

## Viewing SQLite Files
You can view these SQLite history files using [SQLite Viewer](https://sqliteviewer.app/).

---

### Disclaimer
Modifying or deleting these files directly may cause issues with the browser. Use caution when making changes.
