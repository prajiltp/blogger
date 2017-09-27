class BlogPolicy < ApplicationPolicy
  def edit?
  	record.author == @user
  end

  def delete?
  	record.author == @user
  end

  def update?
  	record.author == @user
  end
end
