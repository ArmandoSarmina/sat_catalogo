module Sat
  module Catalogo
    class RegimenFiscal < Base
      self.table_name = 'sat_catalogo_regimen_fiscal'
      attr_accessible :sat_id, :descripcion, :fisica, :moral, :fecha_de_inicio_de_vigencia, :fecha_de_fin_de_vigencia
    end
  end
end
