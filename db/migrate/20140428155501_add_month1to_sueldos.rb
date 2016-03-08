class AddMonth1toSueldos < ActiveRecord::Migration
  def change
    add_column :sueldos, :mes, :string
  end
end
