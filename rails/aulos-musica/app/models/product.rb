class Product < ActiveRecord::Base
  has_and_belongs_to_many :lists

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)        
      end
    end

  end

  def self.import(file)
    CSV.foreach(file.path,headers: true) do |row|
      product = find_by_id(row["id"]) || new
      product.attributes = row.to_hash
      product.save!
    end

  end
end
