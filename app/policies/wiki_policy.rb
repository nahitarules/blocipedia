class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
  user.present? ||  @record.user == user
  end

  private

    def wiki
      record
    end
end
