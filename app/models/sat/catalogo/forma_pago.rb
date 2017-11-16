module Sat
  module Catalogo
    class FormaPago < Base
      self.table_name = 'sat_catalogo_forma_pago'
      attr_accessible :sat_id, :descripcion, :bancarizado, :numero_de_operacion, :r_fc_del_emisor_de_la_cuenta_ordenante, :cuenta_ordenante, :patron_para_cuenta_ordenante, :r_fc_del_emisor_cuenta_de_beneficiario, :cuenta_de_benenficiario, :patron_para_cuenta_beneficiaria, :tipo_cadena_pago, :nombre_del_banco_emisor_de_la_cuenta_ordenante_en_caso_de_extran, :fecha_inicio_de_vigencia, :fecha_fin_de_vigencia
    end
  end
end
