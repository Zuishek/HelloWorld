class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
    	t.string :name
    	t.float :latitude
    	t.float :longitude
    	t.string :description

      t.timestamps null: false
    end
  end
end
