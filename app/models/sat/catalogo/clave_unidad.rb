module Sat
  module Catalogo
    class ClaveUnidad < Base
      self.table_name = 'sat_catalogo_clave_unidad'
      attr_accessible :sat_id, :nombre, :descripcion, :nota, :fecha_de_inicio_de_vigencia, :fecha_de_fin_de_vigencia, :simbolo

      def as_json
        { label: name, value: sat_id }
      end
    end
  end
end
