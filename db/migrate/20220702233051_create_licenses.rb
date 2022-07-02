class CreateLicenses < ActiveRecord::Migration[6.1]
  def change
    create_table :licenses do |t|
      t.string :key
      t.game :references
      t.user :references

      t.timestamps
    end
  end
end
