module Sat
  module Catalogo
    class TipoRelacion < Base
      self.table_name = 'sat_catalogo_tipo_relacion'
      attr_accessible :sat_id, :descripcion, :fecha_inicio_de_vigencia, :fecha_fin_de_vigencia
    end
  end
end
