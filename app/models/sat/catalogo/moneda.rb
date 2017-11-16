module Sat
  module Catalogo
    class Moneda < Base
      self.table_name = 'sat_catalogo_moneda'
      attr_accessible :sat_id, :descripcion, :decimales, :porcentaje_variacion, :fecha_inicio_de_vigencia, :fecha_fin_de_vigencia
    end
  end
end
