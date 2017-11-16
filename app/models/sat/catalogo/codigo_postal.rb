module Sat
  module Catalogo
    class CodigoPostal < Base
      self.table_name = 'sat_catalogo_codigo_postal'
      attr_accessible :sat_id, :c_estado, :c_municipio, :c_localidad

      def self.searchable_columns
        [:c_estado, :sat_id]
      end
    end
  end
end
