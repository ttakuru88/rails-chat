export default class Notifier {
  constructor() {
    if(window.Notification) {
      Notification.requestPermission()
    }
  }

  notify(message) {
    if(document.hidden) {
      new Notification(message)
    }
  }
}
