ActiveRecord::Schema.define do
  self.verbose = false

  create_table "thumbs", :force => true do |t|
    t.string   "signature"
    t.string   "uid"
    t.boolean  "generated",  :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

end