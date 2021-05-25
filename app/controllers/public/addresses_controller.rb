class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @addresses = current_customer.addresses#ログインユーザーのaddressモデルを全て取得する（命名規則により、モデル名の前にメソッドがある場合addressの頭文字は小文字にする）
    #@addresses = Address.where(address_id: current_customer.id)
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)#createする際は要params。　form_withで入力されたデータはaddress_paramsに渡すことによって情報を守っている。
    @address.customer_id = current_customer.id#上記で指定したaddresテーブルの中のcustomer_idを、現在ログインしているcurrent_customerのidとして保存する
    @address.save
    redirect_to public_addresses_path
  end

  def edit
    @address = Address.find(params[:id])

  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to public_addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :customser_id, :postal_code, :address)
  end

end
