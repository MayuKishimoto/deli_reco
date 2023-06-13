import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap";
import "../stylesheets/application";
import '../stylesheets/image';

Rails.start()
Turbolinks.start()
ActiveStorage.start()
