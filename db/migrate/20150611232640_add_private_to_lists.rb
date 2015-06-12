class AddPrivateToLists < ActiveRecord::Migration
  def up
    add_column :lists, :permissions, :string, default: 'open'
  end

  def down
    remove_column :lists, :private
  end
end
