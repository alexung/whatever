class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :group_title
      t.string :city
      t.string :country
      t.string :event_url
      t.string :group_url
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
