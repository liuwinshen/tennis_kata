require_relative './tennis'

RSpec.describe TennisGame2 do
	let(:game) { TennisGame2.new('Ryan1', 'Verner2') }

	describe '#set_p1_score' do
		context 'when the number passed in is 3' do
			it 'sets the score of player1 to 3' do
				game.set_p1_score(3)
				expect(game.p1_points).to eq 3
			end
		end
	end

	describe '#score' do
		context 'when Ryan1 has at least 4 points and 2 more than Verner2' do
			it 'returns Win for Ryan1' do
				game.set_p1_score(4)
				game.set_p2_score(2)

				expect(game.score).to eq 'Win for Ryan1'
			end
		end

		context 'when Ryan1 has at least 4 points and 1 more than Verner2' do
			it 'returns Advantage for Ryan1' do
				game.set_p1_score(4)
				game.set_p2_score(3)

				expect(game.score).to eq 'Advantage Ryan1'
			end
		end

		context 'when Ryan1 has 2 points and Verner2 has 1 points' do
			it 'returns Forty-Thirty' do
				game.set_p1_score(2)
				game.set_p2_score(1)

				expect(game.score).to eq 'Thirty-Fifteen'
			end
		end

		context 'when Ryan1 has 3 points and Verner2 has 3 points' do
			it 'returns Deuce' do
				game.set_p1_score(3)
				game.set_p2_score(3)

				expect(game.score).to eq 'Deuce'
			end
		end

		context 'when Ryan1 has 0 points and Verner2 has 0 points' do
			it 'returns Love-All' do
				game.set_p1_score(0)
				game.set_p2_score(0)

				expect(game.score).to eq 'Love-All'
			end
		end

	end
end 