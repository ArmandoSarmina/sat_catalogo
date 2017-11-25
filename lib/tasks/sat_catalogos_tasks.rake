require 'active_record'

desc "Actualiza catalogos de SAT desde https://github.com/bambucode/catalogos_sat_JSON"
namespace :sat_catalogos do
  desc "Descarga y actualiza los catalogos"
  task actualiza: :environment do
    catalogos.each do |modelo, catalogo|
      puts "Working with #{base_path.gsub('%d', catalogo)}"
      json = open(base_path.gsub('%d', catalogo)).read
      parsed = ActiveSupport::JSON.decode(json)

      klass = "Sat::Catalogo::#{modelo.camelize}".constantize
      klass.transaction do
        parsed.each do |record|
          new_record = klass.find(record[:id]) rescue klass.create(id: record["id"])
          attributes = record.except("id").inject({}) {|f, (k, v)| f[k.underscore[0..63]] = v; f}
          new_record.update_attributes(attributes.merge(sat_id: record["id"]))
        end
      end
    end
  end

  desc "Descarga y actualiza los catalogos. ej. sat_catalogos:crea_registros[aduana]"
  task :crea_registros, [:catalogo] => :environment do |_task, args|
    require "activerecord-import/base"
    catalogo = args.catalogo
    catalogos_seleccionados = catalogo ? catalogos.keep_if{ |k,v| k == catalogo } : catalogos

    catalogos_seleccionados.each do |modelo, catalogo|
      puts "Working with #{base_path.gsub('%d', catalogo)}"
      json = open(base_path.gsub('%d', catalogo)).read
      parsed = ActiveSupport::JSON.decode(json)

      klass = "Sat::Catalogo::#{modelo.camelize}".constantize
      klass.transaction do
        columns = []
        columns += [:sat_id] if parsed.first.has_key?('id')
        columns += parsed.first.except("id").keys.map() {|k, v| k.underscore[0..63]}
        klass.import columns, parsed.map(&:values), validate: false
      end
    end
  end

  desc "Crea las migraciones iniciales"
  task :genera_migraciones => :environment do
    file = Dir.foreach(File.join(Rails.root, 'db', 'migrate')).select{ |file| /create_sat_catalogos/.match(file) }

    if file.any?
      migration_text = "class AddNewSatCatalogosAttributes < ActiveRecord::Migration \n"
      migration_text << "  def up\n"
      file_name = ""

      catalogos.keys.each do |catalogo|
        puts "Abriendo... #{base_path.gsub('%d', catalogos[catalogo])}"
        json = open(base_path.gsub('%d', catalogos[catalogo])).read
        parsed = ActiveSupport::JSON.decode(json)
        columns = parsed.first.keys

        if defined?("Sat::Catalogo::#{catalogo.camelize}".constantize)
          old_columns = "Sat::Catalogo::#{catalogo.camelize}".constantize.columns.map(&:name)
          new_columns = columns.map(&:underscore) - old_columns

          new_columns.each do |column|
            migration_text << "    add_column :sat_catalogo_#{catalogo}, :#{column.underscore.downcase}, :string \n"
          end if new_columns.any?
        end
      end
      migration_text << "  end \n\n"

      migration_text << "  def down \n"
      catalogos.keys.each do |catalogo|
        json = open(base_path.gsub('%d', catalogos[catalogo])).read
        parsed = ActiveSupport::JSON.decode(json)
        columns = parsed.first.keys

        if defined?("Sat::Catalogo::#{catalogo.camelize}".constantize)
          old_columns = "Sat::Catalogo::#{catalogo.camelize}".constantize.columns.map(&:name)
          new_columns = columns.map(&:underscore) - old_columns

          new_columns.each do |column|
            migration_text << "    remove_column :sat_catalogo_#{catalogo}, :#{column.underscore.downcase} \n"
          end  if new_columns.any?
        end
      end
      migration_text << "  end \n"
      migration_text << "end \n"

      puts "Generando el archivo"
      file_name = File.join(Rails.root, 'db/migrate', "#{Time.now.strftime('%Y%m%d%H%M%S')}_add_new_sat_catalogos_attributes.rb")
      open(file_name, 'w') do |file|
        file.puts migration_text
      end
    else
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
          migration_text << build_column_definition(column)
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
    puts "attr_accessor :#{Sat::Catalogo::UsoCfdi.columns.map(&:name)[1..-1].join(', :')}"
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

  def build_column_definition(column)
    if column == "id"
      nil
    else
      "      t.#{column_type_mapping(column)} :#{column.underscore[0..63]} \n"
    end
  end

  def column_type_mapping(column)
    {
        'description' => 'text'
    }[column] || 'string'
  end
end