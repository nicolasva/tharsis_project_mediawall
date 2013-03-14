class RepositionAxe
        def initialize(hauteur_y_general)
                @hauteur_y_general = hauteur_y_general
        end

        def reposition_plans(position_y)
                Rails.logger.info "-=-=-=-=-=-=-=-#{@hauteur_y_general} - #{position_y}-=-=-=-=-=-=-=-=-=-=-=-=--"
                @hauteur_y_general - position_y
        end
end
