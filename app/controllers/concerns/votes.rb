module Votes
  def user_voted?(args)
    user = args[:user]
    votable_id = args[:votable_id]
    type = args[:type]

    votes = user.send(type.to_s.pluralize).map { |v| v.send("#{type}_id") }
    return votes.include?(votable_id)
  end
end
