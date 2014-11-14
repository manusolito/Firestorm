# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20141101185555) do
=======
ActiveRecord::Schema.define(version: 20141113140631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
>>>>>>> origin/categorias

  create_table "categoria", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oferta", force: true do |t|
    t.string   "motivo"
    t.integer  "monto"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "producto_id"
  end

  create_table "productos", force: true do |t|
    t.string   "nombre"
<<<<<<< HEAD
    t.string   "descripcion"
    t.string   "vencimiento"
=======
    t.string   "prourl"
    t.text     "descripcion"
    t.date     "vencimiento"
>>>>>>> origin/categorias
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "categoria_id"
  end

  create_table "usuarios", force: true do |t|
    t.string   "url"
    t.string   "nombre"
    t.integer  "dni"
    t.string   "email"
    t.integer  "tarjeta",     limit: 8
    t.string   "contrasenia"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
