class AddSlugToEstablishments < ActiveRecord::Migration[5.2]
  def change
    add_column :establishments, :slug, :string
    add_index :establishments, :slug, unique: true
  end
end
