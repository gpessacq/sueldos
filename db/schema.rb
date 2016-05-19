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

ActiveRecord::Schema.define(version: 20140428155501) do

  create_table "sueldos", force: :cascade do |t|
    t.integer  "anio"
    t.integer  "nromes"
    t.string   "apellido",             limit: 255
    t.string   "nombre",               limit: 255
    t.string   "cargo",                limit: 255
    t.decimal  "asig_mensuales"
    t.decimal  "salario_familiar"
    t.decimal  "descuentos_mensuales"
    t.decimal  "liquido"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mes",                  limit: 255
  end

end
