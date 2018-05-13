class Show < ActiveRecord::Base
    
    def attributes
        attributes = {
            name: "Rick and Morty",
            day: "Thursday",
            network: "Adult Swim",
            rating: 10
            #season: "Ten"
        }
            rick_and_morty = Show.new(attributes)
            rick_and_morty.save
    end


    def highest_rating
            Show.maximum(:rating)
    end

    def most_popular_show

        Show.where("rating = ?", highest_rating)

    end

    def lowest_rating
        Show.minimum(:rating)
    end

    def least_popular_show
        Show.where("rating = ?", lowest_rating)
    end

    def ratings_sum
        Show.sum(:rating)
    end

    def popular_shows
        Show.where("rating > ?", 5)
    end

    def shows_by_alphabetical_order
        Show.order(name: :desc)
        #Show.order(name: :asc)
    end
end