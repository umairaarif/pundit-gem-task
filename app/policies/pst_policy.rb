class PstPolicy < ApplicationPolicy
    attr_reader :user, :pst
    def initialize(user,pst)
        @user = user
        @pst = pst
    end
    def create?
        user.admin? || !pst.published
    end
    def update?
        user.admin? || !pst.published
    end
    def new?
    create?
    end
    def edit?
        update?
    end
    def destroy?
        user.admin?
    end
    
end
