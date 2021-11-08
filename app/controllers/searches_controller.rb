class SearchesController < ApplicationController
  
  def search
    @value = params["search"]["value"]
    @model = params["search"]["model"]
    @how = params["search"]["how"]
    @datas = search_for(@value, @model, @how)
  end
  
  private
  
  def complete(value, model)
    if model == 'User'
      User.where(name: value)
    elsif model == 'Book'
      Book.where(title: value)
    end
  end
  
  def forward(value, model)
    if model == 'User'
      User.where("name LIKE ?", "#{value}%")
    elsif model == 'Book'
      Book.where("title LIKE ?", "#{value}%")
    end
  end
  
  def backward(value, model)
    if model == 'User'
      User.where("name LIKE ?", "%#{value}")
    elsif model == 'Book'
      Book.where("title LIKE ?", "%#{value}")
    end
  end
  
  def partical(value, model)
    if model == 'User'
      User.where("name LIKE ?", "%#{value}%")
    elsif model == 'Book'
      Book.where("title LIKE ?", "%#{value}%")
    end
  end
end
