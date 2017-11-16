module Sat
  module Catalogo
    class PatenteAduanal < Base
      self.table_name = 'sat_catalogo_patente_aduanal'
      attr_accessible :sat_id, :c_patente_aduanal, :inicio_de_vigencia_de_la_patente, :fin_de_vigencia_de_la_patente
    end
  end
end
