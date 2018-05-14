class DocumentsController < ApplicationController

	def new
		@document = Document.new
	end

	def create
		@document = Document.new(document_params)
    if @document.save
			send_data @document.to_csv, filename: "#{@document.original.filename.chomp('.txt')}.csv"
    else
	    @errors = @document.errors.full_messages
			render 'new'
    end
  end

  private

  def document_params
    params.require(:document).permit(:original)
  end

end
