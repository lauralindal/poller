class AddCountToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :count, :integer, default: 0
  end
end
