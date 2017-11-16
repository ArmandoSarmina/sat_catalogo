module SatCatalogos
  class ServicioController < ApplicationController

    def index
      records = build_klass(params[:catalogo]).search(params[:q])
      render json: records
    end

    private
    def build_klass(klass)
      mapping = {
          'aduana' => Sat::Catalogo::Aduana,
          'clave_prod_serv' => Sat::Catalogo::ClaveProdServ,
          'clave_unidad' => Sat::Catalogo::ClaveUnidad,
          'codigo_postal' => Sat::Catalogo::CodigoPostal,
          'forma_pago' => Sat::Catalogo::FormaPago,
          'impuesto' => Sat::Catalogo::Impuesto,
          'metodo_pago' => Sat::Catalogo::MetodoPago,
          'moneda' => Sat::Catalogo::Moneda,
          'num_pedimento_aduana' => Sat::Catalogo::NumPedimentoAduana,
          'pais' => Sat::Catalogo::Pais,
          'patente_aduanal' => Sat::Catalogo::PatenteAduanal,
          'regimen_fiscal' => Sat::Catalogo::RegimenFiscal,
          'tasa_o_cuota' => Sat::Catalogo::TasaOCuota,
          'tipo_de_comprobante' => Sat::Catalogo::TipoDeComprobante,
          'tipo_factor' => Sat::Catalogo::TipoFactor,
          'tipo_relacion' => Sat::Catalogo::TipoRelacion,
          'uso_cfdi' => Sat::Catalogo::UsoCfdi,
      }[klass] || Sat::Catalogo::Aduana
    end
  end
end
