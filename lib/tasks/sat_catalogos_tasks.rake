desc "Actualiza catalogos de SAT desde https://github.com/bambucode/catalogos_sat_JSON"
namespace :sat_catalogos do
  desc "Descarga y actualiza los catalogos"
  task actualiza: :environment do
    catalogos.each do |modelo, catalogo|
      puts "Working with #{base_path.gsub('%d', catalogo)}"
      json = open(base_path.gsub('%d', catalogo)).read
      parsed = ActiveSupport::JSON.decode(json)
      parsed.each do |record|
        klass = "Sat::Catalogo::#{modelo.classify}".constantize
        new_record = klass.find(record[:id]) rescue klass.create(id: record["id"])
        attributes = record.except("id").inject({}) {|f, (k, v)| f[k.underscore[0..63]] = v ; f}
        new_record.update_attributes(attributes.merge(sat_id: record["id"]))
      end
    end
  end

  desc "Crea las migraciones iniciales"
  task :genera_migraciones do
    migration_text = "class CreateSatCatalogos < ActiveRecord::Migration \n"
    migration_text << "  def up\n"
    catalogos.keys.each do |catalogo|
      puts "Abriendo... #{base_path.gsub('%d', catalogos[catalogo])}"
      json = open(base_path.gsub('%d', catalogos[catalogo])).read
      parsed = ActiveSupport::JSON.decode(json)
      columns = parsed.first.keys
      migration_text << "    create_table :sat_catalogo_#{catalogo} do |t| \n"
      migration_text << "      t.string :sat_id\n"
      columns.each do |column|
        next if column == "id"
        if  column == "descripcion"
          migration_text << "      t.text :#{column.underscore[0..63]} \n"
        else
          migration_text << "      t.string :#{column.underscore[0..63]} \n"
        end
      end
      migration_text << "    end\n\n"
    end
    migration_text << "  end \n\n"
    migration_text << "  def down \n"
    catalogos.keys.each do |catalogo|
      migration_text << "    drop_table :sat_catalogo_#{catalogo}\n"
    end
    migration_text << "  end \n\n"
    migration_text << "end \n"

    puts "Generando el archivo"
    file_name = File.join(Rails.root, 'db/migrate', "#{Time.now.strftime('%Y%m%d%H%M%S')}_create_sat_catalogos.rb")
    open(file_name, 'w') do |file|
      file.puts migration_text
    end
    puts "Listo! lo puedes encontrar aqui: #{file_name}"
  end

  desc "Actualiza los attribute accessors en los modelos"
  task attribute_accessors: :environment do
    puts "attr_accessor :#{Sat::Catalogo::Aduana.columns.map(&:name)[1..-1].join(', :')}"
    puts "attr_accessor :#{Sat::Catalogo::ClaveProdServ.columns.map(&:name)[1..-1].join(', :')}"
    puts "attr_accessor :#{Sat::Catalogo::ClaveUnidad.columns.map(&:name)[1..-1].join(', :')}"
    puts "attr_accessor :#{Sat::Catalogo::CodigoPostal.columns.map(&:name)[1..-1].join(', :')}"
    puts "attr_accessor :#{Sat::Catalogo::FormaPago.columns.map(&:name)[1..-1].join(', :')}"
    puts "attr_accessor :#{Sat::Catalogo::Impuesto.columns.map(&:name)[1..-1].join(', :')}"
    puts "attr_accessor :#{Sat::Catalogo::MetodoPago.columns.map(&:name)[1..-1].join(', :')}"
    puts "attr_accessor :#{Sat::Catalogo::Moneda.columns.map(&:name)[1..-1].join(', :')}"
    puts "attr_accessor :#{Sat::Catalogo::NumPedimentoAduana.columns.map(&:name)[1..-1].join(', :')}"
    puts "attr_accessor :#{Sat::Catalogo::Pais.columns.map(&:name)[1..-1].join(', :')}"
    puts "attr_accessor :#{Sat::Catalogo::PatenteAduanal.columns.map(&:name)[1..-1].join(', :')}"
    puts "attr_accessor :#{Sat::Catalogo::RegimenFiscal.columns.map(&:name)[1..-1].join(', :')}"
    puts "attr_accessor :#{Sat::Catalogo::TasaOCuota.columns.map(&:name)[1..-1].join(', :')}"
    puts "attr_accessor :#{Sat::Catalogo::TipoDeComprobante.columns.map(&:name)[1..-1].join(', :')}"
    puts "attr_accessor :#{Sat::Catalogo::TipoFactor.columns.map(&:name)[1..-1].join(', :')}"
    puts "attr_accessor :#{Sat::Catalogo::TipoRelacion.columns.map(&:name)[1..-1].join(', :')}"
    puts "attr_accessor :#{Sat::Catalogo::UsoCFDI.columns.map(&:name)[1..-1].join(', :')}"
  end

  def catalogos
    {
        "aduana" => "c_Aduana",
        "clave_prod_serv" => "c_ClaveProdServ",
        "clave_unidad" => "c_ClaveUnidad",
        "codigo_postal" => "c_CodigoPostal",
        "forma_pago" => "c_FormaPago",
        "impuesto" => "c_Impuesto",
        "metodo_pago" => "c_MetodoPago",
        "moneda" => "c_Moneda",
        "num_pedimento_aduana" => "c_NumPedimentoAduana",
        "pais" => "c_Pais",
        "patente_aduanal" => "c_PatenteAduanal",
        "regimen_fiscal" => "c_RegimenFiscal",
        "tasa_o_cuota" => "c_TasaOCuota",
        "tipo_de_comprobante" => "c_TipoDeComprobante",
        "tipo_factor" => "c_TipoFactor",
        "tipo_relacion" => "c_TipoRelacion",
        "uso_cfdi" => "c_UsoCFDI"
    }
  end

  def base_path
    "https://raw.githubusercontent.com/bambucode/catalogos_sat_JSON/master/%d.json"
  end
end



