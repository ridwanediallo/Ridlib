// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"

import FlashCcontroller from "./flash_controller"
application.register('flash', FlashCcontroller)

import DropdownCcontroller from "./dropdown_controller";
application.register('dropdown', DropdownCcontroller)
