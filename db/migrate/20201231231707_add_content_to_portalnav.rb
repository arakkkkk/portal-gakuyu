class AddContentToPortalnav < ActiveRecord::Migration[6.1]
  def change
    add_column :portalnavs, :content, :text
  end
end
