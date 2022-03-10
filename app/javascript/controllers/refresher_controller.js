import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { url: String, refreshInterval: Number }
  static target = ["time"]
  connect() {
    this.load()
    if (this.hasRefreshIntervalValue) {
      this.startRefreshing()
    }
    console.log(this.timeTarget)
  }
  disconnect() {
    this.stopRefreshing()
  }

  load() {
    fetch(this.urlValue, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then(html => this.element.innerHTML = html)
  }

  startRefreshing() {
    this.refreshTimer = setInterval(() => {
      this.load()
    }, 5000)
  }

  stopRefreshing() {
    if (this.refreshTimer) {
      clearInterval(this.refreshTimer)
    }
  }
}
