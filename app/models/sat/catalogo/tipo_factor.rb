module Sat
  module Catalogo
    class TipoFactor < Base
      self.table_name = 'sat_catalogo_tipo_factor'
      attr_accessible :sat_id
    end
  end
end
