module Sat
  module Catalogo
    class Aduana < Base
      self.table_name = 'sat_catalogo_aduana'
      attr_accessible :sat_id, :descripcion
    end
  end
end
