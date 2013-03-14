class ProportionImage
        CONF_PATH = "#{RAILS_ROOT}/config/conf_map.yml"
	def initialize(proportion)
		@proportion = proportion.to_f
                @proportionmap = YAML::load_file(CONF_PATH)
	end

        def proportion(value)
                value * (@proportion.to_f < @proportionmap["proportion"].to_f ? @proportionmap["proportion"].to_f : @proportion.to_f)
        end

	def proportionTranslate
		dif_proportion = @proportion - @proportionmap["proportion"].to_f			
		Rails.logger.info "proportiontranslationdefaut-=-=-=-=-=-=-=-=-=-=-=-=-=--#{- @proportionmap["proportiontranslationdefaut"].to_f - (@proportionmap["proportion"].to_f * dif_proportion?)}-=-=-=-=-=-=-"
		- @proportionmap["proportiontranslationdefaut"].to_f - (@proportionmap["difproportiontranslation"].to_f * dif_proportion)

	end

	def proportioncircledefaut
		@proportionmap["proportioncircledefaut"].to_f + (@proportionmap["proportioncircledefaut"] * dif_proportion?)		
	end

	def proportiontextdefaut
		"#{@proportionmap["proportiontextzonedefaut"].to_i + (@proportionmap["proportiontextzonegrossissementdefaut"].to_i * dif_proportion?)}pt"
	end

	def restaureproportion(value)
		value/@proportionmap["proportion"].to_f
	end

	private
	def dif_proportion?	
		@proportion - @proportionmap["proportion"].to_f			
	end
end

