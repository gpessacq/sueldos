class Sueldo < ActiveRecord::Base
  
  def self.import(file)

    CSV.foreach(file.path, col_sep: ';', headers: true) do |row|
      unless row['nombre'].to_s.empty? 
        row['nombre'] = row['nombre'].strip
      end
      unless Sueldo.where(anio: row['anio'], mes: row['mes'], apellido: row['apellido'], 
                          nombre: row['nombre']).exists? ||  
                          (row['apellido'].to_s.empty? && row['nombre'].to_s.empty?)
        
        Sueldo.create! row.to_hash
      end
    end
  end

end
