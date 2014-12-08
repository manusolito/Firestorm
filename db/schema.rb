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

ActiveRecord::Schema.define(version: 20141124162650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categoria", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "disponible", default: true
  end

  create_table "oferta", force: true do |t|
    t.text     "motivo"
    t.float    "monto",       default: 0.0
    t.integer  "usuario_id"
    t.integer  "producto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "disponible",  default: true
  end

  add_index "oferta", ["producto_id"], name: "index_oferta_on_producto_id", using: :btree
  add_index "oferta", ["usuario_id"], name: "index_oferta_on_usuario_id", using: :btree

  create_table "productos", force: true do |t|
    t.string   "nombre"
    t.string   "prourl"
    t.text     "descripcion"
    t.date     "vencimiento"
    t.date     "diaventa"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "categoria_id"
    t.boolean  "disponible",    default: true
    t.integer  "ofertagano_id"
  end

  add_index "productos", ["usuario_id"], name: "index_productos_on_usuario_id", using: :btree

  create_table "usuarios", force: true do |t|
    t.string   "url"
    t.string   "nombre"
    t.integer  "dni"
    t.string   "email"
    t.integer  "tarjeta",         limit: 8
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "disponible",                default: true
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",                     default: false
  end

  add_index "usuarios", ["dni"], name: "index_usuarios_on_dni", unique: true, using: :btree

end
