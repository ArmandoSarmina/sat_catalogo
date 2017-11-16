module Sat
  module Catalogo
    class ClaveProdServ < Base
      self.table_name = 'sat_catalogo_clave_prod_serv'
      attr_accessible :sat_id, :descripcion, :fecha_inicio_vigencia, :fecha_fin_vigencia, :incluir_iva_trasladado, :incluir_ieps_trasladado, :complemento_que_debe_incluir
     end
  end
end
