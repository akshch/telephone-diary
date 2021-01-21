class AddColumnCounterToContact < ActiveRecord::Migration[5.2]
  def change
  	add_column :contacts, :counter, :integer, default: 0
  end
end
