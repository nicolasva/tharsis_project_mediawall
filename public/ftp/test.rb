class Test
	attr_reader :nb
	def initialize(nb)
		@nb = nb
	end
end

test = Test.new(12)
puts test.nb
