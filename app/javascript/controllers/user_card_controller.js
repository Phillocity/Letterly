import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "content" ]

  connect() {
    // console.log("Hello Stimulus")
  }

  revealContent() {
    console.log("Reveal Working")
    this.contentTarget.classList.toggle("d-none")
  }
}
