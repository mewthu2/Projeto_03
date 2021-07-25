// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

*= require jquery/dist/jquery
*= require bootstrap/dist/js/bootstrap
*= require sb-admin-2

Rails.start()
ActiveStorage.start()
