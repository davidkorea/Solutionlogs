
require 'csv'
class Lognote < ApplicationRecord

  mount_uploader :image, ImageUploader

  def self.to_csv(options = {})
    desired_columns = ["caseid", "title", "description", "organization", "customertype",
    "opco", "calldate", "handled_by", "be_resolved", "source", 'attachment']
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |lognote|
        csv << lognote.attributes.values_at(*desired_columns)
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

  belongs_to :user

  PRODUCT = ["AWMS2", "AWMS1"]
  validates_inclusion_of :product, :in => PRODUCT

  CUSTTYPE = ["End User", "SA", "Sales", "ASP"]
  validates_inclusion_of :customertype, :in => CUSTTYPE

  OPCO = ["China", "Korea", "Hong Kong"]
  validates_inclusion_of :opco, :in => OPCO

  HANDLEBY = ["Andy Tsao", "David Liu", "Other"]
  validates_inclusion_of :handled_by, :in => HANDLEBY

  SOURCE = ["C-Web", "E-mail", "ASP", "Wechat"]
  validates_inclusion_of :source, :in => SOURCE


end
