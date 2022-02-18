class CreatePortalnavs < ActiveRecord::Migration[6.1]
  def change
    create_table :portalnavs do |t|
      t.string :title
      t.string :parent
      t.string :child
      t.string :group
      t.string :check

      t.timestamps
    end
  end
end
