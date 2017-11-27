module Sat
  module Catalogo
    class Aduana < Base
      self.table_name = 'sat_catalogo_aduana'
      attr_accessible :sat_id, :descripcion, :fecha_inicio_de_vigencia, :fecha_fin_de_vigencia
    end
  end
end
