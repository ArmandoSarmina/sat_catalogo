module Sat
  module Catalogo
    class NumPedimentoAduana < Base
      self.table_name = 'sat_catalogo_num_pedimento_aduana'
      attr_accessible :sat_id, :c_aduana, :patente, :ejercicio, :cantidad, :fecha_inicio_de_vigencia, :fecha_fin_de_vigencia
    end
  end
end
