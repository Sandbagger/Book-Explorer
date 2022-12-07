class BooksUploadPolicy < ApplicationPolicy
  def index?
    @user.present? && true
  end

  def new?
    @user.present? && true
  end

  def create?
    @user.present? && true
  end

  def show?
    @user.present? && true
  end
end