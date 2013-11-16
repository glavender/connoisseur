require 'open-uri'

class ProductsController < ApplicationController
  helper ProductsHelper
  def index
    products_json = open('http://lcboapi.com/products?page=' + "#{params[:page]}").read
    @products = JSON.parse(products_json)
  end

  def show
    product_json = open('http://lcboapi.com/products/' + "#{params[:id]}").read
    @product = JSON.parse(product_json)
    locations_json = open('http://lcboapi.com/products/' + "#{params[:id]}" + '/stores').read
    @locations = JSON.parse(locations_json)
    inventories_json = open('http://lcboapi.com/products/' + "#{params[:id]}" + '/inventories').read
    @inventories = JSON.parse(inventories_json)
  end


end
