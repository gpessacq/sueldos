class SueldosController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "password", except: [:home,:show,:detail]
  helper_method :sort_column, :sort_direction
  
  def home
    sueldos_count = Sueldo.group(:anio, :nromes).count.size
    @sueldos = Sueldo.select(:nromes, :mes, :anio).paginate(:page => params[:page], 
                                                            :per_page => 12, :total_entries => sueldos_count).distinct.order("anio DESC", "nromes DESC")
  end
  
  def show
    @mes_nombre = params[:fecha_mes]
    @mes = params[:fecha_nromes]
    @anio = params[:fecha_anio]
    @sueldos = Sueldo.where(["anio = ? AND nromes = ?", @anio, @mes]).order(sort_column + " " + sort_direction)
  end
  
  def detail
    @nombre = params[:nombre]
    @apellido = params[:apellido]
    @sueldos = Sueldo.where(["nombre = ? AND apellido = ?", @nombre, @apellido]).paginate(:page => params[:page], :per_page => 12).limit(12).order("anio DESC", "nromes DESC")
  end

  def delete
    begin
      Sueldo.delete_all 
      redirect_to sueldos_home_path, notice: "Se logró borrar la tabla de sueldos !"
    rescue
      redirect_to root_url, notice: "Problemas para borrar la tabla de sueldos !"
    end
  end
   
  def import
    begin
      Sueldo.import(params[:file])
      redirect_to sueldos_home_path, notice: "Se logró importar el archivo de sueldos !"
    rescue
      redirect_to root_url, notice: "Problemas con el archivo a importar."
    end
  end    
  
  private

  def sort_column
    Sueldo.column_names.include?(params[:sort]) ? params[:sort] : "liquido"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def sueldo_params
    params.require(:sueldo).permit(:anio, :nromes, :mes, :nombre, :apellido, :cargo, 
                 :asig_mensuales, :salario_familiar, :descuentos_mensuales, :liquido, :fecha_anio, :fecha_nromes)
  end
  
end
