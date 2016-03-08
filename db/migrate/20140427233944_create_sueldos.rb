class CreateSueldos < ActiveRecord::Migration
  def change
    create_table :sueldos do |t|
      t.integer :anio
      t.integer :nromes
      t.string :apellido
      t.string :nombre
      t.string :cargo
      t.decimal :asig_mensuales
      t.decimal :salario_familiar
      t.decimal :descuentos_mensuales
      t.decimal :liquido

      t.timestamps
    end
  end
end
