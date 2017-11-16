module Sat
  module Catalogo
    class Impuesto < Base
      self.table_name = 'sat_catalogo_impuesto'
      attr_accessible :sat_id, :descripcion, :retencion, :traslado, :local_o_federal, :entidad_en_la_que_aplica
    end
  end
end
