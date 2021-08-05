RSpec.describe User, type: :model do
    context 'validation test' do
      it 'ensures first name presence' do
        user = User.new(last_name: 'last', password: 'Hello@123', email: 'sample@example.com').save
        expect(user).to eq(false)
      end
    end

    context 'validation test' do
        it 'ensures last name presence' do
          user = User.new(first_name: 'last', password: 'Hello@123', email: 'sample@example.com').save
          expect(user).to eq(false)
        end
    end

      context 'validation test' do
        it 'ensures email presence' do
          user = User.new(first_name: 'first', last_name: 'last', password: 'Hello@123').save
          expect(user).to eq(false)
        end
    end
end