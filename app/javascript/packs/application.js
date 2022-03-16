// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"
import $ from 'jquery';

// for rich text editor
require("jquery")
require("trix")
require("@rails/actiontext")

const timer = document.querySelectorAll(".gridify")



// $(".content0").load(location.href + " .timer0");

setInterval(function() {
  $('div[class*="timer-wrapper"]').map(function (index, element) {
    $(element).load(location.href + ` .timer${index}`)
  })
}, 1000);
