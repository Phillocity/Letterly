import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["ageLabel", "formSlide", "form","inputAge", "input", "list"]

  connect() {
    // console.log(this.formTarget)
    // console.log(this.inputTarget)
    // console.log(this.listTarget)
    // console.dir(this.inputAgeTarget.value)
    this.ageLabelTarget.innerHTML = `AGE LIMIT: 16-${this.inputAgeTarget.value}`
  }

  update() {
      const url = `${this.formTarget.action}?age=${this.inputAgeTarget.value}&query=${this.inputTarget.value}`
      fetch(url, { headers: { "Accept": "text/plain" } })
        .then(response => response.text())
        .then((data) => {
          this.listTarget.outerHTML = data
        })
  }

  changeAge(){
    this.ageLabelTarget.innerHTML = `AGE LIMIT: 16-${this.inputAgeTarget.value}`
  }

  // update() {
  //   const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
  //   fetch(url, { headers: { "Accept": "text/plain" } })
  //     .then(response => response.text())
  //     .then((data) => {
  //       this.listTarget.outerHTML = data
  //     })
  // }
}
