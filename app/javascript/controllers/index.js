// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

import FlashCcontroller from "controllers/flash_controller"
application.register('flash', FlashCcontroller)

import MenuController from "controllers/menu_controller";
application.register('menu', MenuController)

