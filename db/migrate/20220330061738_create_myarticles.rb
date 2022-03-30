class CreateMyarticles < ActiveRecord::Migration[7.0]
  def change
    create_table :myarticles do |t|
      t.string :title
      t.string :body
      t.date :release_date

      t.timestamps
    end
  end
end
