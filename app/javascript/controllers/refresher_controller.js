export default class extends Controller {
  static values = { url: String, refreshInterval: Number }
  connect() {
    this.load()
    if (this.hasRefreshIntervalValue) {
      this.startRefreshing()
    }
  }

  startRefreshing() {
    setInterval(() => {
      this.load()
    }, this.refreshIntervalValue)
  }
}
