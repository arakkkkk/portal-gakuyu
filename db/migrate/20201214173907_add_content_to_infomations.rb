class AddContentToInfomations < ActiveRecord::Migration[6.1]
  def change
    add_column :infomations, :content, :text
    add_column :infomations, :classifi, :string
  end
end
