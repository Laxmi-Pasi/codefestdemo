class AddColToMyarticles < ActiveRecord::Migration[7.0]
  def change
    add_column :myarticles, :avatar, :string
  end
end
