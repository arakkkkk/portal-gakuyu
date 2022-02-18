class ChangeDataTitleToArticle < ActiveRecord::Migration[6.1]
  def change
    change_column :infomations, :done, :text
  end
end
