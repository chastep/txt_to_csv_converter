require 'csv'
require 'json'

class Document < ApplicationRecord
	attr_accessor :original
	mount_uploader :original, OriginalUploader

	def to_csv
		headers = []
		values = []
		File.readlines(self.original.file.file).each do |f|
      hash = JSON.parse(f)
      headers << hash.keys
      values << hash.values
		end

		CSV.generate(headers: true) do |csv|
      csv << headers.flatten.uniq
      values.each { |v| csv << v }
		end
	end

end
