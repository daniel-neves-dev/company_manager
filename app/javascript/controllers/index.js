// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AlertController from "./alert_controller"
application.register("alert", AlertController)

import DeleteController from "./delete_controller"
application.register("delete", DeleteController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import PhotoPreviewController from "./photo_preview_controller"
application.register("photo-preview", PhotoPreviewController)
