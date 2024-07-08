

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Handle guest user (not logged in)

    if user.manager?
      can :manage, Project, manager_id: user.id
      can :read, ProjectAssignment, project: { manager_id: user.id }
      can :read, Bug

    elsif user.qa?
      can :read, Project, id: user.projects.pluck(:id)
      can :manage, Bug , qa_id: user.id

    elsif user.developer?
      can :read, Project
      can :manage, Bug
      cannot [:create, :delete], Bug
    end

    # Additional code can be added here for other roles or fallback permissions

  end
end
