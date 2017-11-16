module Sat
  module Catalogo
    class UsoCfdi < Base
      self.table_name = 'sat_catalogo_uso_cfdi'
      attr_accessible :sat_id, :descripcion, :aplica_para_tipo_persona, :fecha_inicio_de_vigencia, :fecha_fin_de_vigencia
    end
  end
end
