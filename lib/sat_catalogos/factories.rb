FactoryBot.define do
  factory :catalogo_aduana, class: 'Sat::Catalogo::Aduana' do
    sat_id '48'
    descripcion 'GUADALAJARA, TLACOMULCO DE ZUÑIGA, JALISCO.'
  end

  factory :catalogo_clave_prod_serv, class: 'Sat::Catalogo::ClaveProdServ' do
    sat_id '10101514'
    descripcion 'Primates'
    fecha_inicio_vigencia '2017-08-14'
    fecha_fin_vigencia ''
    incluir_iva_trasladado 'Opcional'
    incluir_ieps_trasladado 'Opcional'
    complemento_que_debe_incluir ''
  end

  factory :catalogo_clave_unidad, class: 'Sat::Catalogo::ClaveUnidad' do
    sat_id 'CMK'
    nombre 'Centímetro cuadrado'
    descripcion 'Medida de longitud, de símbolo cm, que es igual a la centésima parte de un metro.'
    nota ''
    fecha_de_inicio_de_vigencia '2017-01-01'
    fecha_de_fin_de_vigencia ''
    simbolo 'cm²'
  end

  factory :catalogo_codigo_postal, class: 'Sat::Catalogo::CodigoPostal' do
    sat_id '20001'
    c_estado 'AGU'
    c_municipio ''
    c_localidad ''
  end

  factory :catalogo_forma_pago, class: 'Sat::Catalogo::FormaPago' do
    sat_id '28'
    descripcion 'Tarjeta de débito'
    bancarizado 'Sí'
    numero_de_operacion 'Opcional'
    r_fc_del_emisor_de_la_cuenta_ordenante 'Opcional'
    cuenta_ordenante 'Opcional'
    patron_para_cuenta_ordenante '[0-9]{16}'
    r_fc_del_emisor_cuenta_de_beneficiario 'Opcional'
    cuenta_de_benenficiario 'Opcional'
    patron_para_cuenta_beneficiaria '[0-9]{10,11}|[0-9]{15,16}|[0-9]{18}|[A-Z0-9_]{10,50}'
    tipo_cadena_pago 'No'
    nombre_del_banco_emisor_de_la_cuenta_ordenante_en_caso_de_extran 'Si el RFC del emisor de la cuenta ordenante es XEXX010101000, este campo es obligatorio.'
    fecha_inicio_de_vigencia '2017-01-01'
  end

  factory :catalogo_impuesto, class: 'Sat::Catalogo::Impuesto' do
    sat_id '002'
    descripcion 'IVA'
    retencion 'Si'
    traslado 'Si'
    local_o_federal 'Federal'
    entidad_en_la_que_aplica ''
  end

  factory :catalogo_metodo_pago, class: 'Sat::Catalogo::MetodoPago' do
    sat_id 'PUE'
    descripcion 'Pago en una sola exhibición'
    fecha_inicio_de_vigencia '2017-01-01'
    fecha_fin_de_vigencia ''
  end

  factory :catalogo_moneda, class: 'Sat::Catalogo::Moneda' do
    sat_id 'MXN'
    descripcion 'Peso Mexicano'
    decimales '2'
    porcentaje_variacion '05'
    fecha_inicio_de_vigencia '14/08/2017'
    fecha_fin_de_vigencia ''
  end

  factory :catalogo_num_pedimento_aduana, class: 'Sat::Catalogo::NumPedimentoAduana' do
    sat_id 'MXN'
    descripcion 'Peso Mexicano'
    decimales '2'
    porcentaje_variacion '05'
    fecha_inicio_de_vigencia '14/08/2017'
    fecha_fin_de_vigencia ''
  end

  factory :catalogo_pais, class: 'Sat::Catalogo::Pais' do
    sat_id 'MEX'
    descripcion 'México'
    formato_de_codigo_postal '[0-9]{5}'
    formato_de_registro_de_identidad_tributaria '[A-Z&Ñ]{3,4}[0-9]{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[01])[A-Z0-9]{2}[0\n-9A]'
    validacion_del_registro_de_identidad_tributaria 'Lista del SAT'
    agrupaciones 'TLCAN'
  end

  factory :catalogo_patente_aduanal, class: 'Sat::Catalogo::PatenteAduanal' do
    sat_id '101'
    c_patente_aduanal '101'
    inicio_de_vigencia_de_la_patente '21/05/2001'
    fin_de_vigencia_de_la_patente ''
  end

  factory :catalogo_regimen_fiscal, class: 'Sat::Catalogo::RegimenFiscal' do
    sat_id '606'
    descripcion 'Arrendamiento'
    fisica 'Sí'
    moral 'No'
    fecha_inicio_de_vigencia '2016-11-12'
    fecha_fin_de_vigencia ''
  end

  factory :catalogo_tasa_o_cuota, class: 'Sat::Catalogo::TasaOCuota' do
    sat_id 'Fijo'
    rangoOFijo 'Fijo'
    minimo ''
    maximo '00'
    impuesto 'IVA'
    factor 'Tasa'
    traslado 'Sí'
    retencion 'No'
    fecha_inicio_de_vigencia '2017-01-01'
    fecha_fin_de_vigencia ''
  end

  factory :catalogo_tipo_de_comprobante, class: 'Sat::Catalogo::TipoDeComprobante' do
    sat_id 'P'
    descripcion 'Pago'
    valor_maximo '999999999999999999.999999'
    fecha_inicio_de_vigencia ''
    fecha_fin_de_vigencia '2017-07-29'
  end

  factory :catalogo_tipo_factor, class: 'Sat::Catalogo::TipoFactor' do
    sat_id 'Tasa'
  end

  factory :catalogo_tipo_relacion, class: 'Sat::Catalogo::TipoRelacion' do
    sat_id '01'
    descripcion 'Nota de crédito de los documentos relacionados'
    fecha_inicio_de_vigencia '2017-01-01'
    fecha_fin_de_vigencia ''
  end

  factory :catalogo_uso_cfdi, class: 'Sat::Catalogo::UsoCfdi' do
    sat_id 'I04'
    descripcion 'Equipo de computo y accesorios'
    aplica_para_tipo_persona 'Sí'
    fecha_inicio_de_vigencia 'Sí'
    fecha_fin_de_vigencia '2017-01-01'
  end
end
