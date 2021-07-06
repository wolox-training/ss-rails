class RankingSerializer < BookSerializer
  attributes :times_rented

  def times_rented
    object.rents.count
  end
end
