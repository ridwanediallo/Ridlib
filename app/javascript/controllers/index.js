// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"
import ContentLoader from 'stimulus-content-loader';

import FlashCcontroller from "./flash_controller"
application.register('flash', FlashCcontroller)
application.register('content-loader', ContentLoader);
