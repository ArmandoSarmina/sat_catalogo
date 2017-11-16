module Sat
  module Catalogo
    class TipoDeComprobante < Base
      self.table_name = 'sat_catalogo_tipo_de_comprobante'
      attr_accessible :sat_id, :descripcion, :valor_maximo, :fecha_inicio_de_vigencia, :fecha_fin_de_vigencia
    end
  end
end
