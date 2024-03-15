import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["template", "fields"];

  connect() {
    this.addRemovePassengerListener();
  }

  addPassenger(event) {
    event.preventDefault();
    const content = this.templateTarget.innerHTML.replace(
      /NEW_RECORD/g,
      new Date().getTime()
    );
    this.fieldsTarget.insertAdjacentHTML("beforeend", content);
    this.addRemovePassengerListener();
  }

  removePassenger(event) {
    event.preventDefault();
    const passengerFieldsCount =
      this.fieldsTarget.querySelectorAll(".passenger-fields").length;
    if (passengerFieldsCount > 1) {
      event.target.closest(".passenger-fields").remove();
    } else {
      alert("You must have at least one passenger.");
    }
  }

  addRemovePassengerListener() {
    const removePassengerButtons =
      this.fieldsTarget.querySelectorAll(".remove-passenger");
    removePassengerButtons.forEach((button) => {
      button.addEventListener("click", this.removePassenger.bind(this));
    });
  }
}
