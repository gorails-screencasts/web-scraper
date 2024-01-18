class AddNameToPages < ActiveRecord::Migration[7.1]
  def change
    add_column :pages, :name, :string
  end
end
