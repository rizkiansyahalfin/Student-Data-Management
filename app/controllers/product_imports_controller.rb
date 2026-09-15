class ProductImportsController < ApplicationController
  def new
    @product_import = ProductImport.new if defined?(ProductImport)
  end

  def create
    if defined?(ProductImport)
      @product_import = ProductImport.new(params[:product_import])
      if @product_import.save
        redirect_to root_url, notice: "Imported products successfully."
      else
        render :new
      end
    else
      redirect_to root_url, alert: "Product import is not implemented."
    end
  end
end

