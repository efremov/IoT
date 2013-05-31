class AddImageToPersonalInfo < ActiveRecord::Migration
  def self.up
    change_table :personal_infos do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :personal_infos, :image
  end
end

