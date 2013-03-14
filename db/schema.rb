# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110511085329) do

  create_table "applications", :force => true do |t|
    t.string   "name"
    t.integer  "serial",                                          :null => false
    t.string   "mac"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.integer  "groupapp_id",                                     :null => false
    t.integer  "role_id",                                         :null => false
    t.boolean  "activate",     :default => true
    t.string   "old_serial"
    t.string   "reboot",       :default => "0"
    t.boolean  "statpaiement", :default => false
    t.string   "remotename"
    t.string   "remotevalue"
    t.string   "ville",        :default => "Ville non renseigne"
  end

  add_index "applications", ["role_id"], :name => "role_id"

  create_table "applications_users", :id => false, :force => true do |t|
    t.integer "user_id",        :null => false
    t.integer "application_id", :null => false
  end

  add_index "applications_users", ["application_id"], :name => "application_id"
  add_index "applications_users", ["user_id"], :name => "user_id"

  create_table "avoirs", :force => true do |t|
    t.integer "fichiercompression_id",                     :null => false
    t.integer "application_id",                            :null => false
    t.boolean "currentversion",         :default => false
    t.boolean "archive_currentversion", :default => false
  end

  add_index "avoirs", ["application_id"], :name => "application_id"
  add_index "avoirs", ["fichiercompression_id"], :name => "fichiercompression_id"

  create_table "categoriecolonnetables_colonnes", :id => false, :force => true do |t|
    t.integer "colonne_id",               :null => false
    t.integer "categoriecolonnetable_id", :null => false
  end

  add_index "categoriecolonnetables_colonnes", ["categoriecolonnetable_id"], :name => "categoriecolonnetable_id"
  add_index "categoriecolonnetables_colonnes", ["colonne_id"], :name => "colonne_id"

  create_table "categoriecolonnetables_roles", :id => false, :force => true do |t|
    t.integer "role_id",                  :null => false
    t.integer "categoriecolonnetable_id", :null => false
  end

  add_index "categoriecolonnetables_roles", ["categoriecolonnetable_id"], :name => "categoriecolonnetable_id"
  add_index "categoriecolonnetables_roles", ["role_id"], :name => "role_id"

  create_table "controllersdroits", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "controllersdroits_roles", :id => false, :force => true do |t|
    t.integer "role_id",             :null => false
    t.integer "controllersdroit_id", :null => false
  end

  add_index "controllersdroits_roles", ["controllersdroit_id"], :name => "controllersdroit_id"
  add_index "controllersdroits_roles", ["role_id"], :name => "role_id"

  create_table "fichiercompressions", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_content_type"
    t.string   "file_file_size"
    t.datetime "file_updated_at"
    t.string   "file_file_name"
    t.boolean  "base_version",      :default => false
    t.string   "mergeversion"
  end

  create_table "groupapps", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groupapps_roles", :id => false, :force => true do |t|
    t.integer "role_id",     :null => false
    t.integer "groupapp_id", :null => false
  end

  add_index "groupapps_roles", ["groupapp_id"], :name => "groupapp_id"
  add_index "groupapps_roles", ["role_id"], :name => "role_id"

  create_table "pings", :force => true do |t|
    t.datetime "created_at"
    t.string   "status"
    t.integer  "application_id", :null => false
  end

  add_index "pings", ["application_id"], :name => "application_id"

  create_table "roles", :force => true do |t|
    t.string  "name",    :null => false
    t.integer "role_id"
  end

  create_table "stat_categoriecolonnetables", :force => true do |t|
    t.string  "name",                                                     :null => false
    t.integer "typegraph"
    t.integer "position"
    t.string  "nameen"
    t.integer "nbrubriquecontenu"
    t.integer "table_id"
    t.string  "titrelegendestatglobal", :default => "Statistique global"
  end

  add_index "stat_categoriecolonnetables", ["table_id"], :name => "table_id"

  create_table "stat_categorieindexs", :force => true do |t|
    t.string "name",   :null => false
    t.string "nameen"
  end

  create_table "stat_colonnes", :force => true do |t|
    t.string  "name",                                  :null => false
    t.integer "table_id",                              :null => false
    t.string  "affichagecolonne"
    t.boolean "choixaffichage"
    t.boolean "statx",              :default => false
    t.boolean "time_column"
    t.string  "affichagecolonneen"
    t.boolean "apps_serial_column", :default => false
  end

  add_index "stat_colonnes", ["table_id"], :name => "table_id"

  create_table "stat_contenus", :force => true do |t|
    t.string   "contenu",                   :null => false
    t.integer  "colonne_id",                :null => false
    t.datetime "created_at"
    t.integer  "idinsert",   :default => 0
  end

  add_index "stat_contenus", ["colonne_id"], :name => "colonne_id"

  create_table "stat_posseders", :force => true do |t|
    t.integer "categorieindex_id",                                           :null => false
    t.integer "categoriecolonnetable_id",                                    :null => false
    t.boolean "imagegrand",                :default => false
    t.boolean "affichagenombrestatglobal", :default => false
    t.string  "titregraphique",            :default => "Statistique Global"
    t.boolean "statistic",                 :default => true
    t.string  "titregraphiqueen",          :default => "Gloabal statistic"
  end

  add_index "stat_posseders", ["categoriecolonnetable_id"], :name => "categoriecolonnetable_id"
  add_index "stat_posseders", ["categorieindex_id"], :name => "categorieindex_id"

  create_table "stat_tablearchivecategoriecategoriesessiondates", :force => true do |t|
    t.integer  "roleid",          :null => false
    t.string   "rolename"
    t.integer  "groupid",         :null => false
    t.string   "groupname"
    t.integer  "applicationid",   :null => false
    t.string   "applicationname"
    t.integer  "serial",          :null => false
    t.string   "widgetid",        :null => false
    t.integer  "sessionid",       :null => false
    t.datetime "date",            :null => false
  end

  create_table "stat_tablearchivemediasessiondates", :force => true do |t|
    t.integer  "roleid",          :null => false
    t.string   "rolename"
    t.integer  "groupid",         :null => false
    t.string   "groupname"
    t.integer  "applicationid",   :null => false
    t.string   "applicationname"
    t.integer  "serial",          :null => false
    t.string   "widgetid",        :null => false
    t.integer  "sessionid",       :null => false
    t.datetime "date",            :null => false
    t.string   "widgetname"
  end

  create_table "stat_tablearchivewidgettotalusersapps", :force => true do |t|
    t.integer  "roleid",        :null => false
    t.string   "rolename"
    t.integer  "groupid",       :null => false
    t.string   "groupname"
    t.integer  "applicationid", :null => false
    t.integer  "duration",      :null => false
    t.integer  "sessionid",     :null => false
    t.integer  "serial",        :null => false
    t.datetime "date",          :null => false
  end

  create_table "stat_tablecategoriesessiondates", :force => true do |t|
    t.integer  "roleid",          :null => false
    t.string   "rolename"
    t.integer  "groupid",         :null => false
    t.string   "groupname"
    t.integer  "applicationid",   :null => false
    t.string   "applicationname"
    t.integer  "serial",          :null => false
    t.string   "widgetid",        :null => false
    t.integer  "sessionid",       :null => false
    t.datetime "date",            :null => false
  end

  create_table "stat_tablemediasessiondates", :force => true do |t|
    t.integer  "roleid",          :null => false
    t.string   "rolename"
    t.integer  "groupid",         :null => false
    t.string   "groupname"
    t.integer  "applicationid",   :null => false
    t.string   "applicationname"
    t.integer  "serial",          :null => false
    t.string   "widgetid",        :null => false
    t.integer  "sessionid",       :null => false
    t.datetime "date",            :null => false
    t.string   "widgetname"
  end

  create_table "stat_tables", :force => true do |t|
    t.string  "name",             :null => false
    t.string  "affichagetable"
    t.boolean "choixaffichage"
    t.string  "affichagetableen"
  end

  create_table "stat_tablewidgettotalusersapps", :force => true do |t|
    t.integer  "roleid",        :null => false
    t.string   "rolename"
    t.integer  "groupid",       :null => false
    t.string   "groupname"
    t.integer  "applicationid", :null => false
    t.integer  "duration",      :null => false
    t.integer  "sessionid",     :null => false
    t.integer  "serial",        :null => false
    t.datetime "date",          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                             :null => false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "email",                                :null => false
    t.string   "language"
    t.boolean  "alertapp",          :default => false
  end

  add_index "users", ["role_id"], :name => "role_id"

end
