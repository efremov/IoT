class CreateListPins < ActiveRecord::Migration
  def change
    create_table :list_pins do |t|
      t.string :description

      t.timestamps
    end
  end
end
