module Sat
  module Catalogo
    class Base < ActiveRecord::Base
      self.abstract_class = true

      def self.search(params)
        keyword = params[:term]
        per_page = params.has_key?(:per_page) ? params[:per_page] : 20
        conditions = searchable_columns.map do |column|
          "#{column} like :keyword"
        end.join(' OR ')
        results = limit(per_page)
        results = results.where(conditions, keyword: "%#{keyword}%") if keyword.present?
        results
      end

      def self.searchable_columns
        [:descripcion, :sat_id]
      end

      def as_json
        { label: descripcion, value: sat_id }
      end
    end
  end
end
