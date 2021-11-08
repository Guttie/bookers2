class SearchesController < ApplicationController

  def search
    @value = params["search"]["value"]
    @model = params["search"]["model"]
    @how = params["search"]["how"]
    @datas = search_for(@value, @model, @how)
  end

  private

  def complete(value, model)
    if model == 'user'
      User.where(name: value)
    elsif model == 'book'
      Book.where(title: value)
    end
  end

  def forward(value, model)
    if model == 'user'
      User.where("name LIKE ?", "#{value}%")
    elsif model == 'book'
      Book.where("title LIKE ?", "#{value}%")
    end
  end

  def backward(value, model)
    if model == 'user'
      User.where("name LIKE ?", "%#{value}")
    elsif model == 'book'
      Book.where("title LIKE ?", "%#{value}")
    end
  end

  def partial(value, model)
    if model == 'user'
      User.where("name LIKE ?", "%#{value}%")
    elsif model == 'book'
      Book.where("title LIKE ?", "%#{value}%")
    end
  end

  def search_for(value, model, how)
    case how
    when 'complete'
      complete(value, model)
    when 'forward'
      forward(value, model)
    when 'backward'
      backward(value, model)
    when 'partial'
      partial(value, model)
    end
  end

end