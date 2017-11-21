module Sat
  module Catalogo
    class Base < ActiveRecord::Base
      self.abstract_class = true

      def self.search(keyword)
        conditions = searchable_columns.map do |column|
          "#{column} like :keyword"
        end.join(' OR ')
        where(conditions, keyword: "%#{keyword}%").limit(20)
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
