class TeacherPolicy < ApplicationPolicy
  
  def index?
    @current_user.administrator?    
  end

  def new?
    @current_user.administrator?    
  end

  def show?
    @current_user.administrator? or @current_user == @user    
  end

  def update?
    @current_user.administrator? || @current_user === @user    
  end  

  def edit?
    @current_user.administrator? || @current_user === @user    
  end  

  def create?
    @current_user.administrator?    
  end

  def destroy?
    @current_user.administrator?    
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

end
