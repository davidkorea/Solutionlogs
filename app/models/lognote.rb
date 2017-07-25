
require 'csv'
class Lognote < ApplicationRecord


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |lognote|
        csv << lognote.attributes.values
      end
    end
  end

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      lognote = find_by(id: row["id"]) || new
      lognote.attributes = row.to_hash
      lognote.save!
    end
  end



end
