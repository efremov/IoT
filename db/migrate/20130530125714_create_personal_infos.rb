class CreatePersonalInfos < ActiveRecord::Migration
  def change
    create_table :personal_infos do |t|
      t.string :name
      t.string :surname
      t.integer :age
      t.string :country
      t.string :about
      t.references :user

      t.timestamps
    end
    add_index :personal_infos, :user_id
  end
end
