class CreateThumbs < ActiveRecord::Migration[4.2]
  def change
    create_table :thumbs do |t|
      t.string :signature
      t.string :uid
      t.boolean :generated, default: false

      t.timestamps
    end
  end
end
