class LinxesController < ApplicationController
  def search
    search_linx = if params[:search].present?
                    params[:search][:linx]
                  else
                    params[:linx]
                  end

    # try to locate the linx
    linx = Linx.get(search_linx)

    if linx
      case linx.linx_type
      when 'Transaction'
        _item = Transaction.get(linx.linx)
        redirect_to transaction_path(_item) if _item
      when 'Account'
        _item = Account.get(linx.linx)
        redirect_to account_path(_item) if _item
      when 'Contract'
        _item = Contract.get(linx.linx)
        redirect_to contract_path(_item) if _item
      when 'User'
        _item = User.get(linx.linx)
        redirect_to user_path(_item) if _item
      when 'ExchangeRequest'
        _item = ExchangeRequest.get(linx.linx)
        redirect_to exchange_request_path(_item) if _item
      when 'Address'
        _item = Address.get(linx.linx)
        redirect_to address_path(_item) if _item
      end
    end
  end
end
