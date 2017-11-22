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
    incluirIVATrasladado 'Opcional'
    incluir_iva_trasladado 'Opcional'
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
    c_Estado 'AGU'
    c_Municipio ''
    c_Localidad ''
  end

  factory :catalogo_forma_pago, class: 'Sat::Catalogo::FormaPago' do
    sat_id '28'
    descripcion 'Tarjeta de débito'
    bancarizado 'Sí'
    numeroDeOperacion 'Opcional'
    rFCDelEmisorDeLaCuentaOrdenante 'Opcional'
    cuentaOrdenante 'Opcional'
    patronParaCuentaOrdenante '[0-9]{16}'
    rFCDelEmisorCuentaDeBeneficiario 'Opcional'
    cuentaDeBenenficiario 'Opcional'
    patronParaCuentaBeneficiaria '[0-9]{10,11}|[0-9]{15,16}|[0-9]{18}|[A-Z0-9_]{10,50}'
    tipoCadenaPago 'No'
    nombreDelBancoEmisorDeLaCuentaOrdenanteEnCasoDeExtranjero 'Si el RFC del emisor de la cuenta ordenante es XEXX010101000, este campo es obligatorio.'
    fechaInicioDeVigencia '2017-01-01'
  end

  factory :catalogo_impuesto, class: 'Sat::Catalogo::Impuesto' do
    sat_id '002'
    descripcion 'IVA'
    retencion 'Si'
    traslado 'Si'
    localOFederal 'Federal'
    entidadEnLaQueAplica ''
  end

  factory :catalogo_metodo_pago, class: 'Sat::Catalogo::MetodoPago' do
    sat_id 'PUE'
    descripcion 'Pago en una sola exhibición'
    fechaInicioDeVigencia '2017-01-01'
    fechaFinDeVigencia ''
  end

  factory :catalogo_moneda, class: 'Sat::Catalogo::Moneda' do
    sat_id 'MXN'
    descripcion 'Peso Mexicano'
    decimales '2'
    porcentajeVariacion '05'
    fechaInicioDeVigencia '14/08/2017'
    fechaFinDeVigencia ''
  end

  factory :catalogo_num_pedimento_aduana, class: 'Sat::Catalogo::NumPedimentoAduana' do
    sat_id 'MXN'
    descripcion 'Peso Mexicano'
    decimales '2'
    porcentajeVariacion '05'
    fechaInicioDeVigencia '14/08/2017'
    fechaFinDeVigencia ''
  end

  factory :catalogo_pais, class: 'Sat::Catalogo::Pais' do
    sat_id 'MEX'
    descripcion 'México'
    formatoDeCodigoPostal '[0-9]{5}'
    formatoDeRegistroDeIdentidadTributaria '[A-Z&Ñ]{3,4}[0-9]{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[01])[A-Z0-9]{2}[0\n-9A]'
    validacionDelRegistroDeIdentidadTributaria 'Lista del SAT'
    agrupaciones 'TLCAN'
  end

  factory :catalogo_patente_aduanal, class: 'Sat::Catalogo::PatenteAduanal' do
    sat_id '101'
    c_PatenteAduanal '101'
    inicioDeVigenciaDeLaPatente '21/05/2001'
    finDeVigenciaDeLaPatente ''
  end

  factory :catalogo_regimen_fiscal, class: 'Sat::Catalogo::RegimenFiscal' do
    sat_id '606'
    descripcion 'Arrendamiento'
    fisica 'Sí'
    moral 'No'
    fechaDeInicioDeVigencia '2016-11-12'
    fechaDeFinDeVigencia ''
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
    fechaInicioDeVigencia '2017-01-01'
    fechaFinDeVigencia ''
  end

  factory :catalogo_tipo_de_comprobante, class: 'Sat::Catalogo::TipoDeComprobante' do
    sat_id 'P'
    descripcion 'Pago'
    valorMaximo '999999999999999999.999999'
    fechaInicioDeVigencia ''
    fechaFinDeVigencia '2017-07-29'
  end

  factory :catalogo_tipo_factor, class: 'Sat::Catalogo::TipoFactor' do
    sat_id 'Tasa'
  end

  factory :catalogo_tipo_relacion, class: 'Sat::Catalogo::TipoRelacion' do
    sat_id '01'
    descripcion 'Nota de crédito de los documentos relacionados'
    fechaInicioDeVigencia '2017-01-01'
    fechaFinDeVigencia ''
  end

  factory :catalogo_uso_cfdi, class: 'Sat::Catalogo::UsoCfdi' do
    sat_id 'I04'
    descripcion 'Equipo de computo y accesorios'
    aplicaParaTipoPersona 'Sí'
    fechaInicioDeVigencia 'Sí'
    fechaFinDeVigencia '2017-01-01'
  end
end
