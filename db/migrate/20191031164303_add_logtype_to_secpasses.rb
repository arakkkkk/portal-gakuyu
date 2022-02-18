class AddLogtypeToSecpasses < ActiveRecord::Migration[5.2]
  def change
    add_column :secpasses, :logtype, :string
  end
end
