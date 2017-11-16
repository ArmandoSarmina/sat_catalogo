module Sat
  module Catalogo
    class Pais < Base
      self.table_name = 'sat_catalogo_pais'
      attr_accessible :sat_id, :descripcion, :formato_de_codigo_postal, :formato_de_registro_de_identidad_tributaria, :validacion_del_registro_de_identidad_tributaria, :agrupaciones
    end
  end
end
